[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$TargetIndexPath,

    [Parameter()]
    [string]$SourceManifestPath,

    [Parameter()]
    [string]$SourceRepository = 'sextondjc/agentic',

    [Parameter()]
    [string]$SourceVersion,

    [Parameter()]
    [string]$SourceCommit,

    [Parameter(Mandatory = $true)]
    [string]$PlanOutPath,

    [Parameter()]
    [switch]$AsTable
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-ObjectPropertyValue {
    param(
        [Parameter(Mandatory = $true)]
        [AllowNull()]
        [object]$InputObject,

        [Parameter(Mandatory = $true)]
        [string]$Name
    )

    if ($null -eq $InputObject) {
        return $null
    }

    if ($InputObject -is [hashtable] -and $InputObject.ContainsKey($Name)) {
        return $InputObject[$Name]
    }

    $property = $InputObject.PSObject.Properties[$Name]
    if ($null -ne $property) {
        return $property.Value
    }

    return $null
}

function Read-JsonItems {
    param([string]$Path)

    if (-not (Test-Path -LiteralPath $Path)) {
        throw "JSON file not found: $Path"
    }

    $raw = Get-Content -LiteralPath $Path -Raw
    if ($raw.Trim() -eq '[]') {
        return @()
    }

    $parsed = $raw | ConvertFrom-Json -Depth 100

    if ($null -eq $parsed) {
        throw "JSON file is empty: $Path"
    }

    if ($parsed -is [System.Array]) {
        return $parsed
    }

    $items = Get-ObjectPropertyValue -InputObject $parsed -Name 'items'
    if ($items -is [System.Array]) {
        return $items
    }

    throw "Expected a JSON array or an object with an 'items' array in: $Path"
}

function Resolve-RepositorySlug {
    param([string]$Repository)

    if ([string]::IsNullOrWhiteSpace($Repository)) {
        throw 'SourceRepository is required.'
    }

    $trimmed = $Repository.Trim()
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

    throw "Unsupported SourceRepository format: $Repository"
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
        $version = Get-ObjectPropertyValue -InputObject $versionJson -Name 'version'
        if (-not [string]::IsNullOrWhiteSpace([string]$version)) {
            return [string]$version
        }
    }
    catch {
        # Fall back to commit-derived marker when version metadata is unavailable.
    }

    return "0.0.0+$($CommitSha.Substring(0, 7))"
}

function Get-ArtifactTypeFromPath {
    param([string]$Path)

    if ($Path -like '.github/instructions/*.instructions.md') { return 'instruction' }
    if ($Path -like '.github/skills/*/SKILL.md') { return 'skill' }
    if ($Path -like '.github/skills/*/references/scripts/*.ps1') { return 'script' }
    if ($Path -like '.github/skills/*/references/*.md') { return 'doc' }
    if ($Path -eq '.github/skills/sync-compendium/references/.compendium/version.json') { return 'other' }
    if ($Path -like '.github/prompts/*.prompt.md') { return 'prompt' }
    if ($Path -like '.github/agents/*.agent.md') { return 'agent' }
    if ($Path -eq '.github/copilot-instructions.md') { return 'instruction' }
    return 'other'
}

function Test-IsCompendiumArtifactPath {
    param([string]$Path)

    return (
        $Path -like '.github/instructions/*.instructions.md' -or
        $Path -like '.github/skills/*/SKILL.md' -or
        $Path -like '.github/skills/*/references/*.md' -or
        $Path -like '.github/skills/*/references/scripts/*.ps1' -or
        $Path -eq '.github/skills/sync-compendium/references/.compendium/version.json' -or
        $Path -like '.github/prompts/*.prompt.md' -or
        $Path -like '.github/agents/*.agent.md' -or
        $Path -eq '.github/copilot-instructions.md'
    )
}

