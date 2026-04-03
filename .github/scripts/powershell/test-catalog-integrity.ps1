# Test-CatalogIntegrity.ps1: Compare cataloged assets to actual files
# Usage: ./test-catalog-integrity.ps1 -AssetType 'agents'|'skills'|'instructions'|'prompts'
# Output: PSCustomObject with MissingInCatalog and StaleInCatalog arrays

param(
  [Parameter(Mandatory=$true)][ValidateSet('agents','skills','instructions','prompts')][string]$AssetType
)

function Compare-Catalog {
  param([array]$Actual, [array]$Catalog)
  [pscustomobject]@{
    MissingInCatalog = @($Actual | Where-Object { $_ -notin $Catalog })
    StaleInCatalog = @($Catalog | Where-Object { $_ -notin $Actual })
  }
}

$assetMap = @{
  'agents' = @{ ext = '*.agent.md'; pattern = '^\| `([^`]+)` \|'; catalog = '.github/agents/README.md' }
  'skills' = @{ dir = $true; pattern = '^\| ([a-z0-9-]+) \| (Planning|Execution|Review) \|'; catalog = '.github/skills/README.md' }
  'instructions' = @{ ext = '*.instructions.md'; pattern = '^\| `([^`]+\.instructions\.md)` \|'; catalog = '.github/instructions/README.md' }
  'prompts' = @{ ext = '*.prompt.md'; pattern = '^\| `([^`]+)` \|'; catalog = '.github/prompts/README.md' }
}

$config = $assetMap[$AssetType]

# Get actual assets
if ($config.dir) {
  $actual = Get-ChildItem ".github/$AssetType" -Directory | Select-Object -ExpandProperty Name
} else {
  $actual = Get-ChildItem ".github/$AssetType/$($config.ext)" | ForEach-Object {
    if ($AssetType -eq 'instructions') { $_.Name } else { $_.BaseName -replace "\.($AssetType -replace 's$','')$", '' }
  }
}

# Get cataloged assets
$catalogRows = Get-Content $config.catalog | Where-Object { $_ -match '^\| ' }
$catalog = foreach ($row in $catalogRows) {
  if ($row -match $config.pattern) { $Matches[1] }
}

Compare-Catalog $actual $catalog
