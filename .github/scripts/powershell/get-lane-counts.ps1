# Get-LaneCounts.ps1: Count agents and skills per lifecycle lane from catalogs
# Usage: ./get-lane-counts.ps1 -AssetType 'agents'|'skills'|'instructions'|'prompts'
# Output: PSCustomObject with lane name and count

param(
  [Parameter(Mandatory=$true)][ValidateSet('agents','skills','instructions','prompts')][string]$AssetType
)

$catalogMap = @{
  'agents' = '.github/agents/README.md'
  'skills' = '.github/skills/README.md'
  'instructions' = '.github/instructions/README.md'
  'prompts' = '.github/prompts/README.md'
}

$catalogFile = $catalogMap[$AssetType]
if (-not (Test-Path $catalogFile)) {
  Write-Error "Catalog not found: $catalogFile"
  exit 1
}

$content = Get-Content $catalogFile
$rows = $content | Where-Object { $_ -match '^\| ' }

if ($AssetType -eq 'skills' -or $AssetType -eq 'instructions') {
  # Lane is column 2 (index 1)
  $objs = foreach ($r in $rows) {
    if ($r -match '^\| [a-z0-9-]+ \| (Planning|Execution|Review) \|') {
      [pscustomobject]@{ Lane = $Matches[1] }
    }
  }
} else {
  # For agents and prompts, search for lane in column text
  $objs = foreach ($r in $rows) {
    if ($r -match '(Planning|Execution|Review)') {
      [pscustomobject]@{ Lane = $Matches[1] }
    }
  }
}

$objs | Group-Object Lane | Select-Object @{N='Lane';E={$_.Name}}, @{N='Count';E={$_.Count}}