function Get-SourceItemsFromGitHub {
    param(
        [string]$RepositorySlug,
        [string]$CommitSha
    )

    $tree = Invoke-GitHubApi -Uri "https://api.github.com/repos/$RepositorySlug/git/trees/${CommitSha}?recursive=1"
    $nodes = Get-ObjectPropertyValue -InputObject $tree -Name 'tree'
    if ($nodes -isnot [System.Array]) {
        throw "Unable to read repository tree for $RepositorySlug at $CommitSha"
    }

    $items = New-Object System.Collections.Generic.List[object]
    foreach ($node in $nodes) {
        $nodeType = [string](Get-ObjectPropertyValue -InputObject $node -Name 'type')
        if ($nodeType -ne 'blob') {
            continue
        }

        $path = [string](Get-ObjectPropertyValue -InputObject $node -Name 'path')
        if (-not (Test-IsCompendiumArtifactPath -Path $path)) {
            continue
        }

        $artifactType = Get-ArtifactTypeFromPath -Path $path
        $items.Add([pscustomobject]@{
            artifactId = $path
            path = $path
            artifactType = $artifactType
            source = $RepositorySlug
            ownershipMode = 'managed'
            mergeStrategy = 'replace'
            sourceBlobSha = [string](Get-ObjectPropertyValue -InputObject $node -Name 'sha')
            sourceDownloadUrl = "https://raw.githubusercontent.com/$RepositorySlug/$CommitSha/$path"
        })
    }

    return $items
}

function To-LookupByArtifactId {
    param([System.Collections.IEnumerable]$Items)

    $map = @{}
    foreach ($item in $Items) {
        if ([string]::IsNullOrWhiteSpace($item.artifactId)) {
            throw 'artifactId is required for every record in both target index and source manifest.'
        }

        $map[$item.artifactId] = $item
    }

    return $map
}

function Get-Decision {
    param(
        $Target,
        $Source,
        [string]$SourceRepo
    )

    $targetSource = [string](Get-ObjectPropertyValue -InputObject $Target -Name 'source')
    $targetOwnershipMode = [string](Get-ObjectPropertyValue -InputObject $Target -Name 'ownershipMode')
    $targetContentHash = [string](Get-ObjectPropertyValue -InputObject $Target -Name 'contentHash')
    $targetLastImportedHash = [string](Get-ObjectPropertyValue -InputObject $Target -Name 'lastImportedHash')
    $targetSourceBlobSha = [string](Get-ObjectPropertyValue -InputObject $Target -Name 'sourceBlobSha')

    $sourceContentHash = [string](Get-ObjectPropertyValue -InputObject $Source -Name 'contentHash')
    $sourceBlobSha = [string](Get-ObjectPropertyValue -InputObject $Source -Name 'sourceBlobSha')

    $sourceChanged = $false
    if (-not [string]::IsNullOrWhiteSpace($sourceBlobSha) -and -not [string]::IsNullOrWhiteSpace($targetSourceBlobSha)) {
        $sourceChanged = ($targetSourceBlobSha -ne $sourceBlobSha)
    }
    elseif (-not [string]::IsNullOrWhiteSpace($sourceContentHash) -and -not [string]::IsNullOrWhiteSpace($targetContentHash)) {
        $sourceChanged = ($targetContentHash -ne $sourceContentHash)
    }
    else {
        $sourceChanged = $true
    }

    if ($null -ne $Target) {
        if ([string]::IsNullOrWhiteSpace($targetSource)) {
            return [pscustomobject]@{ action = 'reject'; reason = 'missing-source' }
        }

        if ($targetSource -eq 'local' -or $targetOwnershipMode -eq 'local') {
            return [pscustomobject]@{ action = 'preserve'; reason = 'local-owned' }
        }

        if ($targetSource -ne $SourceRepo) {
            return [pscustomobject]@{ action = 'preserve'; reason = 'non-compendium-source' }
        }
    }

    if ($null -eq $Source -and $null -ne $Target) {
        return [pscustomobject]@{ action = 'hold'; reason = 'missing-in-source' }
    }

    if ($null -eq $Target -and $null -ne $Source) {
        return [pscustomobject]@{ action = 'add-candidate'; reason = 'new-from-source' }
    }

    if ($targetOwnershipMode -eq 'extended') {
        if ($sourceChanged) {
            return [pscustomobject]@{ action = 'manual-review'; reason = 'extended-merge-required' }
        }

        return [pscustomobject]@{ action = 'noop'; reason = 'extended-no-change' }
    }

    $hasLocalDrift = $false
    if (-not [string]::IsNullOrWhiteSpace($targetLastImportedHash) -and -not [string]::IsNullOrWhiteSpace($targetContentHash)) {
        $hasLocalDrift = ($targetLastImportedHash -ne $targetContentHash)
    }

    if ($hasLocalDrift) {
        return [pscustomobject]@{ action = 'manual-review'; reason = 'managed-local-drift' }
    }

    if ($sourceChanged) {
        return [pscustomobject]@{ action = 'update-candidate'; reason = 'managed-source-change' }
    }

    return [pscustomobject]@{ action = 'noop'; reason = 'no-change' }
}

