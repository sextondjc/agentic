# Get-LaneCounts.ps1: Count agents and skills per lifecycle lane from catalogs
# Usage: ./get-lane-counts.ps1 -AssetType 'agents'|'skills'|'instructions'|'prompts'
# Output: PSCustomObject with lane name and count

param(
  [Parameter(Mandatory=$true)][ValidateSet('agents','skills','instructions','prompts')][string]$AssetType
)

$catalogMap = @{
  'agents' = '.github/agents/agent-lifecycle-catalog.md'
  'skills' = '.github/skills/skill-discovery-index.md'
  'instructions' = '.github/instructions/instruction-lifecycle-catalog.md'
  'prompts' = '.github/prompts/prompt-lifecycle-catalog.md'
}

$catalogFile = $catalogMap[$AssetType]
if (-not (Test-Path $catalogFile)) {
  Write-Error "Catalog not found: $catalogFile"
  exit 1
}

$content = Get-Content $catalogFile
$laneColumn = if ($AssetType -eq 'prompts') { 3 } else { 2 }

$objs = foreach ($r in ($content | Where-Object { $_ -match '^\|' -and $_ -notmatch '^\|\s*---' })) {
  $cells = @($r -split '\|' | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' })
  if ($cells.Count -lt $laneColumn) { continue }

  $lane = $cells[$laneColumn - 1]
  if ($lane -notin @('Planning', 'Execution', 'Review')) { continue }

  [pscustomobject]@{ Lane = $lane }
}

$objs | Group-Object Lane | Sort-Object Name | Select-Object @{N='Lane';E={$_.Name}}, @{N='Count';E={$_.Count}}

