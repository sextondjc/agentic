<#
.SYNOPSIS
    Detects coverage gaps, asset drift, and staleness in the PDL matrix governance system.

.DESCRIPTION
    Invoke-MatrixCoverageCheck.ps1 reads the Phase/Discipline/Lane coverage map and the skill
    discovery index, then reports five signal types:

    1. Asset drift     — a bundle member named in the matrix legend no longer exists as a skill or agent file.
    2. Stale matrix    — the matrix document is older than the last modification of skill-discovery-index.md.
    3. Promotion gap   — a skill file in skill-discovery-index.md has no PDL bundle code (X or N code) in its description.
    4. Discipline change — a discipline name appears in the matrix but is absent from the DEC-PDL-07 baseline list.
    5. Cell gap        — a matrix row has no Existing bundle code (only a dash), flagging it as tagged-only.

.PARAMETER RootPath
    Workspace root path. Defaults to the current directory.

.OUTPUTS
    PSCustomObject array with Signal, Asset, Detail, and RecommendedAction columns.
    Exits with code 1 if any Blocking signals are found.

.EXAMPLE
    .\Invoke-MatrixCoverageCheck.ps1 -RootPath C:\Projects\agentic
#>

[CmdletBinding()]
param(
    [string]$RootPath = (Get-Location).Path
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# ---------------------------------------------------------------------------
# Paths
# ---------------------------------------------------------------------------
$MatrixPath   = Join-Path $RootPath '.github\skills\matrix-skill-mapping\references\phase-discipline-lane-agentic-delivery-matrix.md'
$IndexPath    = Join-Path $RootPath '.github\skills\skill-discovery-index.md'
$SkillsRoot   = Join-Path $RootPath '.github\skills'
$AgentsRoot   = Join-Path $RootPath '.github\agents'

# DEC-PDL-07 baseline discipline list (as adopted in the matrix).
# Update this array whenever a discipline change is formally adopted after a matrix revisit.
$BaselineDisciplines = @(
    'Analysis', 'Architecture', 'Engineering', 'Governance',
    'Performance', 'Product Management', 'Project Management',
    'Security', 'Support', 'UX'
)

$signals = [System.Collections.Generic.List[PSCustomObject]]::new()

function Add-Signal {
    param(
        [string]$Signal,
        [string]$Severity,
        [string]$Asset,
        [string]$Detail,
        [string]$RecommendedAction
    )
    $signals.Add([PSCustomObject]@{
        Signal            = $Signal
        Severity          = $Severity
        Asset             = $Asset
        Detail            = $Detail
        RecommendedAction = $RecommendedAction
    })
}

# ---------------------------------------------------------------------------
# Guard: required files must exist
# ---------------------------------------------------------------------------
if (-not (Test-Path $MatrixPath)) {
    Write-Error "Matrix file not found at: $MatrixPath"
    exit 1
}
if (-not (Test-Path $IndexPath)) {
    Write-Error "Skill discovery index not found at: $IndexPath"
    exit 1
}

$matrixContent = Get-Content $MatrixPath -Raw
$indexContent  = Get-Content $IndexPath  -Raw

# ---------------------------------------------------------------------------
# Signal 1: Asset drift
# Extract bundle legend rows (X01-X12) and check each named asset exists.
# ---------------------------------------------------------------------------
$legendPattern = [regex]'`([a-z][a-z0-9\-\.]+)`'

# Isolate the legend section (between "### Existing Customisation Bundles" and "### Needed")
$legendSection = ''
if ($matrixContent -match '(?s)### Existing Customisation Bundles.*?### Needed') {
    $legendSection = $Matches[0]
}

$bundleAssets = $legendPattern.Matches($legendSection) | ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique

foreach ($asset in $bundleAssets) {
    # Skip instruction file names (end in .instructions.md) — they are file paths not directories
    if ($asset -match '\.instructions\.md$') {
        $assetFile = Join-Path $RootPath ".github\instructions\$asset"
        if (-not (Test-Path $assetFile)) {
            Add-Signal -Signal 'Asset drift' -Severity 'Blocking' -Asset $asset `
                -Detail "Instruction file '$asset' referenced in matrix legend not found at expected path." `
                -RecommendedAction "Create the instruction file or update the matrix legend to the correct filename."
        }
        continue
    }

    # Check as a skill directory
    $skillPath = Join-Path $SkillsRoot $asset
    # Check as an agent file
    $agentPath = Join-Path $AgentsRoot "$asset.agent.md"
    # Some assets are agent names listed in copilot-instructions without .agent.md extension check
    $agentPathMd = Join-Path $AgentsRoot "${asset}.md"

    if (-not (Test-Path $skillPath) -and -not (Test-Path $agentPath) -and -not (Test-Path $agentPathMd)) {
        Add-Signal -Signal 'Asset drift' -Severity 'Blocking' -Asset $asset `
            -Detail "Bundle member '$asset' not found as a skill directory or agent file." `
            -RecommendedAction "Verify the asset name in the matrix legend matches the actual directory or agent file name."
    }
}

# ---------------------------------------------------------------------------
# Signal 2: Stale matrix
# ---------------------------------------------------------------------------
$matrixModified = (Get-Item $MatrixPath).LastWriteTime
$indexModified  = (Get-Item $IndexPath).LastWriteTime

if ($indexModified -gt $matrixModified) {
    $ageDays = [math]::Round(($indexModified - $matrixModified).TotalDays, 1)
    Add-Signal -Signal 'Stale matrix' -Severity 'Major' -Asset 'phase-discipline-lane-agentic-delivery-matrix.md' `
        -Detail "skill-discovery-index.md was modified $ageDays day(s) after the matrix. Matrix may not reflect current skill inventory." `
        -RecommendedAction "Review skill-discovery-index.md for changes since the matrix was last updated and run a DEC-PDL-07 revisit if disciplines changed."
}

# ---------------------------------------------------------------------------
# Signal 3: Promotion gap
# Skills in the index that have no PDL bundle code (X## or N##) in their description.
# ---------------------------------------------------------------------------
$indexRows = $indexContent -split "`n" | Where-Object { $_ -match '^\|' -and $_ -notmatch '^[\|\s]*Skill[\|\s]*Primary' -and $_ -notmatch '^---' }

foreach ($row in $indexRows) {
    $cells = $row -split '\|' | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' }
    if ($cells.Count -lt 4) { continue }
    $skillName  = $cells[0]
    $description = $cells[3]  # When-to-use column

    if ($skillName -match '^Skill$') { continue }

    # Check if the description contains a PDL bundle code reference
    if ($description -notmatch '\b(X\d{2}|N\d{2})\b') {
        Add-Signal -Signal 'Promotion gap' -Severity 'Advisory' -Asset $skillName `
            -Detail "Skill '$skillName' has no PDL bundle code (X## or N##) in its discovery index description." `
            -RecommendedAction "If the skill serves matrix cells, add the relevant N-code or X-code reference to its index entry. If it does not serve matrix cells, this is expected."
    }
}

# ---------------------------------------------------------------------------
# Signal 4: Discipline change
# Extract discipline column values from the matrix and compare against baseline.
# ---------------------------------------------------------------------------
$disciplinePattern = [regex]'\|\s*\d+\s*\|\s*\w[\w\s]+\s*\|\s*([\w][\w\s]+?)\s*\|'
$foundDisciplines  = [System.Collections.Generic.HashSet[string]]::new()

foreach ($match in $disciplinePattern.Matches($matrixContent)) {
    $disc = $match.Groups[1].Value.Trim()
    if ($disc -and $disc -notmatch '^(Phase|Discipline|Lane|Plan|Execute|Review|ANALYSIS|DESIGN|IMPLEMENTATION|RELEASE|TEST)$') {
        [void]$foundDisciplines.Add($disc)
    }
}

foreach ($disc in $foundDisciplines) {
    if ($disc -notin $BaselineDisciplines) {
        Add-Signal -Signal 'Discipline change' -Severity 'Blocking' -Asset $disc `
            -Detail "Discipline '$disc' found in matrix rows but not in the DEC-PDL-07 baseline list." `
            -RecommendedAction "If this discipline was formally added via a DEC-PDL-07 revisit, add it to the `$BaselineDisciplines array in this script. If not, remove it from the matrix."
    }
}

foreach ($baseline in $BaselineDisciplines) {
    if ($baseline -notin $foundDisciplines) {
        Add-Signal -Signal 'Discipline change' -Severity 'Major' -Asset $baseline `
            -Detail "Baseline discipline '$baseline' is in the DEC-PDL-07 list but not found in any matrix row." `
            -RecommendedAction "If this discipline was removed via a DEC-PDL-07 revisit, remove it from the `$BaselineDisciplines array. If not, investigate missing rows."
    }
}

# ---------------------------------------------------------------------------
# Signal 5: Cell gap (tagged-only cells — Existing column is a dash)
# ---------------------------------------------------------------------------
$matrixRows = $matrixContent -split "`n" | Where-Object { $_ -match '^\|\s*\d+\s*\|' }

$cellGapCount = 0
foreach ($row in $matrixRows) {
    $cells = $row -split '\|' | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' }
    # Columns: ID, Phase, Discipline, Lane, Description, Potential Workflow, Existing, Needed, Optional
    if ($cells.Count -lt 7) { continue }
    $existingCol = $cells[6]
    $rowId       = $cells[0]
    $discipline  = $cells[2]
    $lane        = $cells[3]

    if ($existingCol -eq '-') {
        $cellGapCount++
        if ($cellGapCount -le 10) {
            Add-Signal -Signal 'Cell gap' -Severity 'Advisory' -Asset "Row $rowId ($discipline / $lane)" `
                -Detail "Matrix row $rowId has no existing bundle coverage (tagged only)." `
                -RecommendedAction "If a valid combination, this is expected per DEC-PDL-05. Promote only when the Adoption Protocol criteria are met."
        }
    }
}

if ($cellGapCount -gt 10) {
    Add-Signal -Signal 'Cell gap' -Severity 'Advisory' -Asset 'Multiple rows' `
        -Detail "$cellGapCount tagged-only cells found (first 10 reported individually)." `
        -RecommendedAction "Review tagged-only cells against the Adoption Protocol in the matrix document before creating new assets."
}

# ---------------------------------------------------------------------------
# Output
# ---------------------------------------------------------------------------
Write-Host ''
Write-Host '=== PDL Matrix Coverage Check ===' -ForegroundColor Cyan
Write-Host "Matrix:  $MatrixPath"
Write-Host "Index:   $IndexPath"
Write-Host "Run at:  $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
Write-Host ''

if ($signals.Count -eq 0) {
    Write-Host 'No signals detected. Coverage map is consistent with the current skill inventory.' -ForegroundColor Green
    exit 0
}

$signals | Format-Table -AutoSize -Wrap

$blockingCount = @($signals | Where-Object { $_.Severity -eq 'Blocking' }).Count
$majorCount    = @($signals | Where-Object { $_.Severity -eq 'Major'    }).Count
$advisoryCount = @($signals | Where-Object { $_.Severity -eq 'Advisory' }).Count

Write-Host "Summary: $blockingCount Blocking  |  $majorCount Major  |  $advisoryCount Advisory" -ForegroundColor Yellow

if ($blockingCount -gt 0) {
    Write-Host 'Blocking signals present. Address before treating the matrix as current.' -ForegroundColor Red
    exit 1
}

exit 0
