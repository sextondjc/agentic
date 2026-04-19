# invoke-execute-customization-audit.ps1: Canonical launcher for execute-customization-audit aggregation.
# Usage: ./.github/scripts/powershell/invoke-execute-customization-audit.ps1 [-RootPath <path>] [-ReviewDate <date>]

[CmdletBinding()]
param(
    [Parameter()]
    [string]$RootPath = (Get-Location).Path,

    [Parameter()]
    [string]$ReviewDate = (Get-Date -Format 'yyyy-MM-dd')
)

$ErrorActionPreference = 'Stop'

# Backward-compatible bridge until full internal script rename is completed.
& ./.github/scripts/powershell/invoke-governance-health-overview.ps1 -RootPath $RootPath -ReviewDate $ReviewDate
exit $LASTEXITCODE
