# test-source-catalog-freshness.ps1: Validate freshness of sync-* source catalog rows.
# Usage: ./.github/scripts/powershell/test-source-catalog-freshness.ps1 [-RootPath <path>] [-ThresholdDays <int>]
# Output: PSCustomObject rows with catalog/source recency status. Exits 1 if stale or missing.

[CmdletBinding()]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$RootPath = (Get-Location).Path,

    [Parameter()]
    [ValidateRange(1, 3650)]
    [int]$ThresholdDays = 30
)

$ErrorActionPreference = 'Stop'
$resolvedRoot = Resolve-Path -LiteralPath $RootPath -ErrorAction Stop
$today = Get-Date
$catalogs = @(
    '.github/skills/sync-customizations/references/source-catalog.md',
    '.github/skills/sync-skills/references/source-catalog.md'
)
$results = [System.Collections.Generic.List[PSCustomObject]]::new()

foreach ($catalogRel in $catalogs) {
    $catalogPath = Join-Path $resolvedRoot $catalogRel
    if (-not (Test-Path -LiteralPath $catalogPath)) {
        $results.Add([PSCustomObject]@{ Catalog = $catalogRel; Source = ''; LastEvaluated = ''; DaysOverdue = ''; Status = 'Missing Catalog' })
        continue
    }

    $lines = Get-Content -LiteralPath $catalogPath
    foreach ($line in $lines) {
        if ($line -notmatch '^\|' -or $line -match '^\|---') { continue }
        $cells = $line -split '\|'
        if ($cells.Count -lt 7) { continue }
        $source = $cells[1].Trim()
        $lastEvaluatedRaw = $cells[5].Trim()
        if (-not $source -or $source -eq 'Source') { continue }

        $status = 'Current'
        $daysOverdue = 0
        try {
            $last = [datetime]::ParseExact($lastEvaluatedRaw, 'yyyy-MM-dd', $null)
            $ageDays = [int]($today - $last).TotalDays
            if ($ageDays -gt $ThresholdDays) {
                $status = 'Needs Review'
                $daysOverdue = $ageDays - $ThresholdDays
            }
        } catch {
            $status = 'Invalid Date'
            $daysOverdue = ''
        }

        $results.Add([PSCustomObject]@{
            Catalog = $catalogRel
            Source = $source
            LastEvaluated = $lastEvaluatedRaw
            DaysOverdue = $daysOverdue
            Status = $status
        })
    }
}

if ($results.Count -eq 0) { Write-Error 'No source catalog rows were parsed.'; exit 1 }
$results = @($results | Sort-Object Catalog, Source)
$results
$violations = @($results | Where-Object { $_.Status -in @('Missing Catalog', 'Needs Review', 'Invalid Date') })
if ($violations.Count -gt 0) {
    Write-Warning "Source catalog freshness failed: $($violations.Count) violation(s) found (threshold $ThresholdDays days)."
    exit 1
}

Write-Output 'Source catalog freshness passed.'
exit 0
