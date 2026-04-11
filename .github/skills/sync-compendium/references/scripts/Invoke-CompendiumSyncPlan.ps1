[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$TargetIndexPath,

    [Parameter(Mandatory = $true)]
    [string]$SourceManifestPath,

    [Parameter()]
    [string]$SourceRepository = 'sextondjc/agentic',

    [Parameter()]
    [string]$SourceVersion,

    [Parameter()]
    [string]$SourceCommit,

    [Parameter()]
    [string]$PlanOutPath = '.artifacts/compendium-sync-plan.json',

    [Parameter()]
    [switch]$AsTable
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Read-JsonArray {
    param([string]$Path)

    if (-not (Test-Path -LiteralPath $Path)) {
        throw "JSON file not found: $Path"
    }

    $raw = Get-Content -LiteralPath $Path -Raw
    $parsed = $raw | ConvertFrom-Json -Depth 100

    if ($null -eq $parsed) {
        throw "JSON file is empty: $Path"
    }

    if ($parsed -is [System.Array]) {
        return $parsed
    }

    if ($parsed.items -is [System.Array]) {
        return $parsed.items
    }

    throw "Expected a JSON array or an object with an 'items' array in: $Path"
}

function To-LookupByArtifactId {
    param([System.Array]$Items)

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

    if ($null -ne $Target) {
        if ([string]::IsNullOrWhiteSpace($Target.source)) {
            return [pscustomobject]@{ action = 'reject'; reason = 'missing-source' }
        }

        if ($Target.source -eq 'local' -or $Target.ownershipMode -eq 'local') {
            return [pscustomobject]@{ action = 'preserve'; reason = 'local-owned' }
        }

        if ($Target.source -ne $SourceRepo) {
            return [pscustomobject]@{ action = 'preserve'; reason = 'non-compendium-source' }
        }
    }

    if ($null -eq $Source -and $null -ne $Target) {
        return [pscustomobject]@{ action = 'hold'; reason = 'missing-in-source' }
    }

    if ($null -eq $Target -and $null -ne $Source) {
        return [pscustomobject]@{ action = 'add-candidate'; reason = 'new-from-source' }
    }

    if ($Target.ownershipMode -eq 'extended') {
        if ($Target.contentHash -ne $Source.contentHash) {
            return [pscustomobject]@{ action = 'manual-review'; reason = 'extended-merge-required' }
        }

        return [pscustomobject]@{ action = 'noop'; reason = 'extended-no-change' }
    }

    $hasLocalDrift = $false
    if (-not [string]::IsNullOrWhiteSpace($Target.lastImportedHash) -and -not [string]::IsNullOrWhiteSpace($Target.contentHash)) {
        $hasLocalDrift = ($Target.lastImportedHash -ne $Target.contentHash)
    }

    if ($hasLocalDrift) {
        return [pscustomobject]@{ action = 'manual-review'; reason = 'managed-local-drift' }
    }

    if ($Target.contentHash -ne $Source.contentHash) {
        return [pscustomobject]@{ action = 'update-candidate'; reason = 'managed-source-change' }
    }

    return [pscustomobject]@{ action = 'noop'; reason = 'no-change' }
}

$targetItems = Read-JsonArray -Path $TargetIndexPath
$sourceItems = Read-JsonArray -Path $SourceManifestPath

$targetById = To-LookupByArtifactId -Items $targetItems
$sourceById = To-LookupByArtifactId -Items $sourceItems

$allIds = New-Object System.Collections.Generic.HashSet[string]
foreach ($id in $targetById.Keys) { [void]$allIds.Add($id) }
foreach ($id in $sourceById.Keys) { [void]$allIds.Add($id) }

$actions = New-Object System.Collections.Generic.List[object]

foreach ($artifactId in ($allIds | Sort-Object)) {
    $target = $targetById[$artifactId]
    $source = $sourceById[$artifactId]

    $decision = Get-Decision -Target $target -Source $source -SourceRepo $SourceRepository

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
        action = $decision.action
        reason = $decision.reason
        source = if ($null -ne $target) { $target.source } else { $SourceRepository }
        ownershipMode = if ($null -ne $target) { $target.ownershipMode } else { 'managed' }
    })
}

$summary = [ordered]@{}
foreach ($name in @('update-candidate', 'add-candidate', 'manual-review', 'hold', 'preserve', 'noop', 'reject')) {
    $summary[$name] = @($actions | Where-Object { $_.action -eq $name }).Count
}

$plan = [pscustomobject]@{
    planId = "sync-plan-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
    generatedAt = (Get-Date).ToUniversalTime().ToString('o')
    sourceRepo = $SourceRepository
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
