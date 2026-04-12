[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$SourceRepositoryUrl,

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$TargetRepoRoot = '.',

    [Parameter()]
    [string]$ApprovedActions,

    [Parameter()]
    [string]$ApprovedRemovals,

    [Parameter()]
    [string]$ApprovedBy = $env:USERNAME,

    [Parameter()]
    [switch]$Apply,

    [Parameter()]
    [switch]$Prune,

    [Parameter()]
    [switch]$AsTable
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Resolve-RepositorySlug {
    param([string]$RepositoryUrl)

    $trimmed = $RepositoryUrl.Trim()
    if ($trimmed -match '^https?://github\.com/(?<owner>[^/]+)/(?<repo>[^/?#]+)') {
        $repo = $matches.repo
        if ($repo.EndsWith('.git', [System.StringComparison]::OrdinalIgnoreCase)) {
            $repo = $repo.Substring(0, $repo.Length - 4)
        }

        return "$($matches.owner)/$repo"
    }

    if ($trimmed -match '^[^/]+/[^/]+$') {
        return $trimmed
    }

    throw "Unsupported SourceRepositoryUrl format: $SourceRepositoryUrl"
}

function Invoke-GitHubApi {
    param([string]$Uri)

    return Invoke-RestMethod -Method Get -Uri $Uri -Headers @{ 'User-Agent' = 'sync-compendium' }
}

function Get-LatestCommitSha {
    param([string]$RepositorySlug)

    $response = Invoke-GitHubApi -Uri "https://api.github.com/repos/$RepositorySlug/commits?per_page=1"
    if ($response -isnot [System.Array] -or $response.Count -lt 1 -or [string]::IsNullOrWhiteSpace($response[0].sha)) {
        throw "Unable to resolve latest commit for repository $RepositorySlug"
    }

    return [string]$response[0].sha
}

function Get-SourceVersion {
    param(
        [string]$RepositorySlug,
        [string]$CommitSha
    )

    $uri = "https://raw.githubusercontent.com/$RepositorySlug/$CommitSha/.github/skills/sync-compendium/references/.compendium/version.json"
    try {
        $versionJson = Invoke-RestMethod -Method Get -Uri $uri -Headers @{ 'User-Agent' = 'sync-compendium' }
        if (-not [string]::IsNullOrWhiteSpace([string]$versionJson.version)) {
            return [string]$versionJson.version
        }
    }
    catch {
        # Fall back when version metadata is unavailable.
    }

    return "0.0.0+$($CommitSha.Substring(0, 7))"
}

function New-ApprovedSet {
    param([string]$Csv)

    $set = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
    foreach ($id in ($Csv -split ',')) {
        $trimmed = $id.Trim()
        if (-not [string]::IsNullOrWhiteSpace($trimmed)) {
            [void]$set.Add($trimmed)
        }
    }

    return $set
}

$targetRootFullPath = [System.IO.Path]::GetFullPath($TargetRepoRoot)
if (-not (Test-Path -LiteralPath $targetRootFullPath)) {
    throw "Target repository root not found: $targetRootFullPath"
}

$repositorySlug = Resolve-RepositorySlug -RepositoryUrl $SourceRepositoryUrl
$sourceCommit = Get-LatestCommitSha -RepositorySlug $repositorySlug
$sourceVersion = Get-SourceVersion -RepositorySlug $repositorySlug -CommitSha $sourceCommit

$compendiumDir = Join-Path -Path $targetRootFullPath -ChildPath '.github/skills/sync-compendium/references/.compendium'
$indexPath = Join-Path -Path $compendiumDir -ChildPath 'artifact-index.json'
$planPath = Join-Path -Path $compendiumDir -ChildPath 'latest-plan.json'
$syncReportPath = Join-Path -Path $compendiumDir -ChildPath 'latest-sync-report.json'
$pruneReportPath = Join-Path -Path $compendiumDir -ChildPath 'latest-prune-report.json'
$lockPath = Join-Path -Path $compendiumDir -ChildPath 'lock.json'

if (-not (Test-Path -LiteralPath $lockPath) -or -not (Test-Path -LiteralPath $indexPath)) {
    & "$PSScriptRoot/Initialize-CompendiumImport.ps1" `
        -TargetRepoRoot $targetRootFullPath `
        -SourceRepo $repositorySlug `
        -SourceVersion $sourceVersion `
        -SourceCommit $sourceCommit `
        -ApprovedBy $ApprovedBy
}

& "$PSScriptRoot/Invoke-CompendiumSyncPlan.ps1" `
    -TargetIndexPath $indexPath `
    -SourceRepository $repositorySlug `
    -SourceVersion $sourceVersion `
    -SourceCommit $sourceCommit `
    -PlanOutPath $planPath `
    -AsTable:$AsTable

$plan = Get-Content -LiteralPath $planPath -Raw | ConvertFrom-Json -Depth 100
$holdCandidates = @($plan.actions | Where-Object {
    $_.action -eq 'hold' -and $_.reason -eq 'missing-in-source'
})

if (-not $Apply) {
    Write-Host 'Plan generated. Re-run with -Apply and ApprovedActions to apply approved changes.'
    return
}

if ([string]::IsNullOrWhiteSpace($ApprovedActions)) {
    throw 'ApprovedActions is required when -Apply is specified.'
}

if ($holdCandidates.Count -gt 0) {
    if (-not $Prune) {
        throw "Mandatory cleanup gate: plan contains $($holdCandidates.Count) hold/missing-in-source artifacts. Re-run with -Prune and -ApprovedRemovals containing all hold artifact IDs."
    }

    if ([string]::IsNullOrWhiteSpace($ApprovedRemovals)) {
        throw "Mandatory cleanup gate: ApprovedRemovals is required because hold/missing-in-source artifacts exist."
    }

    $approvedRemovalSet = New-ApprovedSet -Csv $ApprovedRemovals
    $missingApprovals = @()
    foreach ($candidate in $holdCandidates) {
        if (-not $approvedRemovalSet.Contains([string]$candidate.artifactId)) {
            $missingApprovals += [string]$candidate.artifactId
        }
    }

    if ($missingApprovals.Count -gt 0) {
        $missingList = $missingApprovals -join ', '
        throw "Mandatory cleanup gate: ApprovedRemovals must include every hold/missing-in-source artifact. Missing: $missingList"
    }
}

& "$PSScriptRoot/Apply-CompendiumSync.ps1" `
    -PlanPath $planPath `
    -TargetRepoRoot $targetRootFullPath `
    -ApprovedActions $ApprovedActions `
    -SyncReportPath $syncReportPath `
    -ApprovedBy $ApprovedBy

if ($Prune -and -not [string]::IsNullOrWhiteSpace($ApprovedRemovals)) {
    & "$PSScriptRoot/../../../prune-sync-assets/references/scripts/Invoke-PruneSyncAssets.ps1" `
        -PlanPath $planPath `
        -TargetRepoRoot $targetRootFullPath `
        -ApprovedRemovals $ApprovedRemovals `
        -PruneReportPath $pruneReportPath
}

Write-Host "Completed sync for $repositorySlug @ $sourceCommit"
