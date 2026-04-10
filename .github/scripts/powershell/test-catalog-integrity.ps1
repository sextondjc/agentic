# Test-CatalogIntegrity.ps1: Compare cataloged assets to actual files.
# Usage: ./test-catalog-integrity.ps1 -AssetType 'agents'|'skills'|'instructions'|'prompts'
# Output: PSCustomObject with MissingInCatalog and StaleInCatalog arrays.

param(
  [Parameter(Mandatory = $true)][ValidateSet('agents', 'skills', 'instructions', 'prompts')][string]$AssetType
)

function Get-ActualAssets {
  param([string]$Type)

  switch ($Type) {
    'agents' {
      Get-ChildItem '.github/agents/*.agent.md' -File |
        ForEach-Object { $_.BaseName -replace '\.agent$', '' }
      break
    }
    'skills' {
      Get-ChildItem '.github/skills' -Directory |
        Select-Object -ExpandProperty Name
      break
    }
    'instructions' {
      Get-ChildItem '.github/instructions/*.instructions.md' -File |
        Select-Object -ExpandProperty Name
      break
    }
    'prompts' {
      Get-ChildItem '.github/prompts/*.prompt.md' -File |
        ForEach-Object { $_.BaseName -replace '\.prompt$', '' }
      break
    }
  }
}

function Get-CatalogAssets {
  param([string]$Type)

  $catalogPath = switch ($Type) {
    'agents' { '.github/agents/agent-lifecycle-catalog.md' }
    'skills' { '.github/skills/skill-discovery-index.md' }
    'instructions' { '.github/instructions/instruction-lifecycle-catalog.md' }
    'prompts' { '.github/prompts/prompt-lifecycle-catalog.md' }
  }

  $headerCell = switch ($Type) {
    'agents' { 'Agent' }
    'skills' { 'Skill' }
    'instructions' { 'Instruction File' }
    'prompts' { 'Prompt File' }
  }

  Get-Content $catalogPath |
    Where-Object { $_ -match '^\|' -and $_ -notmatch '^\|\s*---' } |
    ForEach-Object {
      $cells = $_ -split '\|'
      if ($cells.Count -lt 3) { return }

      $name = $cells[1].Trim().Trim('`')
      if (-not $name -or $name -eq $headerCell) { return }
      $name
    }
}

function Compare-Catalog {
  param([array]$Actual, [array]$Catalog)

  [pscustomobject]@{
    MissingInCatalog = @($Actual | Where-Object { $_ -notin $Catalog })
    StaleInCatalog = @($Catalog | Where-Object { $_ -notin $Actual })
  }
}

$actual = @(Get-ActualAssets -Type $AssetType | Where-Object { $_ -and $_.Trim().Length -gt 0 } | Sort-Object -Unique)
$catalog = @(Get-CatalogAssets -Type $AssetType | Where-Object { $_ -and $_.Trim().Length -gt 0 } | Sort-Object -Unique)

$result = Compare-Catalog -Actual $actual -Catalog $catalog

if ($result.MissingInCatalog.Count -gt 0 -or $result.StaleInCatalog.Count -gt 0) {
  Write-Error "Catalog integrity failed for '$AssetType': $($result.MissingInCatalog.Count) missing, $($result.StaleInCatalog.Count) stale."
  $result
  exit 1
}

Write-Output "Catalog integrity passed for '$AssetType': all entries match on-disk assets."
$result

