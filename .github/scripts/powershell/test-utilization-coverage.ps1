# test-utilization-coverage.ps1: Validate that each indexed skill is referenced by at least one agent or prompt.
# Usage: ./.github/scripts/powershell/test-utilization-coverage.ps1 [-RootPath <path>]
# Output: PSCustomObject rows with Skill, ReferenceCount, ReferencedBy, Status. Exits 1 when any skill is orphaned.

[CmdletBinding()]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$RootPath = (Get-Location).Path
)

$ErrorActionPreference = 'Stop'
$resolvedRoot = Resolve-Path -LiteralPath $RootPath -ErrorAction Stop
$indexPath = Join-Path $resolvedRoot '.github/skills/skill-discovery-index.md'
if (-not (Test-Path -LiteralPath $indexPath)) { Write-Error "Skill index not found: $indexPath"; exit 1 }

$skillRows = Get-Content -LiteralPath $indexPath | Where-Object { $_ -match '^\|' -and $_ -notmatch '^\|---' }
$skills = foreach ($row in $skillRows) {
    $cells = $row -split '\|'
    if ($cells.Count -lt 3) { continue }
    $skill = $cells[1].Trim().Trim('`')
    if ($skill -and $skill -ne 'Skill') { $skill }
}
$skills = @($skills | Sort-Object -Unique)
if ($skills.Count -eq 0) { Write-Error 'No skills parsed from skill-discovery-index.md.'; exit 1 }

$searchFiles = @(
    Get-ChildItem -LiteralPath (Join-Path $resolvedRoot '.github/agents') -Filter '*.agent.md' -File -ErrorAction SilentlyContinue
    Get-ChildItem -LiteralPath (Join-Path $resolvedRoot '.github/prompts') -Filter '*.prompt.md' -File -ErrorAction SilentlyContinue
    Get-ChildItem -LiteralPath (Join-Path $resolvedRoot '.github/skills') -Recurse -Filter 'SKILL.md' -File -ErrorAction SilentlyContinue
)

$rows = foreach ($skill in $skills) {
    $pattern = "(?<![A-Za-z0-9-])$([Regex]::Escape($skill))(?![A-Za-z0-9-])"
    $refs = [System.Collections.Generic.List[string]]::new()
    foreach ($file in $searchFiles) {
        if ($file.FullName -like "*\\.github\\skills\\$skill\\SKILL.md") { continue }
        if (Select-String -LiteralPath $file.FullName -Pattern $pattern -Quiet) {
            $relativePath = ($file.FullName.Substring($resolvedRoot.Path.Length) -replace '^[\\/]+','') -replace '\\','/'
            $refs.Add($relativePath)
        }
    }
    [PSCustomObject]@{
        Skill = $skill
        ReferenceCount = @($refs | Sort-Object -Unique).Count
        ReferencedBy = (($refs | Sort-Object -Unique) -join '; ')
        Status = if ($refs.Count -gt 0) { 'In Use' } else { 'Orphaned' }
    }
}

$orphaned = @($rows | Where-Object { $_.Status -eq 'Orphaned' })
$rows | Sort-Object Status, Skill
if ($orphaned.Count -gt 0) {
    Write-Warning "Utilization coverage failed: $($orphaned.Count) orphaned skill(s)."
    exit 1
}

Write-Output 'Utilization coverage passed: all indexed skills are referenced by at least one non-self artifact.'
exit 0
