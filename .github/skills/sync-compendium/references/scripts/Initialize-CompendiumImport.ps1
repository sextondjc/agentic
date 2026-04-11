[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory = $true)]
    [string]$TargetRepoRoot,

    [Parameter(Mandatory = $true)]
    [string]$SourceRepo = 'sextondjc/agentic',

    [Parameter(Mandatory = $true)]
    [string]$SourceVersion,

    [Parameter(Mandatory = $true)]
    [string]$SourceCommit,

    [Parameter()]
    [string]$ApprovedBy = $env:USERNAME
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# Initialize lock file in target repo under skill-contained state path
$lockDir = Join-Path -Path $TargetRepoRoot -ChildPath '.github/skills/sync-compendium/references/.compendium'
$lockFile = Join-Path -Path $lockDir -ChildPath 'lock.json'

if (-not (Test-Path -LiteralPath $lockDir)) {
    if ($PSCmdlet.ShouldProcess($lockDir, 'Create directory')) {
        New-Item -ItemType Directory -Path $lockDir -Force | Out-Null
    }
}

$lockContent = @{
    sourceRepo  = $SourceRepo
    version     = $SourceVersion
    commit      = $SourceCommit
    approvedBy  = $ApprovedBy
    approvedAt  = (Get-Date).ToUniversalTime().ToString('o')
    initialSync = $true
}

if ($PSCmdlet.ShouldProcess($lockFile, 'Write lock file')) {
    $lockContent | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $lockFile -NoNewline
    Write-Host "Lock file initialized: $lockFile"
}

# Create artifact index stub if it doesn't exist
$artifactIndexPath = Join-Path -Path $lockDir -ChildPath 'artifact-index.json'
if (-not (Test-Path -LiteralPath $artifactIndexPath)) {
    $artifactIndexContent = @(
        @{
            artifactId    = 'placeholder'
            path          = 'placeholder'
            artifactType  = 'other'
            source        = 'local'
            ownershipMode = 'local'
            contentHash   = ''
            lastSyncedAt  = (Get-Date).ToUniversalTime().ToString('o')
        }
    )

    if ($PSCmdlet.ShouldProcess($artifactIndexPath, 'Initialize artifact index')) {
        $artifactIndexContent | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $artifactIndexPath -NoNewline
        Write-Host "Artifact index initialized: $artifactIndexPath (placeholder only; replace with real index after first import)"
    }
}

Write-Host "Compendium import initialized for version $SourceVersion at $TargetRepoRoot"
