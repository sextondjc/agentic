# test-review-recency.ps1: Validate review recency for skills and customization artifacts.
# Usage: ./.github/scripts/powershell/test-review-recency.ps1 [-RootPath <path>] [-ThresholdDays <int>]
# Output: PSCustomObject rows with Asset, Type, LastReviewDate, DaysSinceReview, Status. Exits 1 if any overdue/missing.

[CmdletBinding()]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$RootPath = (Get-Location).Path,

    [Parameter()]
    [ValidateRange(1, 3650)]
    [int]$ThresholdDays = 90
)

$ErrorActionPreference = 'Stop'
$resolvedRoot = Resolve-Path -LiteralPath $RootPath -ErrorAction Stop
$today = Get-Date
$rows = [System.Collections.Generic.List[PSCustomObject]]::new()

function Get-HistoryDates {
    param(
        [Parameter(Mandatory)]
        [string]$Content
    )

    $dates = [System.Collections.Generic.List[datetime]]::new()

    foreach ($match in [regex]::Matches($Content, '(?m)^###\s+(\d{4}-\d{2}-\d{2})\s+-\s+Review')) {
        try { $null = $dates.Add([datetime]::ParseExact($match.Groups[1].Value, 'yyyy-MM-dd', $null)) } catch { }
    }

    foreach ($match in [regex]::Matches($Content, '(?m)^-\s+Last Reviewed:\s+(\d{4}-\d{2}-\d{2})\s*$')) {
        try { $null = $dates.Add([datetime]::ParseExact($match.Groups[1].Value, 'yyyy-MM-dd', $null)) } catch { }
    }

    foreach ($match in [regex]::Matches($Content, '(?m)^\|\s*(\d{4}-\d{2}-\d{2})\s*\|')) {
        try { $null = $dates.Add([datetime]::ParseExact($match.Groups[1].Value, 'yyyy-MM-dd', $null)) } catch { }
    }

    foreach ($match in [regex]::Matches($Content, '(?m)^\|\s*(\d{8})\s*\|')) {
        try { $null = $dates.Add([datetime]::ParseExact($match.Groups[1].Value, 'yyyyMMdd', $null)) } catch { }
    }

    return @($dates)
}

function Add-OrUpdateReviewRecord {
    param(
        [Parameter(Mandatory)]
        [hashtable]$Index,
        [Parameter(Mandatory)]
        [string]$Type,
        [Parameter(Mandatory)]
        [string]$Asset,
        [datetime]$LastDate
    )

    $key = "{0}::{1}" -f $Type, $Asset
    if (-not $Index.ContainsKey($key)) {
        $Index[$key] = [PSCustomObject]@{
            Type = $Type
            Asset = $Asset
            LastDate = $LastDate
        }
        return
    }

    $current = $Index[$key]
    if ($null -eq $current.LastDate -or ($null -ne $LastDate -and $LastDate -gt $current.LastDate)) {
        $current.LastDate = $LastDate
    }
}

$latestByAsset = @{}

$historyRoots = @(
    @{ Path = '.github/skills/skill-review/references/history'; Type = 'Skill' },
    @{ Path = '.github/skills/governance-health-overview/references/.artifacts/history'; Type = 'Customization' }
)

foreach ($historyRoot in $historyRoots) {
    $dir = Join-Path $resolvedRoot $historyRoot.Path
    if (-not (Test-Path -LiteralPath $dir)) { continue }

    foreach ($file in Get-ChildItem -LiteralPath $dir -Filter '*-history.md' -File) {
        $content = Get-Content -LiteralPath $file.FullName -Raw
        $dates = @(Get-HistoryDates -Content $content)
        $last = if ($dates.Count -gt 0) { ($dates | Sort-Object -Descending | Select-Object -First 1) } else { $null }
        Add-OrUpdateReviewRecord -Index $latestByAsset -Type $historyRoot.Type -Asset ($file.Name -replace '-history\.md$', '') -LastDate $last
    }
}

$auditHistoryPath = Join-Path $resolvedRoot '.github/skills/execute-customization-audit/references/.artifacts/audit-history.md'
if (Test-Path -LiteralPath $auditHistoryPath) {
    $latestByArtifact = @{}
    foreach ($line in Get-Content -LiteralPath $auditHistoryPath) {
        if ($line -notmatch '^\|\s*\d{8}\s*\|') { continue }
        $cells = $line -split '\|'
        if ($cells.Count -lt 4) { continue }
        $dateRaw = $cells[1].Trim()
        $artifact = $cells[2].Trim()
        if ([string]::IsNullOrWhiteSpace($artifact)) { continue }
        try { $date = [datetime]::ParseExact($dateRaw, 'yyyyMMdd', $null) } catch { continue }
        if (-not $latestByArtifact.ContainsKey($artifact) -or $date -gt $latestByArtifact[$artifact]) { $latestByArtifact[$artifact] = $date }
    }
    foreach ($artifact in $latestByArtifact.Keys | Sort-Object) {
        $last = $latestByArtifact[$artifact]
        Add-OrUpdateReviewRecord -Index $latestByAsset -Type 'Customization' -Asset $artifact -LastDate $last
    }
}

foreach ($record in $latestByAsset.Values | Sort-Object Type, Asset) {
    $days = if ($null -ne $record.LastDate) { [int]($today - $record.LastDate).TotalDays } else { $null }
    $rows.Add([PSCustomObject]@{
        Asset = $record.Asset
        Type = $record.Type
        LastReviewDate = if ($record.LastDate) { $record.LastDate.ToString('yyyy-MM-dd') } else { '' }
        DaysSinceReview = if ($null -ne $days) { $days } else { '' }
        Status = if ($null -eq $record.LastDate) { 'Missing Review Date' } elseif ($days -gt $ThresholdDays) { 'Overdue' } else { 'Current' }
    })
}

if ($rows.Count -eq 0) {
    Write-Warning 'No review history records found to evaluate under .github-local roots; treating as non-blocking for portability.'
    exit 0
}
$results = @($rows | Sort-Object Type, Asset)
$results
$violations = @($results | Where-Object { $_.Status -in @('Overdue','Missing Review Date') })
if ($violations.Count -gt 0) {
    Write-Warning "Review recency failed: $($violations.Count) artifact(s) are overdue or missing dates (threshold $ThresholdDays days)."
    exit 1
}

Write-Output "Review recency passed: all tracked artifacts are within $ThresholdDays days."
exit 0
