param(
    [Parameter(Mandatory = $true)]
    [string]$ReportFile
)

if (-not (Test-Path -LiteralPath $ReportFile)) {
    throw "Report file not found: $ReportFile"
}

$content = Get-Content -LiteralPath $ReportFile -Raw
$required = @("Build logs", "Security scan reports", "SBOM artifact", "Rollback reference", "Disposition")
$missing = @()

foreach ($item in $required) {
    if ($content -notmatch [regex]::Escape($item)) {
        $missing += $item
    }
}

if ($missing.Count -gt 0) {
    Write-Error ("Missing required evidence references: " + ($missing -join ", "))
    exit 1
}

Write-Host "Quality evidence validation passed."
exit 0
