# test-governance-count-consistency.ps1: Verify overlap artifact asset counts match canonical workspace counts.
# Usage: ./.github/scripts/powershell/test-governance-count-consistency.ps1 [-RootPath <path>] [-OverlapArtifactPath <path>]
# Output: PSCustomObject count comparison rows. Exits 1 when any mismatch is found.

[CmdletBinding()]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$RootPath = (Get-Location).Path,

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$OverlapArtifactPath = '.github/skills/governance-health-overview/references/.artifacts/responsibility-overlap.routing.json'
)

$ErrorActionPreference = 'Stop'
$resolvedRoot = Resolve-Path -LiteralPath $RootPath -ErrorAction Stop
$artifactPath = if ([System.IO.Path]::IsPathRooted($OverlapArtifactPath)) {
    $OverlapArtifactPath
}
else {
    Join-Path -Path $resolvedRoot -ChildPath $OverlapArtifactPath
}

if (-not (Test-Path -LiteralPath $artifactPath)) {
    Write-Error "Overlap artifact not found: $artifactPath"
    exit 1
}

$payload = Get-Content -LiteralPath $artifactPath -Raw | ConvertFrom-Json

$actual = [pscustomobject]@{
    Agents = @(Get-ChildItem -LiteralPath (Join-Path $resolvedRoot '.github/agents') -File -Filter '*.agent.md').Count
    Instructions = @(Get-ChildItem -LiteralPath (Join-Path $resolvedRoot '.github/instructions') -File -Filter '*.instructions.md').Count
    Prompts = @(Get-ChildItem -LiteralPath (Join-Path $resolvedRoot '.github/prompts') -File -Filter '*.prompt.md').Count
    Skills = @(Get-ChildItem -LiteralPath (Join-Path $resolvedRoot '.github/skills') -Recurse -File -Filter 'SKILL.md').Count
}
$actual | Add-Member -NotePropertyName Total -NotePropertyValue ($actual.Agents + $actual.Instructions + $actual.Prompts + $actual.Skills)

$rows = @(
    [pscustomobject]@{ Metric = 'Agents'; Artifact = [int]$payload.AssetCounts.Agents; Actual = $actual.Agents; Match = ([int]$payload.AssetCounts.Agents -eq $actual.Agents) }
    [pscustomobject]@{ Metric = 'Instructions'; Artifact = [int]$payload.AssetCounts.Instructions; Actual = $actual.Instructions; Match = ([int]$payload.AssetCounts.Instructions -eq $actual.Instructions) }
    [pscustomobject]@{ Metric = 'Prompts'; Artifact = [int]$payload.AssetCounts.Prompts; Actual = $actual.Prompts; Match = ([int]$payload.AssetCounts.Prompts -eq $actual.Prompts) }
    [pscustomobject]@{ Metric = 'Skills'; Artifact = [int]$payload.AssetCounts.Skills; Actual = $actual.Skills; Match = ([int]$payload.AssetCounts.Skills -eq $actual.Skills) }
    [pscustomobject]@{ Metric = 'Total'; Artifact = [int]$payload.AssetCounts.Total; Actual = $actual.Total; Match = ([int]$payload.AssetCounts.Total -eq $actual.Total) }
)

$rows
$mismatch = @($rows | Where-Object { -not $_.Match })
if ($mismatch.Count -gt 0) {
    Write-Warning "Governance count consistency failed: $($mismatch.Count) mismatched metric(s)."
    exit 1
}

Write-Output 'Governance count consistency passed: overlap artifact counts match canonical workspace counts.'
exit 0
