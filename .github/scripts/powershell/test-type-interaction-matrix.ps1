[CmdletBinding()]
param(
    [string]$RootPath = ".",
    [string]$ReportPath = ".docs/changes/governance/type-audits/audit-customization-types.md"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$resolvedRoot = (Resolve-Path -LiteralPath $RootPath).Path
$resolvedReport = if ([System.IO.Path]::IsPathRooted($ReportPath)) { $ReportPath } else { Join-Path $resolvedRoot $ReportPath }

if (-not (Test-Path -LiteralPath $resolvedReport)) {
    Write-Error "Type interaction report not found at '$resolvedReport'."
    exit 1
}

$content = Get-Content -LiteralPath $resolvedReport

$sameTypePairs = @(
    "agent vs agent",
    "instruction vs instruction",
    "prompt vs prompt",
    "skill vs skill"
)

$crossTypePairs = @(
    "agent vs instruction",
    "agent vs prompt",
    "agent vs skill",
    "instruction vs prompt",
    "instruction vs skill",
    "prompt vs skill"
)

function Test-PairPresent {
    param([string[]]$Lines, [string]$Pair)
    $escapedPair = [Regex]::Escape($Pair)
    return [bool]($Lines -match "^\|\s*$escapedPair\s*\|")
}

function Get-FailurePropagationYesCount {
    param([string[]]$Lines, [string[]]$Pairs)
    $count = 0
    foreach ($pair in $Pairs) {
        $escapedPair = [Regex]::Escape($pair)
        $line = $Lines | Where-Object { $_ -match "^\|\s*$escapedPair\s*\|" } | Select-Object -First 1
        if ($null -ne $line -and $line -match "\|\s*Yes\s*\|") {
            $count++
        }
    }
    return $count
}

$missingSame = @($sameTypePairs | Where-Object { -not (Test-PairPresent -Lines $content -Pair $_) })
$missingCross = @($crossTypePairs | Where-Object { -not (Test-PairPresent -Lines $content -Pair $_) })

$sameYes = Get-FailurePropagationYesCount -Lines $content -Pairs $sameTypePairs
$crossYes = Get-FailurePropagationYesCount -Lines $content -Pairs $crossTypePairs

$result = [PSCustomObject]@{
    ReportPath = $resolvedReport
    SameTypePairsExpected = $sameTypePairs.Count
    SameTypePairsFound = $sameTypePairs.Count - $missingSame.Count
    CrossTypePairsExpected = $crossTypePairs.Count
    CrossTypePairsFound = $crossTypePairs.Count - $missingCross.Count
    MissingSameTypePairs = ($missingSame -join ", ")
    MissingCrossTypePairs = ($missingCross -join ", ")
    FailurePropagationYesSameType = $sameYes
    FailurePropagationYesCrossType = $crossYes
    Status = if (($missingSame.Count + $missingCross.Count) -eq 0) { "Pass" } else { "Fail" }
}

$result

if ($result.Status -eq "Fail") {
    exit 1
}

exit 0