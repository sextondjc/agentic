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

$historyDir = Join-Path $resolvedRoot '.github/skills/skill-review/references/history'
if (Test-Path -LiteralPath $historyDir) {
    foreach ($file in Get-ChildItem -LiteralPath $historyDir -Filter '*-history.md' -File) {
        $content = Get-Content -LiteralPath $file.FullName -Raw
        $dates = @([regex]::Matches($content, '(?m)^###\s+(\d{4}-\d{2}-\d{2})\s+-\s+Review') | ForEach-Object { [datetime]::Parse($_.Groups[1].Value) })
        if (-not $dates -or $dates.Count -eq 0) {
            $dates = @([regex]::Matches($content, '(?m)^-\s+Last Reviewed:\s+(\d{4}-\d{2}-\d{2})\s*$') | ForEach-Object { [datetime]::Parse($_.Groups[1].Value) })
        }
        $last = if ($dates.Count -gt 0) { ($dates | Sort-Object -Descending | Select-Object -First 1) } else { $null }
        $days = if ($null -ne $last) { [int]($today - $last).TotalDays } else { $null }
        $rows.Add([PSCustomObject]@{
            Asset = ($file.Name -replace '-history\.md$', '')
            Type = 'Skill'
            LastReviewDate = if ($last) { $last.ToString('yyyy-MM-dd') } else { '' }
            DaysSinceReview = if ($null -ne $days) { $days } else { '' }
            Status = if ($null -eq $last) { 'Missing Review Date' } elseif ($days -gt $ThresholdDays) { 'Overdue' } else { 'Current' }
        })
    }
}

$auditHistoryPath = Join-Path $resolvedRoot '.docs/changes/customization/reviews/audit-history.md'
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
        $days = [int]($today - $last).TotalDays
        $rows.Add([PSCustomObject]@{
            Asset = $artifact
            Type = 'Customization'
            LastReviewDate = $last.ToString('yyyy-MM-dd')
            DaysSinceReview = $days
            Status = if ($days -gt $ThresholdDays) { 'Overdue' } else { 'Current' }
        })
    }
}

if ($rows.Count -eq 0) { Write-Error 'No review history records found to evaluate.'; exit 1 }
$results = @($rows | Sort-Object Type, Asset)
$results
$violations = @($results | Where-Object { $_.Status -in @('Overdue','Missing Review Date') })
if ($violations.Count -gt 0) {
    Write-Warning "Review recency failed: $($violations.Count) artifact(s) are overdue or missing dates (threshold $ThresholdDays days)."
    exit 1
}

Write-Output "Review recency passed: all tracked artifacts are within $ThresholdDays days."
exit 0
