# Test-HubFileSync.ps1: Verify copilot-instructions.md preferred agents and catalog-backed asset sync
# Usage: ./test-hub-file-sync.ps1
# Output: Divergences between preferred agents and catalog-backed assets

$c = Get-Content .github/copilot-instructions.md
$rawHub = ($c -join "`n")

# Extract preferred agents from the Agent markdown table
$agentTable = [regex]::Match($rawHub, '(?ms)^\| Agent \| Use when\.\.\. \|\r?\n\|---\|---\|\r?\n(.+?)(\r?\n\r?\n|\z)').Groups[1].Value
$preferred_agents = [regex]::Matches($agentTable, '(?m)^\| `([^`]+)` \|') | ForEach-Object {
  $_.Groups[1].Value
} | Where-Object { $_ }

$actual_agents = Get-ChildItem .github/agents/*.agent.md | ForEach-Object { $_.BaseName -replace '\.agent$', '' }

$divergence = @{}
$missing_agents = @($actual_agents | Where-Object { $_ -notin $preferred_agents })
$stale_agents = @($preferred_agents | Where-Object { $_ -notin $actual_agents })

if ($missing_agents) { $divergence['Missing agents'] = $missing_agents }
if ($stale_agents) { $divergence['Stale agents'] = $stale_agents }

# Validate prompts against prompt-lifecycle-catalog.md
$promptCatalog = Get-Content .github/prompts/prompt-lifecycle-catalog.md
$catalogged_prompts = $promptCatalog | ForEach-Object {
  if ($_ -match '\| `([^`]+\.prompt\.md)` \|') { $Matches[1] }
} | Where-Object { $_ }
$actual_prompts = Get-ChildItem .github/prompts/*.prompt.md | Select-Object -ExpandProperty Name
$missing_prompts = @($actual_prompts | Where-Object { $_ -notin $catalogged_prompts })
$stale_prompts = @($catalogged_prompts | Where-Object { $_ -notin $actual_prompts })
if ($missing_prompts) { $divergence['Missing prompts in catalog'] = $missing_prompts }
if ($stale_prompts) { $divergence['Stale prompts in catalog'] = $stale_prompts }

# Validate instructions against instruction-lifecycle-catalog.md
$instrCatalog = Get-Content .github/instructions/instruction-lifecycle-catalog.md
$catalogged_instructions = $instrCatalog | ForEach-Object {
  if ($_ -match '^\| `([^`]+\.instructions\.md)` \|') { $Matches[1] }
} | Where-Object { $_ }
$actual_instructions = Get-ChildItem .github/instructions/*.instructions.md | Select-Object -ExpandProperty Name
$missing_instructions = @($actual_instructions | Where-Object { $_ -notin $catalogged_instructions })
$stale_instructions = @($catalogged_instructions | Where-Object { $_ -notin $actual_instructions })
if ($missing_instructions) { $divergence['Missing instructions in catalog'] = $missing_instructions }
if ($stale_instructions) { $divergence['Stale instructions in catalog'] = $stale_instructions }

if ($divergence.Count -eq 0) {
  Write-Output "Hub file is synced: preferred agents and prompt/instruction catalogs match assets."
  exit 0
} else {
  $divergence | ConvertTo-Json
  exit 1
}
