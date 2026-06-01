param(
    [Parameter(Mandatory = $true)]
    [string]$SourceCatalogPath,
    [int]$ThresholdDays = 30
)

if (-not (Test-Path -LiteralPath $SourceCatalogPath)) {
    throw "Source catalog not found: $SourceCatalogPath"
}

$content = Get-Content -LiteralPath $SourceCatalogPath -Raw
$matches = [regex]::Matches($content, "\b(\d{4}-\d{2}-\d{2})\b")

if ($matches.Count -eq 0) {
    Write-Error "No ISO dates found in source catalog."
    exit 1
}

$now = Get-Date
$stale = @()
foreach ($match in $matches) {
    $date = [datetime]::ParseExact($match.Value, "yyyy-MM-dd", $null)
    $age = ($now - $date).TotalDays
    if ($age -gt $ThresholdDays) {
        $stale += $match.Value
    }
}

if ($stale.Count -gt 0) {
    Write-Error ("Stale source entries found: " + (($stale | Sort-Object -Unique) -join ", "))
    exit 1
}

Write-Host "All source entries are within freshness threshold."
exit 0
