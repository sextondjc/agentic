# test-global-applyto-rationale.ps1: Ensure global applyTo scope uses explicit rationale in designated instruction files.
# Usage: ./.github/scripts/powershell/test-global-applyto-rationale.ps1 [-RootPath <path>]
# Output: PSCustomObject rows by file. Exits 1 when a required condition is missing.

[CmdletBinding()]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$RootPath = (Get-Location).Path
)

$ErrorActionPreference = 'Stop'
$resolvedRoot = Resolve-Path -LiteralPath $RootPath -ErrorAction Stop

$requiredFiles = @(
    '.github/instructions/request-economy.instructions.md',
    '.github/instructions/security-and-secure-coding.instructions.md'
)

$rows = foreach ($relativePath in $requiredFiles) {
    $fullPath = Join-Path -Path $resolvedRoot -ChildPath $relativePath
    if (-not (Test-Path -LiteralPath $fullPath)) {
        [pscustomobject]@{
            File = $relativePath
            HasGlobalApplyTo = $false
            HasGlobalScopeRationaleSection = $false
            Status = 'MissingFile'
        }
        continue
    }

    $raw = Get-Content -LiteralPath $fullPath -Raw
    $hasApplyTo = ($raw -match "(?m)^applyTo:\s*'\*\*'\s*$") -or ($raw -match '(?m)^applyTo:\s*"\*\*"\s*$')
    $hasRationale = $raw -match '(?m)^##\s+Global Scope Rationale\s*$'

    [pscustomobject]@{
        File = $relativePath
        HasGlobalApplyTo = $hasApplyTo
        HasGlobalScopeRationaleSection = $hasRationale
        Status = if ($hasApplyTo -and $hasRationale) { 'Pass' } else { 'Fail' }
    }
}

$rows
$failed = @($rows | Where-Object { $_.Status -ne 'Pass' })
if ($failed.Count -gt 0) {
    Write-Warning "Global applyTo rationale check failed: $($failed.Count) file(s) out of policy."
    exit 1
}

Write-Output 'Global applyTo rationale check passed.'
exit 0
