# test-naming-conformance.ps1: Check .docs file and folder naming policy conformance.
# Usage: ./test-naming-conformance.ps1 -RootPath .docs
# Output: PSCustomObject array of violations (empty = clean). Exits 1 if violations found.
# Must be called from workspace root.

[CmdletBinding()]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$RootPath = '.docs'
)

$ErrorActionPreference = 'Stop'
$absRoot    = Resolve-Path -LiteralPath $RootPath -ErrorAction Stop
$fileAllow  = @('INDEX.md', 'README.md')
$fileRx     = '^[a-z0-9]+(-[a-z0-9]+)*\.(md|txt|json|yml|yaml)$'
$folderRx   = '^[a-z0-9]+$'
$datePfxRx  = '^\d{4,8}-'
# Intentional exemptions: asset-name review subdirs mirror asset identifiers (dots/hyphens load-bearing)
# and dotted root paths (.docs/.github/.archive) are structural, not naming policy violations.
$exemptFolderRx = '(\\|/)((customization|skill)\\reviews|reference\\\.)'
# .ref.md double-extension files under reference/ are mirror artifacts - intentional by design
$refMirrorRx    = '\.ref\.md$'
$violations = [System.Collections.Generic.List[PSCustomObject]]::new()

function Add-Violation {
    param($Path, $Kind, $Violation, $Suggested)
    $violations.Add([PSCustomObject]@{ Path = $Path; Kind = $Kind; Violation = $Violation; SuggestedName = $Suggested })
}

# Folder checks
Get-ChildItem -LiteralPath $absRoot -Recurse -Directory | Sort-Object FullName | ForEach-Object {
    $rel  = $_.FullName.Substring($absRoot.Path.Length).TrimStart('\','/')
    $name = $_.Name
    if ($_.FullName -match ($exemptFolderRx -replace '/', '\\')) { return }  # intentional pattern
    if ($name -match $datePfxRx) {
        Add-Violation $rel Folder "Date prefix in folder name" ($name -replace $datePfxRx, '')
    } elseif ($name -notmatch $folderRx) {
        $safe = ($name.ToLowerInvariant() -replace '[^a-z0-9]', '')
        Add-Violation $rel Folder "Folder not single lowercase word (kebab or dots not allowed)" $safe
    }
}

# File checks
Get-ChildItem -LiteralPath $absRoot -Recurse -File | Sort-Object FullName | ForEach-Object {
    $rel  = $_.FullName.Substring($absRoot.Path.Length).TrimStart('\','/')
    $name = $_.Name
    if ($name -in $fileAllow)    { return }
    if ($rel  -match $refMirrorRx) { return }  # .ref.md mirror artifacts are intentional
    if ($name -match $datePfxRx) {
        Add-Violation $rel File "Date prefix in filename" ($name -replace $datePfxRx, '')
    } elseif ($name -notmatch $fileRx) {
        $safe = ($name.ToLowerInvariant() -replace '[^a-z0-9.\-]', '-' -replace '-+', '-').TrimStart('-').TrimEnd('-')
        Add-Violation $rel File "Filename not kebab-case or has invalid characters" $safe
    }
}

if ($violations.Count -gt 0) {
    Write-Warning "Naming conformance: $($violations.Count) violation(s) found."
    $violations
    exit 1
}

Write-Verbose "Naming conformance: clean."
$violations
exit 0
