[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$SourceRepositoryUrl,

    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$WorkstreamId,

    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$EngineeringOwner,

    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$DeliveryOwner,

    [Parameter()]
    [string]$SecuritySignOffReference,

    [Parameter()]
    [string]$RollbackReference,

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$TargetRepoRoot = '.',

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$OutputDirectory = '.github/skills/sync-compendium/references/.compendium/external-intake',

    [Parameter()]
    [ValidateRange(1, 500)]
    [int]$MaxCandidates = 150,

    [Parameter()]
    [string[]]$IncludePathPrefixes = @(
        '.github/agents/',
        '.github/instructions/',
        '.github/skills/',
        '.github/prompts/'
    ),

    [Parameter()]
    [string[]]$IncludeExtensions = @('.md', '.ps1', '.psm1', '.yml', '.yaml', '.json'),

    [Parameter()]
    [string]$GitHubToken
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

function New-GitHubHeaders {
    param([string]$Token)

    $headers = @{
        'User-Agent' = 'sync-compendium-interrogation'
        'Accept' = 'application/vnd.github+json'
    }

    if (-not [string]::IsNullOrWhiteSpace($Token)) {
        $headers['Authorization'] = "Bearer $Token"
    }

    return $headers
}

function Invoke-GitHubApi {
    param(
        [string]$Uri,
        [hashtable]$Headers
    )

    return Invoke-RestMethod -Method Get -Uri $Uri -Headers $Headers
}

function Get-ArtifactType {
    param([string]$Path)

    if ($Path -like '.github/instructions/*.instructions.md') { return 'instruction' }
    if ($Path -like '.github/skills/*/SKILL.md') { return 'skill' }
    if ($Path -like '.github/skills/*/references/scripts/*.ps1') { return 'script' }
    if ($Path -like '.github/skills/*/references/*.md') { return 'doc' }
    if ($Path -like '.github/prompts/*.prompt.md') { return 'prompt' }
    if ($Path -like '.github/agents/*.agent.md') { return 'agent' }
    if ($Path -eq '.github/copilot-instructions.md') { return 'instruction' }

    return 'other'
}

function Get-CandidateScore {
    param([string]$Path)

    $score = 10
    if ($Path -like '.github/skills/*/SKILL.md') { $score += 100 }
    if ($Path -like '.github/instructions/*.instructions.md') { $score += 90 }
    if ($Path -like '.github/agents/*.agent.md') { $score += 80 }
    if ($Path -like '.github/prompts/*.prompt.md') { $score += 70 }
    if ($Path -like '.github/skills/*/references/scripts/*.ps1') { $score += 60 }
    if ($Path -like '.github/workflows/*.yml') { $score += 50 }

    return $score
}

function Test-IncludedPath {
    param(
        [string]$Path,
        [string[]]$Prefixes,
        [string[]]$Extensions
    )

    $prefixMatch = $false
    foreach ($prefix in $Prefixes) {
        if ($Path.StartsWith($prefix, [System.StringComparison]::OrdinalIgnoreCase)) {
            $prefixMatch = $true
            break
        }
    }

    if (-not $prefixMatch) {
        return $false
    }

    $extension = [System.IO.Path]::GetExtension($Path)
    if ([string]::IsNullOrWhiteSpace($extension)) {
        return $false
    }

    foreach ($allowed in $Extensions) {
        if ($extension.Equals($allowed, [System.StringComparison]::OrdinalIgnoreCase)) {
            return $true
        }
    }

    return $false
}

$targetRootFullPath = [System.IO.Path]::GetFullPath($TargetRepoRoot)
if (-not (Test-Path -LiteralPath $targetRootFullPath)) {
    throw "Target repository root not found: $targetRootFullPath"
}

$token = $GitHubToken
if ([string]::IsNullOrWhiteSpace($token)) {
    $token = $env:GITHUB_TOKEN
}

$repositorySlug = Resolve-RepositorySlug -RepositoryUrl $SourceRepositoryUrl
$headers = New-GitHubHeaders -Token $token

$repoMetadata = Invoke-GitHubApi -Uri "https://api.github.com/repos/$repositorySlug" -Headers $headers
$defaultBranch = [string]$repoMetadata.default_branch
if ([string]::IsNullOrWhiteSpace($defaultBranch)) {
    throw "Unable to resolve default branch for $repositorySlug"
}

$commitMetadata = Invoke-GitHubApi -Uri "https://api.github.com/repos/$repositorySlug/commits/$defaultBranch" -Headers $headers
$sourceCommit = [string]$commitMetadata.sha
if ([string]::IsNullOrWhiteSpace($sourceCommit)) {
    throw "Unable to resolve latest commit for $repositorySlug on branch $defaultBranch"
}

$treeUri = "https://api.github.com/repos/$repositorySlug/git/trees/$sourceCommit" + '?recursive=1'
$tree = Invoke-GitHubApi -Uri $treeUri -Headers $headers
if ($tree.tree -isnot [System.Array]) {
    throw "Unable to read repository tree for $repositorySlug at $sourceCommit"
}

$candidates = New-Object System.Collections.Generic.List[object]
foreach ($node in $tree.tree) {
    if ([string]$node.type -ne 'blob') {
        continue
    }

    $path = [string]$node.path
    if (-not (Test-IncludedPath -Path $path -Prefixes $IncludePathPrefixes -Extensions $IncludeExtensions)) {
        continue
    }

    $candidates.Add([pscustomobject]@{
        artifactId = $path
        path = $path
        artifactType = Get-ArtifactType -Path $path
        score = Get-CandidateScore -Path $path
        sourceBlobSha = [string]$node.sha
        size = [int]$node.size
        sourceDownloadUrl = "https://raw.githubusercontent.com/$repositorySlug/$sourceCommit/$path"
        disposition = 'undecided'
        notes = ''
    })
}

$selectedCandidates = @($candidates |
    Sort-Object -Property @{ Expression = 'score'; Descending = $true }, @{ Expression = 'path'; Descending = $false } |
    Select-Object -First $MaxCandidates)

$intakeId = [guid]::NewGuid().Guid
$now = [DateTimeOffset]::UtcNow.ToString('o')

$manifest = [pscustomobject]@{
    intakeId = $intakeId
    generatedAt = $now
    workstreamId = $WorkstreamId
    source = [pscustomobject]@{
        repository = $repositorySlug
        sourceRepositoryUrl = $SourceRepositoryUrl
        defaultBranch = $defaultBranch
        sourceCommit = $sourceCommit
        license = [string]$repoMetadata.license.spdx_id
        isPrivate = [bool]$repoMetadata.private
    }
    query = [pscustomobject]@{
        includePathPrefixes = $IncludePathPrefixes
        includeExtensions = $IncludeExtensions
        maxCandidates = $MaxCandidates
    }
    summary = [pscustomobject]@{
        discoveredCandidates = $candidates.Count
        selectedCandidates = $selectedCandidates.Count
    }
    items = $selectedCandidates
}

$approvalChainPresent = -not [string]::IsNullOrWhiteSpace($EngineeringOwner) -and -not [string]::IsNullOrWhiteSpace($DeliveryOwner)
$securitySignOffPresent = -not [string]::IsNullOrWhiteSpace($SecuritySignOffReference)
$rollbackPresent = -not [string]::IsNullOrWhiteSpace($RollbackReference)

$evidence = [pscustomobject]@{
    evidenceId = "EV-$intakeId"
    generatedAt = $now
    workstreamId = $WorkstreamId
    source = [pscustomobject]@{
        repository = $repositorySlug
        sourceCommit = $sourceCommit
        sourceTreeUrl = "https://github.com/$repositorySlug/tree/$sourceCommit"
    }
    approvals = [pscustomobject]@{
        engineeringOwner = $EngineeringOwner
        deliveryOwner = $DeliveryOwner
        securitySignOffReference = $SecuritySignOffReference
        approvedAt = $now
    }
    rollback = [pscustomobject]@{
        rollbackReference = $RollbackReference
        rollbackOwner = $EngineeringOwner
    }
    checks = [pscustomobject]@{
        interrogateOnly = $true
        noCloneImport = $true
        sourcePinnedToCommit = $true
        approvalChainRecorded = $approvalChainPresent
        securitySignOffRecorded = $securitySignOffPresent
        rollbackReferenceRecorded = $rollbackPresent
    }
    promotionReadiness = [pscustomobject]@{
        isReady = ($approvalChainPresent -and $securitySignOffPresent -and $rollbackPresent)
        missing = @(
            if (-not $approvalChainPresent) { 'approval-chain' }
            if (-not $securitySignOffPresent) { 'security-signoff' }
            if (-not $rollbackPresent) { 'rollback-reference' }
        )
    }
}

$outputRoot = $OutputDirectory
if (-not [System.IO.Path]::IsPathRooted($outputRoot)) {
    $outputRoot = Join-Path -Path $targetRootFullPath -ChildPath $OutputDirectory
}

if ($PSCmdlet.ShouldProcess($outputRoot, 'Write interrogation manifest and evidence bundle')) {
    New-Item -ItemType Directory -Path $outputRoot -Force | Out-Null

    $manifestPath = Join-Path -Path $outputRoot -ChildPath 'latest-candidate-manifest.json'
    $evidencePath = Join-Path -Path $outputRoot -ChildPath 'latest-evidence-bundle.json'

    $manifest | ConvertTo-Json -Depth 100 | Set-Content -LiteralPath $manifestPath -Encoding UTF8
    $evidence | ConvertTo-Json -Depth 100 | Set-Content -LiteralPath $evidencePath -Encoding UTF8

    [pscustomobject]@{
        intakeId = $intakeId
        sourceRepository = $repositorySlug
        sourceCommit = $sourceCommit
        candidateManifestPath = $manifestPath
        evidenceBundlePath = $evidencePath
        selectedCandidateCount = $selectedCandidates.Count
        promotionReady = [bool]$evidence.promotionReadiness.isReady
    }
}
