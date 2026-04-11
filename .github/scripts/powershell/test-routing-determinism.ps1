# test-routing-determinism.ps1: Validate deterministic routing coverage using compose-skills registry and benchmark corpus.
# Usage: ./.github/scripts/powershell/test-routing-determinism.ps1 [-RootPath <path>] [-RegistryPath <path>] [-BenchmarkPath <path>]
# Output: PSCustomObject rows with CaseId, Expected, Selected, Missing, Status. Exits 1 if required skills are missed.

[CmdletBinding()]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$RootPath = (Get-Location).Path,

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$RegistryPath = '.github/skills/compose-skills/references/capability-routing-registry.json',

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$BenchmarkPath = '.github/skills/compose-skills/references/routing-benchmark-cases.json'
)

$ErrorActionPreference = 'Stop'
$resolvedRoot = Resolve-Path -LiteralPath $RootPath -ErrorAction Stop
$resolvedRegistryPath = [System.IO.Path]::GetFullPath((Join-Path -Path $resolvedRoot -ChildPath $RegistryPath))
$resolvedBenchmarkPath = [System.IO.Path]::GetFullPath((Join-Path -Path $resolvedRoot -ChildPath $BenchmarkPath))
$indexPath = [System.IO.Path]::GetFullPath((Join-Path -Path $resolvedRoot -ChildPath '.github/skills/skill-discovery-index.md'))

if (-not (Test-Path -LiteralPath $resolvedRegistryPath)) { Write-Error "Routing registry not found: $resolvedRegistryPath"; exit 1 }
if (-not (Test-Path -LiteralPath $resolvedBenchmarkPath)) { Write-Error "Routing benchmark not found: $resolvedBenchmarkPath"; exit 1 }
if (-not (Test-Path -LiteralPath $indexPath)) { Write-Error "Skill index not found: $indexPath"; exit 1 }

$registry = Get-Content -LiteralPath $resolvedRegistryPath -Raw | ConvertFrom-Json
$benchmark = Get-Content -LiteralPath $resolvedBenchmarkPath -Raw | ConvertFrom-Json

$skillRows = Get-Content -LiteralPath $indexPath | Where-Object { $_ -match '^\|' -and $_ -notmatch '^\|---' }
$indexedSkills = foreach ($row in $skillRows) {
    $cells = $row -split '\|'
    if ($cells.Count -lt 3) { continue }
    $skillName = $cells[1].Trim().Trim('`')
    if ($skillName -and $skillName -ne 'Skill') { $skillName }
}
$indexedSkills = @($indexedSkills | Sort-Object -Unique)

foreach ($capability in $registry.capabilities) {
    foreach ($requiredSkill in $capability.requiredSkills) {
        if ($requiredSkill -notin $indexedSkills) {
            Write-Error "Registry references non-indexed skill '$requiredSkill' in capability '$($capability.id)'."
            exit 1
        }
    }
}

function Get-CandidateSkills {
    param(
        [Parameter(Mandatory = $true)]
        [string]$RequestText,
        [Parameter(Mandatory = $true)]
        $CapabilityRegistry
    )

    $requestLower = $RequestText.ToLowerInvariant()
    $selected = [System.Collections.Generic.HashSet[string]]::new()

    foreach ($capability in $CapabilityRegistry.capabilities) {
        $matched = $false
        foreach ($keyword in $capability.keywords) {
            if ($requestLower.Contains($keyword.ToLowerInvariant())) {
                $matched = $true
                break
            }
        }

        if ($matched) {
            foreach ($requiredSkill in $capability.requiredSkills) {
                [void]$selected.Add($requiredSkill)
            }
        }
    }

    return @($selected | Sort-Object)
}

$rows = foreach ($case in $benchmark.cases) {
    $selectedA = @(Get-CandidateSkills -RequestText $case.request -CapabilityRegistry $registry)
    $selectedB = @(Get-CandidateSkills -RequestText $case.request -CapabilityRegistry $registry)

    if (($selectedA -join ';') -ne ($selectedB -join ';')) {
        Write-Error "Non-deterministic selection detected in case '$($case.id)'."
        exit 1
    }

    $expected = @($case.requiredSkills | Sort-Object -Unique)
    $missing = @($expected | Where-Object { $_ -notin $selectedA })

    [PSCustomObject]@{
        CaseId = $case.id
        Expected = ($expected -join ', ')
        Selected = ($selectedA -join ', ')
        Missing = ($missing -join ', ')
        Status = if ($missing.Count -eq 0) { 'Pass' } else { 'Fail' }
    }
}

$failed = @($rows | Where-Object { $_.Status -eq 'Fail' })
$rows

if ($failed.Count -gt 0) {
    Write-Warning "Routing determinism failed: $($failed.Count) benchmark case(s) missed required skills."
    exit 1
}

Write-Output "Routing determinism passed: $($rows.Count) benchmark case(s) validated with deterministic selection and full required-skill coverage."
exit 0
