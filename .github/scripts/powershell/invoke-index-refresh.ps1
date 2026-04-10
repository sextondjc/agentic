# invoke-index-refresh.ps1: Generate or refresh INDEX.md files throughout a document corpus.
# Usage: ./invoke-index-refresh.ps1 -RootPath .docs [-DryRun]
# Output: Summary object with FoldersIndexed and DocumentsIndexed counts.
# Must be called from workspace root.

[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$RootPath = '.docs',

    [Parameter()]
    [switch]$DryRun
)

$ErrorActionPreference = 'Stop'
$absRoot  = Resolve-Path -LiteralPath $RootPath -ErrorAction Stop
$allDirs  = @(Get-Item -LiteralPath $absRoot) + @(Get-ChildItem -LiteralPath $absRoot -Recurse -Directory |
    Sort-Object { $_.FullName.Split([IO.Path]::DirectorySeparatorChar).Count } -Descending)

$foldersIndexed = 0; $docsIndexed = 0

foreach ($dir in $allDirs) {
    $mdFiles  = Get-ChildItem -LiteralPath $dir.FullName -File -Filter '*.md' | Where-Object { $_.Name -ne 'INDEX.md' }
    $subDirs  = Get-ChildItem -LiteralPath $dir.FullName -Directory |
        Where-Object { (Get-ChildItem -LiteralPath $_.FullName -Recurse -File -Filter '*.md' -ErrorAction SilentlyContinue).Count -gt 0 }
    if ($mdFiles.Count -eq 0 -and $subDirs.Count -eq 0) { continue }

    $folderName = if ($dir.FullName -eq $absRoot.Path) { Split-Path $RootPath -Leaf } else { $dir.Name }
    $lines = @(
        "# Index: $folderName",
        '',
        '> Corpus index. Do not edit manually — refresh with invoke-index-refresh.ps1.',
        '',
        '## Subfolders',
        '',
        '| Folder | Description |',
        '|---|---|'
    )
    $lines += if ($subDirs) {
        $subDirs | Sort-Object Name | ForEach-Object { "| [$($_.Name)/](./$($_.Name)/INDEX.md) | Subfolder index. |" }
    } else { '| (none) | - |' }
    $lines += '', '## Documents', '', '| File | Title | Category | Summary |', '|---|---|---|---|'
    if ($mdFiles) {
        foreach ($f in ($mdFiles | Sort-Object Name)) {
            $raw     = Get-Content -LiteralPath $f.FullName -Raw
            $h1      = [regex]::Match($raw, '(?m)^#\s+(.+)$')
            $title   = ($h1.Success ? $h1.Groups[1].Value.Trim() : [IO.Path]::GetFileNameWithoutExtension($f.Name)).Replace('|','/')
            $full    = $f.FullName.Replace('\','/').ToLowerInvariant()
            $cat     = if($full-match'/plans/'){'plan'}elseif($full-match'/research/'){'research'}elseif($full-match'/reference/'){'reference'}elseif($full-match'/changes/'){'change'}elseif($full-match'/adr/'){'adr'}elseif($full-match'/specs/'){'spec'}else{'other'}
            $paras   = ($raw -split "`r?`n`r?`n") | Where-Object { $_ -and ($_ -notmatch '^\s*#') }
            $summary = if ($paras) { $s=($paras[0]-replace'\s+',' ').Trim(); if($s.Length-gt120){$s=$s.Substring(0,120);$s=($s-replace'\[[^\]]*\]\([^\)]*$','').TrimEnd()+'...'};$s } else { '' }
            $lines  += "| [$($f.Name)](./$($f.Name)) | $title | $cat | $($summary.Replace('|','/')) |"
            $docsIndexed++
        }
    } else { $lines += '| (none) | - | - | - |' }

    $indexPath = Join-Path $dir.FullName 'INDEX.md'
    if (!$DryRun -and $PSCmdlet.ShouldProcess($indexPath, 'Write INDEX.md')) {
        Set-Content -LiteralPath $indexPath -Value ($lines -join "`r`n") -Encoding UTF8
    }
    $foldersIndexed++
}

[PSCustomObject]@{ FoldersIndexed = $foldersIndexed; DocumentsIndexed = $docsIndexed; DryRun = $DryRun.IsPresent }
