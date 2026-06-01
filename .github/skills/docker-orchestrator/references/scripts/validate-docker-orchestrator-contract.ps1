param(
    [Parameter(Mandatory = $true)]
    [string]$ContractFile
)

if (-not (Test-Path -LiteralPath $ContractFile)) {
    throw "Contract file not found: $ContractFile"
}

$content = Get-Content -LiteralPath $ContractFile -Raw

$requiredTokens = @(
    "Objective",
    "In Scope",
    "Out of Scope",
    "Required Outputs",
    "Ownership Matrix",
    "Execution Mode"
)

$missing = @()
foreach ($token in $requiredTokens) {
    if ($content -notmatch [regex]::Escape($token)) {
        $missing += $token
    }
}

if ($missing.Count -gt 0) {
    Write-Error ("Missing required contract sections: " + ($missing -join ", "))
    exit 1
}

Write-Host "Docker orchestrator contract validation passed."
exit 0
