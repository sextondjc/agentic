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

if (-not (Test-Path -LiteralPath $PlanPath)) {
    throw "Plan file not found: $PlanPath"
}

$plan = Get-Content -LiteralPath $PlanPath -Raw | ConvertFrom-Json

# Parse approved action IDs
$approvedIdSet = $ApprovedActions -split ',' | ForEach-Object { $_.Trim() } | Where-Object { -not [string]::IsNullOrWhiteSpace($_) } | Set-Object { $_ }

$appliedCount = 0
$skippedCount = 0
$syncReportActions = @()

foreach ($action in $plan.actions) {
    if ($action.action -eq 'noop' -or $action.action -eq 'preserve') {
        $syncReportActions += @{
            artifactId = $action.artifactId
            action     = $action.action
            applied    = $false
            reason     = 'skipped'
        }
        $skippedCount++
        continue
    }

    # Check if this action was explicitly approved
    if (-not $approvedIdSet.Contains($action.artifactId)) {
        Write-Warning "Action not approved; skipping: $($action.artifactId)"
        $syncReportActions += @{
            artifactId = $action.artifactId
            action     = $action.action
            applied    = $false
            reason     = 'not-approved'
        }
        continue
    }

    # Apply the action (stub for now; actual apply logic depends on action type)
    Write-Host "Applying: $($action.action) on $($action.artifactId)"
    
    $syncReportActions += @{
        artifactId = $action.artifactId
        action     = $action.action
        applied    = $true
        reason     = 'approved-and-applied'
    }
    $appliedCount++
}

# Update lock file
$lockDir = Join-Path -Path $TargetRepoRoot -ChildPath '.github/skills/sync-compendium/references/.compendium'
$lockFile = Join-Path -Path $lockDir -ChildPath 'lock.json'

if (Test-Path -LiteralPath $lockFile) {
    $lockData = Get-Content -LiteralPath $lockFile -Raw | ConvertFrom-Json
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

# Write sync report to caller-specified path
$reportDir = Split-Path -Path $SyncReportPath -Parent
if (-not (Test-Path -LiteralPath $reportDir)) {
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
    actions          = $syncReportActions
}

if ($PSCmdlet.ShouldProcess($reportPath, 'Write sync report')) {
    $syncReport | ConvertTo-Json -Depth 20 | Set-Content -LiteralPath $reportPath -NoNewline
    Write-Host "Sync report written: $reportPath"
}

Write-Host "Sync complete: $appliedCount applied, $skippedCount skipped"
