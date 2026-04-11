# test-overlap-watchlist.ps1: Monitor designated overlap watchlist pairs in responsibility-overlap output.
# Usage: ./.github/scripts/powershell/test-overlap-watchlist.ps1 [-RootPath <path>] [-OverlapArtifactPath <path>]
# Output: PSCustomObject watchlist rows. Exits 1 only when artifact cannot be read.

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
$pairs = @($payload.OverlapPairs)

$watchlist = @(
    [pscustomobject]@{ AssetAType = 'skills'; AssetAName = 'performance-research'; AssetBType = 'skills'; AssetBName = 'security-research' }
)

$rows = foreach ($watch in $watchlist) {
    $found = $pairs | Where-Object {
        (
            $_.AssetAType -eq $watch.AssetAType -and
            $_.AssetAName -eq $watch.AssetAName -and
            $_.AssetBType -eq $watch.AssetBType -and
            $_.AssetBName -eq $watch.AssetBName
        ) -or (
            $_.AssetAType -eq $watch.AssetBType -and
            $_.AssetAName -eq $watch.AssetBName -and
            $_.AssetBType -eq $watch.AssetAType -and
            $_.AssetBName -eq $watch.AssetAName
        )
    } | Select-Object -First 1

    [pscustomobject]@{
        Pair = "$($watch.AssetAType):$($watch.AssetAName) <-> $($watch.AssetBType):$($watch.AssetBName)"
        Present = ($null -ne $found)
        SimilarityScore = if ($found) { $found.SimilarityScore } else { $null }
        SharedTokenCount = if ($found) { $found.SharedTokenCount } else { $null }
        Signal = if ($found) { $found.Signal } else { 'NotDetected' }
        Status = 'Monitored'
    }
}

$rows
Write-Output "Overlap watchlist monitor passed: $($rows.Count) pair(s) checked."
exit 0
