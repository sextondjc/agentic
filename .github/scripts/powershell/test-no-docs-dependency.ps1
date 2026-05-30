# test-no-docs-dependency.ps1: Detect forbidden documentation-root references under .github.
# Usage: ./.github/scripts/powershell/test-no-docs-dependency.ps1 [-RootPath <path>] [-ScanPath <path>] [-OutputJsonPath <path>] [-FailOnMatch <$true|$false>] [-IncludeMarkdown] [-IncludePowerShell]

[CmdletBinding()]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$RootPath = '.',

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$ScanPath = '.github',

    [Parameter()]
    [string]$OutputJsonPath,

    [Parameter()]
    [bool]$FailOnMatch = $true
,

    [Parameter()]
    [switch]$IncludeMarkdown
,

    [Parameter()]
    [switch]$IncludePowerShell
,

    [Parameter()]
    [string[]]$ExcludePathPatterns = @('*/.artifacts/*')
)

$ErrorActionPreference = 'Stop'

$resolvedRoot = (Resolve-Path -LiteralPath $RootPath).Path
$resolvedScan = Join-Path $resolvedRoot $ScanPath
if (-not (Test-Path -LiteralPath $resolvedScan)) {
    Write-Error "Scan path not found: $resolvedScan"
    exit 1
}

$dot = [char]46
$needle = "{0}{1}" -f $dot, 'docs'
# Match the forbidden token only when it ends at a non-identifier boundary.
$needlePattern = "(?i)$([regex]::Escape($needle))(?=$|[^A-Za-z0-9_])"

$includeExtensions = @('.yml', '.yaml', '.json', '.txt')
if ($IncludeMarkdown) {
    $includeExtensions += '.md'
}
if ($IncludePowerShell) {
    $includeExtensions += @('.ps1', '.psm1')
}
$violations = [System.Collections.Generic.List[PSCustomObject]]::new()

$files = Get-ChildItem -LiteralPath $resolvedScan -Recurse -File | Where-Object {
    $_.Extension -in $includeExtensions
}

if ($ExcludePathPatterns.Count -gt 0) {
    $files = @($files | Where-Object {
        $relative = [System.IO.Path]::GetRelativePath($resolvedRoot, $_.FullName) -replace '[\\/]', '/'
        foreach ($pattern in $ExcludePathPatterns) {
            if ($relative -like $pattern) {
                return $false
            }
        }
        return $true
    })
}

foreach ($file in $files) {
    $lineNumber = 0
    foreach ($line in Get-Content -LiteralPath $file.FullName) {
        $lineNumber++
        if ($line -match $needlePattern) {
            $violations.Add([PSCustomObject]@{
                File = [System.IO.Path]::GetRelativePath($resolvedRoot, $file.FullName).Replace('\\', '/')
                Line = $lineNumber
                MatchText = $line.Trim()
            })
        }
    }
}

$result = [PSCustomObject]@{
    ScanPath = $ScanPath
    ForbiddenToken = $needle
    FilesScanned = $files.Count
    ViolationCount = $violations.Count
    Violations = @($violations)
}

if (-not [string]::IsNullOrWhiteSpace($OutputJsonPath)) {
    $outputFullPath = Join-Path $resolvedRoot $OutputJsonPath
    New-Item -ItemType Directory -Path (Split-Path -Path $outputFullPath -Parent) -Force | Out-Null
    $result | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath $outputFullPath -Encoding UTF8
}

$result
if ($FailOnMatch -and $violations.Count -gt 0) {
    Write-Warning "Forbidden token detected under ${ScanPath}: $($violations.Count) violation(s)."
    exit 1
}

exit 0
