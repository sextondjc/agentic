[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$SourceRepositoryUrl,

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$TargetRepoRoot = '.',

    [Parameter()]
    [string]$SourceCommit,

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

    return Invoke-RestMethod -Method Get -Uri $Uri -Headers @{ 'User-Agent' = 'sync-compendium-bootstrap' }
}

function Get-LatestCommitSha {
    param([string]$RepositorySlug)

    $response = Invoke-GitHubApi -Uri "https://api.github.com/repos/$RepositorySlug/commits?per_page=1"
    if ($response -isnot [System.Array] -or $response.Count -lt 1 -or [string]::IsNullOrWhiteSpace($response[0].sha)) {
        throw "Unable to resolve latest commit for repository $RepositorySlug"
    }

    return [string]$response[0].sha
}

function Invoke-DownloadText {
    param([string]$Uri)

    $response = Invoke-WebRequest -Method Get -Uri $Uri -Headers @{ 'User-Agent' = 'sync-compendium-bootstrap' }
    return [string]$response.Content
}

function Write-Utf8NoBom {
    param(
        [string]$Path,
        [string]$Content
    )

    $parent = Split-Path -Path $Path -Parent
    if (-not (Test-Path -LiteralPath $parent)) {
        New-Item -ItemType Directory -Path $parent -Force | Out-Null
    }

    [System.IO.File]::WriteAllText($Path, $Content, [System.Text.UTF8Encoding]::new($false))
}

$targetRootFullPath = [System.IO.Path]::GetFullPath($TargetRepoRoot)
if (-not (Test-Path -LiteralPath $targetRootFullPath)) {
    throw "Target repository root not found: $targetRootFullPath"
}

$repositorySlug = Resolve-RepositorySlug -RepositoryUrl $SourceRepositoryUrl
if ([string]::IsNullOrWhiteSpace($SourceCommit)) {
    $SourceCommit = Get-LatestCommitSha -RepositorySlug $repositorySlug
}

$bootstrapPaths = @(
    [pscustomobject]@{ path = '.github/skills/sync-compendium/references/scripts/Invoke-CompendiumSyncPlan.ps1'; required = $true },
    [pscustomobject]@{ path = '.github/skills/sync-compendium/references/scripts/Apply-CompendiumSync.ps1'; required = $true },
    [pscustomobject]@{ path = '.github/skills/sync-compendium/references/scripts/Initialize-CompendiumImport.ps1'; required = $true },
    [pscustomobject]@{ path = '.github/skills/prune-sync-assets/references/scripts/Invoke-PruneSyncAssets.ps1'; required = $true },
    [pscustomobject]@{ path = '.github/skills/sync-compendium/references/sync-decision-matrix.md'; required = $true },
    [pscustomobject]@{ path = '.github/skills/sync-compendium/SKILL.md'; required = $true },
    [pscustomobject]@{ path = '.github/prompts/sync-compendium.prompt.md'; required = $true },
    [pscustomobject]@{ path = '.github/skills/sync-compendium/references/scripts/Invoke-CompendiumSync.ps1'; required = $false }
)

$results = New-Object System.Collections.Generic.List[object]

foreach ($entry in $bootstrapPaths) {
    $normalized = ([string]$entry.path) -replace '\\', '/'
    $required = [bool]$entry.required
    if ($normalized -match '(^|/)\.\.(?:/|$)') {
        throw "Invalid bootstrap path entry: $normalized"
    }

    $uri = "https://raw.githubusercontent.com/$repositorySlug/$SourceCommit/$normalized"
    $targetPath = [System.IO.Path]::GetFullPath((Join-Path -Path $targetRootFullPath -ChildPath ($normalized -replace '/', '\\')))

    if (-not $targetPath.StartsWith($targetRootFullPath, [System.StringComparison]::OrdinalIgnoreCase)) {
        throw "Refusing to write outside target repo root: $normalized"
    }

    $content = $null
    try {
        $content = Invoke-DownloadText -Uri $uri
    }
    catch {
        if ($required) {
            throw
        }

        Write-Warning "Optional bootstrap file not found in source; skipped: $normalized"
        $results.Add([pscustomobject]@{
            path = $normalized
            sourceCommit = $SourceCommit
            sourceRepo = $repositorySlug
            updated = $false
        })
        continue
    }

    if ($PSCmdlet.ShouldProcess($targetPath, "Bootstrap sync engine file '$normalized'")) {
        Write-Utf8NoBom -Path $targetPath -Content $content
    }

    $results.Add([pscustomobject]@{
        path = $normalized
        sourceCommit = $SourceCommit
        sourceRepo = $repositorySlug
        updated = $true
    })
}

if ($AsTable) {
    $results | Format-Table path, sourceRepo, sourceCommit, updated -AutoSize
}

Write-Host "Bootstrap complete: $($results.Count) files processed from $repositorySlug @ $SourceCommit"
return $results