$repositorySlug = Resolve-RepositorySlug -Repository $SourceRepository
if ([string]::IsNullOrWhiteSpace($SourceCommit)) {
    $SourceCommit = Get-LatestCommitSha -RepositorySlug $repositorySlug
}

if ([string]::IsNullOrWhiteSpace($SourceVersion)) {
    $SourceVersion = Get-SourceVersion -RepositorySlug $repositorySlug -CommitSha $SourceCommit
}

$targetItems = Read-JsonItems -Path $TargetIndexPath
$sourceItems = @()

if (-not [string]::IsNullOrWhiteSpace($SourceManifestPath) -and (Test-Path -LiteralPath $SourceManifestPath)) {
    $sourceItems = Read-JsonItems -Path $SourceManifestPath
}
else {
    $sourceItems = Get-SourceItemsFromGitHub -RepositorySlug $repositorySlug -CommitSha $SourceCommit
}

$targetById = To-LookupByArtifactId -Items $targetItems
$sourceById = To-LookupByArtifactId -Items $sourceItems

$allIds = New-Object System.Collections.Generic.HashSet[string]
foreach ($id in $targetById.Keys) { [void]$allIds.Add($id) }
foreach ($id in $sourceById.Keys) { [void]$allIds.Add($id) }

$actions = New-Object System.Collections.Generic.List[object]

foreach ($artifactId in ($allIds | Sort-Object)) {
    $target = $targetById[$artifactId]
    $source = $sourceById[$artifactId]

    $decision = Get-Decision -Target $target -Source $source -SourceRepo $repositorySlug

    $path = if ($null -ne $target -and -not [string]::IsNullOrWhiteSpace($target.path)) {
        $target.path
    }
    elseif ($null -ne $source) {
        $source.path
    }
    else {
        ''
    }

    $actions.Add([pscustomobject]@{
        artifactId = $artifactId
        path = $path
        sourcePath = if ($null -ne $source) { [string](Get-ObjectPropertyValue -InputObject $source -Name 'path') } else { $null }
        action = $decision.action
        reason = $decision.reason
        source = if ($null -ne $target) { $target.source } else { $repositorySlug }
        ownershipMode = if ($null -ne $target) { $target.ownershipMode } else { 'managed' }
        artifactType = if ($null -ne $source -and -not [string]::IsNullOrWhiteSpace([string](Get-ObjectPropertyValue -InputObject $source -Name 'artifactType'))) { [string](Get-ObjectPropertyValue -InputObject $source -Name 'artifactType') } elseif ($null -ne $target) { [string](Get-ObjectPropertyValue -InputObject $target -Name 'artifactType') } else { 'other' }
        sourceBlobSha = if ($null -ne $source) { [string](Get-ObjectPropertyValue -InputObject $source -Name 'sourceBlobSha') } else { $null }
        sourceDownloadUrl = if ($null -ne $source) { [string](Get-ObjectPropertyValue -InputObject $source -Name 'sourceDownloadUrl') } else { $null }
    })
}

$summary = [ordered]@{}
foreach ($name in @('update-candidate', 'add-candidate', 'manual-review', 'hold', 'preserve', 'noop', 'reject')) {
    $summary[$name] = @($actions | Where-Object { $_.action -eq $name }).Count
}

$plan = [pscustomobject]@{
    planId = "sync-plan-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
    generatedAt = (Get-Date).ToUniversalTime().ToString('o')
    sourceRepo = $repositorySlug
    sourceVersion = $SourceVersion
    sourceCommit = $SourceCommit
    requiresExplicitApproval = $true
    summary = $summary
    actions = $actions
}

$planDir = Split-Path -Path $PlanOutPath -Parent
if (-not [string]::IsNullOrWhiteSpace($planDir) -and -not (Test-Path -LiteralPath $planDir)) {
    New-Item -ItemType Directory -Path $planDir -Force | Out-Null
}

$plan | ConvertTo-Json -Depth 20 | Set-Content -LiteralPath $PlanOutPath -NoNewline

Write-Host "Plan written: $PlanOutPath"
Write-Host 'Summary:'
foreach ($entry in $summary.GetEnumerator()) {
    Write-Host ("  {0}: {1}" -f $entry.Key, $entry.Value)
}

if ($AsTable) {
    $actions |
        Sort-Object action, artifactId |
        Format-Table artifactId, action, reason, ownershipMode, source, path -AutoSize
}
