# test-asset-naming.ps1: Validate naming policy conformance for .github customization assets.
# Usage: ./.github/scripts/powershell/test-asset-naming.ps1 [-RootPath <path>] [-AssetType all|skills|agents|instructions|prompts]
# Output: PSCustomObject rows with asset naming status. Exits 1 when violations are found.

[CmdletBinding()]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$RootPath = (Get-Location).Path,

    [Parameter()]
    [ValidateSet('all', 'skills', 'agents', 'instructions', 'prompts')]
    [string]$AssetType = 'all'
)

$ErrorActionPreference = 'Stop'
$resolvedRoot = Resolve-Path -LiteralPath $RootPath -ErrorAction Stop
$results = [System.Collections.Generic.List[PSCustomObject]]::new()

function Add-Result([string]$Type,[string]$Name,[string]$Pattern,[string]$Status,[string]$Violation) {
    $results.Add([PSCustomObject]@{ AssetType = $Type; AssetName = $Name; Pattern = $Pattern; Status = $Status; Violation = $Violation })
}

$specs = @(
    @{ Type='skills'; Files=(Get-ChildItem -LiteralPath (Join-Path $resolvedRoot '.github/skills') -Directory -ErrorAction SilentlyContinue); Name={ param($i) $i.Name }; Pattern='^[a-z]+(-[a-z]+)*$'; Note='Expected lowercase kebab or single lowercase token.' },
    @{ Type='agents'; Files=(Get-ChildItem -LiteralPath (Join-Path $resolvedRoot '.github/agents') -Filter '*.agent.md' -File -ErrorAction SilentlyContinue); Name={ param($i) ($i.Name -replace '\.agent\.md$','') }; Pattern='^(orchestrator|[a-z]+(-[a-z]+)*)$'; Note='Expected lowercase kebab; single token allowed for canonical meta-role.' },
    @{ Type='instructions'; Files=(Get-ChildItem -LiteralPath (Join-Path $resolvedRoot '.github/instructions') -Filter '*.instructions.md' -File -ErrorAction SilentlyContinue); Name={ param($i) $i.Name }; Pattern='^[a-z]+(-[a-z]+)*\.instructions\.md$'; Note='Expected <domain> or <domain>-<policy>.instructions.md.' },
    @{ Type='prompts'; Files=(Get-ChildItem -LiteralPath (Join-Path $resolvedRoot '.github/prompts') -Filter '*.prompt.md' -File -ErrorAction SilentlyContinue); Name={ param($i) $i.Name }; Pattern='^[a-z]+(-[a-z]+)*\.prompt\.md$'; Note='Expected task-focused lowercase kebab prompt filename.' }
)

foreach ($spec in $specs) {
    if ($AssetType -ne 'all' -and $AssetType -ne $spec.Type) { continue }
    foreach ($item in $spec.Files) {
        $name = & $spec.Name $item
        if ($name -match $spec.Pattern) { Add-Result $spec.Type $name $spec.Pattern 'Pass' '' }
        else { Add-Result $spec.Type $name $spec.Pattern 'Fail' $spec.Note }
    }
}

if ($results.Count -eq 0) { Write-Error 'No assets discovered for the selected type.'; exit 1 }
$results = @($results | Sort-Object AssetType, AssetName)
$results
$violations = @($results | Where-Object { $_.Status -eq 'Fail' })
if ($violations.Count -gt 0) {
    Write-Warning "Asset naming conformance failed: $($violations.Count) violation(s) found."
    exit 1
}

Write-Output 'Asset naming conformance passed.'
exit 0
