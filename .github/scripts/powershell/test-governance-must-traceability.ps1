# Test-GovernanceMustTraceability.ps1: Ensure MUST findings map to canonical check IDs and evidence scripts.
# Usage: ./.github/scripts/powershell/test-governance-must-traceability.ps1 [-ReportPath <path>] [-RegistryPath <path>]
# Output: Success message (exit 0) or violation rows (exit 1).

param(
    [Parameter(Mandatory = $false)]
    [string]$ReportPath = '__DOCS_ROOT__/changes/governance/audits/execute-customization-audit.md',

    [Parameter(Mandatory = $false)]
    [string]$RegistryPath = '.github/scripts/powershell/governance-must-check-registry.json'
)

$ErrorActionPreference = 'Stop'

function Split-MarkdownRow {
    param([string]$Line)

    if ([string]::IsNullOrWhiteSpace($Line)) {
        return @()
    }

    $trimmed = $Line.Trim()
    if ($trimmed.StartsWith('|')) {
        $trimmed = $trimmed.Substring(1)
    }
    if ($trimmed.EndsWith('|')) {
        $trimmed = $trimmed.Substring(0, $trimmed.Length - 1)
    }

    return @($trimmed.Split('|') | ForEach-Object { $_.Trim() })
}

if (-not (Test-Path -LiteralPath $RegistryPath)) {
    Write-Error "Registry not found: $RegistryPath"
    exit 1
}

$registry = Get-Content -LiteralPath $RegistryPath -Raw | ConvertFrom-Json
$mustChecks = @($registry.mustChecks)
if ($mustChecks.Count -eq 0) {
    Write-Error "Registry has no mustChecks entries: $RegistryPath"
    exit 1
}

$mustCheckMap = @{}
foreach ($entry in $mustChecks) {
    if ([string]::IsNullOrWhiteSpace($entry.checkId)) {
        Write-Error "Invalid registry entry: missing checkId"
        exit 1
    }

    if ($mustCheckMap.ContainsKey($entry.checkId)) {
        Write-Error "Duplicate checkId in registry: $($entry.checkId)"
        exit 1
    }

    $mustCheckMap[$entry.checkId] = $entry
}

if (-not (Test-Path -LiteralPath $ReportPath)) {
    Write-Output "Report not found; traceability check skipped: $ReportPath"
    exit 0
}

$lines = Get-Content -LiteralPath $ReportPath
$headingIndex = -1
for ($i = 0; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match '^##\s+Failure Detail Grid\s*$') {
        $headingIndex = $i
        break
    }
}

if ($headingIndex -lt 0) {
    Write-Output "Failure Detail Grid not found; traceability check skipped: $ReportPath"
    exit 0
}

$tableLines = @()
for ($j = $headingIndex + 1; $j -lt $lines.Count; $j++) {
    $line = $lines[$j]
    if ($line -match '^\s*$') {
        if ($tableLines.Count -gt 0) {
            break
        }
        continue
    }

    if ($line.Trim().StartsWith('|')) {
        $tableLines += $line
        continue
    }

    if ($tableLines.Count -gt 0) {
        break
    }
}

if ($tableLines.Count -lt 2) {
    Write-Output "Failure Detail Grid has no table rows; traceability check skipped: $ReportPath"
    exit 0
}

$headers = Split-MarkdownRow -Line $tableLines[0]
$headerMap = @{}
for ($h = 0; $h -lt $headers.Count; $h++) {
    $headerMap[$headers[$h]] = $h
}

$severityColumn = if ($headerMap.ContainsKey('Severity')) { 'Severity' } else { $null }
$checkColumn = if ($headerMap.ContainsKey('Check')) { 'Check' } elseif ($headerMap.ContainsKey('Type')) { 'Type' } else { $null }
$evidenceColumn = if ($headerMap.ContainsKey('Evidence')) { 'Evidence' } else { $null }
$idColumn = if ($headerMap.ContainsKey('ID')) { 'ID' } else { $null }

if (-not $severityColumn -or -not $checkColumn) {
    Write-Error "Failure Detail Grid must contain 'Severity' and either 'Check' or 'Type' columns in $ReportPath"
    exit 1
}

$violations = @()
for ($r = 2; $r -lt $tableLines.Count; $r++) {
    $row = Split-MarkdownRow -Line $tableLines[$r]
    if ($row.Count -eq 0) {
        continue
    }

    $severity = $row[$headerMap[$severityColumn]]
    if ($severity -notmatch 'MUST') {
        continue
    }

    $checkId = $row[$headerMap[$checkColumn]]
    $evidence = if ($evidenceColumn) { $row[$headerMap[$evidenceColumn]] } else { '' }
    $findingId = if ($idColumn) { $row[$headerMap[$idColumn]] } else { "row-$r" }

    if ([string]::IsNullOrWhiteSpace($checkId)) {
        $violations += [pscustomobject]@{
            FindingId = $findingId
            Issue = 'MissingCheckId'
            Detail = 'MUST finding is missing check identifier in Check/Type column'
        }
        continue
    }

    if (-not $mustCheckMap.ContainsKey($checkId)) {
        $violations += [pscustomobject]@{
            FindingId = $findingId
            Issue = 'UnmappedMustCheck'
            Detail = "MUST check '$checkId' is not defined in registry $RegistryPath"
        }
        continue
    }

    $expectedScript = [string]$mustCheckMap[$checkId].sourceScript
    if (-not [string]::IsNullOrWhiteSpace($expectedScript)) {
        $expectedScriptFile = Split-Path -Leaf $expectedScript
        if ([string]::IsNullOrWhiteSpace($evidence) -or $evidence -notmatch [regex]::Escape($expectedScriptFile)) {
            $violations += [pscustomobject]@{
                FindingId = $findingId
                Issue = 'EvidenceMismatch'
                Detail = "MUST check '$checkId' must reference evidence from '$expectedScriptFile'"
            }
        }
    }
}

if ($violations.Count -gt 0) {
    $violations | Format-Table -AutoSize | Out-String | Write-Output
    exit 1
}

Write-Output "All MUST findings map to canonical checks and evidence scripts."

