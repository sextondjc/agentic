[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory = $true)]
    [string]$PlanPath,

    [Parameter(Mandatory = $true)]
    [string]$TargetRepoRoot,

    [Parameter(Mandatory = $true)]
    [string]$ApprovedActions,

    [Parameter(Mandatory = $true)]
    [string]$SyncReportPath,

    [Parameter()]
    [string]$ApprovedBy = $env:USERNAME
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-ObjectPropertyValue {
    param(
        [AllowNull()]
        [object]$InputObject,
        [string]$Name
    )

    if ($null -eq $InputObject) {
        return $null
    }

    $property = $InputObject.PSObject.Properties[$Name]
    if ($null -ne $property) {
        return $property.Value
    }

    return $null
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

function Resolve-RelativePath {
    param([string]$Path)

    if ([string]::IsNullOrWhiteSpace($Path)) {
        throw 'Artifact path is required for apply actions.'
    }

    if ([System.IO.Path]::IsPathRooted($Path)) {
        throw "Absolute artifact paths are not allowed: $Path"
    }

    if ($Path -match '(^|[\\/])\.\.([\\/]|$)') {
        throw "Path traversal is not allowed in artifact paths: $Path"
    }

    return ($Path -replace '\\', '/')
}

function Get-Sha256 {
    param([string]$Path)

    $hash = Get-FileHash -Algorithm SHA256 -LiteralPath $Path
    return "sha256:$($hash.Hash.ToLowerInvariant())"
}

function Get-ArtifactTypeFromPath {
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

function Read-Index {
    param([string]$IndexPath)

    if (-not (Test-Path -LiteralPath $IndexPath)) {
        return @()
    }

    $raw = Get-Content -LiteralPath $IndexPath -Raw
    if ($raw.Trim() -eq '[]') {
        return @()
    }

    $parsed = $raw | ConvertFrom-Json -Depth 100
    if ($parsed -is [System.Array]) {
        return $parsed
    }

    $items = Get-ObjectPropertyValue -InputObject $parsed -Name 'items'
    if ($items -is [System.Array]) {
        return $items
    }

    throw "Artifact index must be an array or object with items array: $IndexPath"
}

function Convert-IndexToMap {
    param([System.Collections.IEnumerable]$Items)

    $map = @{}
    foreach ($item in $Items) {
        $id = [string](Get-ObjectPropertyValue -InputObject $item -Name 'artifactId')
        if (-not [string]::IsNullOrWhiteSpace($id)) {
            $map[$id] = $item
        }
    }

    return $map
}

function Invoke-DownloadText {
    param([string]$Uri)

    $response = Invoke-WebRequest -Method Get -Uri $Uri -Headers @{ 'User-Agent' = 'sync-compendium' }
    return [string]$response.Content
}

if (-not (Test-Path -LiteralPath $PlanPath)) {
    throw "Plan file not found: $PlanPath"
}

$targetRepoRootFullPath = [System.IO.Path]::GetFullPath($TargetRepoRoot)
if (-not (Test-Path -LiteralPath $targetRepoRootFullPath)) {
    throw "Target repository root not found: $targetRepoRootFullPath"
}

$plan = Get-Content -LiteralPath $PlanPath -Raw | ConvertFrom-Json -Depth 100
if ($null -eq $plan -or $null -eq $plan.actions) {
    throw 'Plan is missing required actions array.'
}

$sourceRepo = [string](Get-ObjectPropertyValue -InputObject $plan -Name 'sourceRepo')
$sourceCommit = [string](Get-ObjectPropertyValue -InputObject $plan -Name 'sourceCommit')
$sourceVersion = [string](Get-ObjectPropertyValue -InputObject $plan -Name 'sourceVersion')

if ([string]::IsNullOrWhiteSpace($sourceRepo) -or [string]::IsNullOrWhiteSpace($sourceCommit)) {
    throw 'Plan must include sourceRepo and sourceCommit.'
}

# Parse approved action IDs
$approvedIdSet = New-ApprovedSet -Csv $ApprovedActions

$lockDir = Join-Path -Path $targetRepoRootFullPath -ChildPath '.github/skills/sync-compendium/references/.compendium'
if (-not (Test-Path -LiteralPath $lockDir)) {
    New-Item -ItemType Directory -Path $lockDir -Force | Out-Null
}

$artifactIndexPath = Join-Path -Path $lockDir -ChildPath 'artifact-index.json'
$artifactIndex = Read-Index -IndexPath $artifactIndexPath
$artifactIndexMap = Convert-IndexToMap -Items $artifactIndex

$appliedCount = 0
$skippedCount = 0
$preservedCount = 0
$manualReviewCount = 0
$heldCount = 0
$rejectedCount = 0
$syncReportActions = New-Object System.Collections.Generic.List[object]

foreach ($action in $plan.actions) {
    $artifactId = [string](Get-ObjectPropertyValue -InputObject $action -Name 'artifactId')
    $actionType = [string](Get-ObjectPropertyValue -InputObject $action -Name 'action')
    $sourcePath = [string](Get-ObjectPropertyValue -InputObject $action -Name 'sourcePath')
    $targetPath = [string](Get-ObjectPropertyValue -InputObject $action -Name 'path')

    if ([string]::IsNullOrWhiteSpace($artifactId)) {
        continue
    }

    if ($action.action -eq 'noop' -or $action.action -eq 'preserve') {
        $syncReportActions.Add([pscustomobject]@{
            artifactId = $action.artifactId
            action     = $action.action
            applied    = $false
            reason     = 'skipped'
        })
        if ($action.action -eq 'preserve') {
            $preservedCount++
        }
        $skippedCount++
        continue
    }

    if ($actionType -eq 'manual-review') {
        $manualReviewCount++
    }

    if ($actionType -eq 'hold') {
        $heldCount++
    }

    if ($actionType -eq 'reject') {
        $rejectedCount++
    }

    # Check if this action was explicitly approved
    if (-not $approvedIdSet.Contains($artifactId)) {
        Write-Warning "Action not approved; skipping: $artifactId"
        $syncReportActions.Add([pscustomobject]@{
            artifactId = $artifactId
            action     = $actionType
            applied    = $false
            reason     = 'not-approved'
        })
        continue
    }

    if ($actionType -ne 'add-candidate' -and $actionType -ne 'update-candidate') {
        $syncReportActions.Add([pscustomobject]@{
            artifactId = $artifactId
            action     = $actionType
            applied    = $false
            reason     = 'approved-but-not-applicable'
        })
        $skippedCount++
        continue
    }

    $artifactPath = if (-not [string]::IsNullOrWhiteSpace($sourcePath)) { $sourcePath } else { $targetPath }
    $relativePath = Resolve-RelativePath -Path $artifactPath
    $fullTargetPath = [System.IO.Path]::GetFullPath((Join-Path -Path $targetRepoRootFullPath -ChildPath ($relativePath -replace '/', '\\')))

    if (-not $fullTargetPath.StartsWith($targetRepoRootFullPath, [System.StringComparison]::OrdinalIgnoreCase)) {
        throw "Resolved artifact path is outside target repository root: $relativePath"
    }

    $downloadUrl = [string](Get-ObjectPropertyValue -InputObject $action -Name 'sourceDownloadUrl')
    if ([string]::IsNullOrWhiteSpace($downloadUrl)) {
        $downloadUrl = "https://raw.githubusercontent.com/$sourceRepo/$sourceCommit/$relativePath"
    }

    $content = Invoke-DownloadText -Uri $downloadUrl
    $parentDirectory = Split-Path -Path $fullTargetPath -Parent
    if (-not (Test-Path -LiteralPath $parentDirectory)) {
        New-Item -ItemType Directory -Path $parentDirectory -Force | Out-Null
    }

    if ($PSCmdlet.ShouldProcess($fullTargetPath, "Apply $actionType for '$artifactId'")) {
        [System.IO.File]::WriteAllText($fullTargetPath, $content, [System.Text.UTF8Encoding]::new($false))

        $contentHash = Get-Sha256 -Path $fullTargetPath
        $sourceBlobSha = [string](Get-ObjectPropertyValue -InputObject $action -Name 'sourceBlobSha')
        $artifactType = [string](Get-ObjectPropertyValue -InputObject $action -Name 'artifactType')
        if ([string]::IsNullOrWhiteSpace($artifactType)) {
            $artifactType = Get-ArtifactTypeFromPath -Path $relativePath
        }

        $record = [pscustomobject]@{
            artifactId = $artifactId
            path = $relativePath
            artifactType = $artifactType
            source = $sourceRepo
            sourceVersion = $sourceVersion
            sourceCommit = $sourceCommit
            ownershipMode = 'managed'
            mergeStrategy = 'replace'
            contentHash = $contentHash
            lastImportedHash = $contentHash
            lastSyncedAt = (Get-Date).ToUniversalTime().ToString('o')
            sourceBlobSha = $sourceBlobSha
        }

        $artifactIndexMap[$artifactId] = $record

        $syncReportActions.Add([pscustomobject]@{
            artifactId = $artifactId
            action = $actionType
            applied = $true
            reason = 'approved-and-applied'
            path = $relativePath
        })
        $appliedCount++
    }
}

# Update lock file
$lockFile = Join-Path -Path $lockDir -ChildPath 'lock.json'

if (Test-Path -LiteralPath $lockFile) {
    $lockObject = Get-Content -LiteralPath $lockFile -Raw | ConvertFrom-Json -Depth 100
    $lockData = @{}
    foreach ($property in $lockObject.PSObject.Properties) {
        $lockData[$property.Name] = $property.Value
    }
}
else {
    $lockData = @{}
}

$lockData.approvedBy = $ApprovedBy
$lockData.approvedAt = (Get-Date).ToUniversalTime().ToString('o')
$lockData.version = $plan.sourceVersion
$lockData.commit = $plan.sourceCommit
$lockData.planId = $plan.planId
$lockData.sourceRepo = $plan.sourceRepo

if ($PSCmdlet.ShouldProcess($lockFile, 'Update lock file')) {
    $lockData | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $lockFile -NoNewline
    Write-Host "Lock file updated: $lockFile"
}

$updatedIndex = @($artifactIndexMap.GetEnumerator() | Sort-Object Name | ForEach-Object { $_.Value })
if ($PSCmdlet.ShouldProcess($artifactIndexPath, 'Update artifact index')) {
    $updatedIndex | ConvertTo-Json -Depth 20 | Set-Content -LiteralPath $artifactIndexPath -NoNewline
    Write-Host "Artifact index updated: $artifactIndexPath"
}

# Write sync report to caller-specified path
$reportDir = Split-Path -Path $SyncReportPath -Parent
if (-not [string]::IsNullOrWhiteSpace($reportDir) -and -not (Test-Path -LiteralPath $reportDir)) {
    New-Item -ItemType Directory -Path $reportDir -Force | Out-Null
}

$reportPath = $SyncReportPath

$syncReport = @{
    planId           = $plan.planId
    sourceRepo       = $plan.sourceRepo
    sourceVersion    = $plan.sourceVersion
    sourceCommit     = $plan.sourceCommit
    approvedBy       = $ApprovedBy
    approvedAt       = (Get-Date).ToUniversalTime().ToString('o')
    appliedCount     = $appliedCount
    skippedCount     = $skippedCount
    preservedCount   = $preservedCount
    manualReviewCount = $manualReviewCount
    heldCount = $heldCount
    rejectedCount = $rejectedCount
    actions          = $syncReportActions
}

if ($PSCmdlet.ShouldProcess($reportPath, 'Write sync report')) {
    $syncReport | ConvertTo-Json -Depth 20 | Set-Content -LiteralPath $reportPath -NoNewline
    Write-Host "Sync report written: $reportPath"
}

Write-Host "Sync complete: $appliedCount applied, $preservedCount preserved, $skippedCount skipped"
