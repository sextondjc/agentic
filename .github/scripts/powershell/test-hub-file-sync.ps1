# Test-HubFileSync.ps1: Verify copilot-instructions.md preferred lists match actual assets
# Usage: ./test-hub-file-sync.ps1
# Output: Divergences between preferred lists and actual assets

$c = Get-Content .github/copilot-instructions.md

# Extract agent lines
$aStart = ($c | Select-String '^## Preferred Agents').LineNumber
$sStart = ($c | Select-String '^## Preferred Skills').LineNumber
$aEnd = $sStart - 1
$aLines = $c[($aStart)..($aEnd - 1)]
$preferred_agents = $aLines | ForEach-Object {
  if ($_ -match '^\| `([^`]+)` \|') { $Matches[1] }
} | Where-Object { $_ }

# Extract skills lines
$iStart = ($c | Select-String '^## Imported Superpowers Assets').LineNumber
$sEnd = $iStart - 1
$sLines = $c[($sStart)..($sEnd - 1)]
$preferred_skills = $sLines | ForEach-Object {
  if ($_ -match '^- `([^`]+)`') { $Matches[1] }
} | Where-Object { $_ }

$actual_agents = Get-ChildItem .github/agents/*.agent.md | ForEach-Object { $_.BaseName -replace '\.agent$', '' }
$actual_skills = Get-ChildItem .github/skills -Directory | Select-Object -ExpandProperty Name

$divergence = @{}
$missing_agents = @($actual_agents | Where-Object { $_ -notin $preferred_agents })
$stale_agents = @($preferred_agents | Where-Object { $_ -notin $actual_agents })
$missing_skills = @($actual_skills | Where-Object { $_ -notin $preferred_skills })
$stale_skills = @($preferred_skills | Where-Object { $_ -notin $actual_skills })

if ($missing_agents) { $divergence['Missing agents'] = $missing_agents }
if ($stale_agents) { $divergence['Stale agents'] = $stale_agents }
if ($missing_skills) { $divergence['Missing skills'] = $missing_skills }
if ($stale_skills) { $divergence['Stale skills'] = $stale_skills }

if ($divergence.Count -eq 0) {
  Write-Output "Hub file is synced: all agents and skills match preferred lists."
  exit 0
} else {
  $divergence | ConvertTo-Json
  exit 1
}
