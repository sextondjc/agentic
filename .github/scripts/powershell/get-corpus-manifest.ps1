# get-corpus-manifest.ps1: Build a structured manifest of all markdown files in a document corpus.
# Usage: ./get-corpus-manifest.ps1 -RootPath .docs
# Output: PSCustomObject array with Path, Title, Category, WordCount, Hash fields.
# Must be called from workspace root.

[CmdletBinding()]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$RootPath = '.docs',

    [Parameter()]
    [switch]$IncludeIndex
)

$ErrorActionPreference = 'Stop'
$absRoot = Resolve-Path -LiteralPath $RootPath -ErrorAction Stop

$files = Get-ChildItem -LiteralPath $absRoot -Recurse -File -Filter '*.md' |
    Where-Object { $IncludeIndex -or $_.Name -ne 'INDEX.md' }

foreach ($file in $files) {
    $rel     = [IO.Path]::GetRelativePath((Get-Location).Path, $file.FullName).Replace('\', '/')
    $raw     = Get-Content -LiteralPath $file.FullName -Raw
    $h1      = [regex]::Match($raw, '(?m)^#\s+(.+)$')
    $title   = if ($h1.Success) { $h1.Groups[1].Value.Trim() } else { [IO.Path]::GetFileNameWithoutExtension($file.Name) }
    $hash    = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash
    $wc      = if ([string]::IsNullOrWhiteSpace($raw)) { 0 } else { (($raw -split '\s+') | Where-Object { $_ }).Count }
    $full    = $file.FullName.Replace('\', '/').ToLowerInvariant()
    $cat     = switch -Regex ($full) {
        '/plans/'     { 'plan';      break }
        '/research/'  { 'research';  break }
        '/reference/' { 'reference'; break }
        '/changes/'   { 'change';    break }
        '/adr/'       { 'adr';       break }
        '/specs/'     { 'spec';      break }
        default       { 'other' }
    }

    [PSCustomObject]@{
        Path      = $rel
        Title     = $title
        Category  = $cat
        WordCount = $wc
        Hash      = $hash
    }
}
