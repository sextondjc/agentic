# test-artifact-reference-hygiene.ps1: Flag unreferenced governance artifact files.
# Usage: ./.github/scripts/powershell/test-artifact-reference-hygiene.ps1 [-RootPath <path>] [-ArtifactsPath <path>]
# Output: PSCustomObject rows with artifact path and reference evidence. Exits 1 if stale artifacts are found.

[CmdletBinding()]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$RootPath = (Get-Location).Path,

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$ArtifactsPath = '.github/skills/execute-customization-audit/references/.artifacts'
)

$ErrorActionPreference = 'Stop'

$resolvedRoot = (Resolve-Path -LiteralPath $RootPath -ErrorAction Stop).Path
$resolvedArtifactsPath = [System.IO.Path]::GetFullPath((Join-Path -Path $resolvedRoot -ChildPath $ArtifactsPath))

if (-not (Test-Path -LiteralPath $resolvedArtifactsPath)) {
    Write-Output "Artifacts path not found: $resolvedArtifactsPath"
    exit 0
}

$artifactFiles = @(Get-ChildItem -LiteralPath $resolvedArtifactsPath -File | Sort-Object Name)
if ($artifactFiles.Count -eq 0) {
    Write-Output "No artifact files found under: $resolvedArtifactsPath"
    exit 0
}

$searchFiles = @(
    Get-ChildItem -LiteralPath $resolvedRoot -Recurse -File |
        Where-Object {
            $_.FullName -notlike '*\.git\*' -and
            $_.FullName -notlike '*\.github\skills\execute-customization-audit\references\.artifacts\*'
        }
)

$results = foreach ($artifact in $artifactFiles) {
    $referenceHits = @(
        $searchFiles |
            Select-String -Pattern $artifact.Name -SimpleMatch |
            ForEach-Object { ($_.Path.Substring($resolvedRoot.Length + 1)) -replace '\\', '/' } |
            Sort-Object -Unique
    )

    [PSCustomObject]@{
        ArtifactPath = '.github/skills/execute-customization-audit/references/.artifacts/' + $artifact.Name
        ReferenceCount = $referenceHits.Count
        ReferencedBy = ($referenceHits -join '; ')
        Status = if ($referenceHits.Count -gt 0) { 'Referenced' } else { 'Unreferenced' }
    }
}

$unreferenced = @($results | Where-Object { $_.Status -eq 'Unreferenced' })
$results | Sort-Object Status, ArtifactPath

if ($unreferenced.Count -gt 0) {
    Write-Warning "Artifact reference hygiene failed: $($unreferenced.Count) unreferenced artifact file(s) found."
    exit 1
}

Write-Output 'Artifact reference hygiene passed: all governance artifact files are referenced by governance or skill assets.'
exit 0
