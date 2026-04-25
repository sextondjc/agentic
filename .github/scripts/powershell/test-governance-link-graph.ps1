param(
  [string]$RootPath = '.',
  [string[]]$ScanRoots = @('__DOCS_ROOT__', '.github')
)

$ErrorActionPreference = 'Stop'

function Get-MarkdownLinks {
  param([string]$Text)

  # Match markdown links: [text](target)
  [regex]::Matches($Text, '\[[^\]]+\]\(([^)]+)\)') |
    ForEach-Object { $_.Groups[1].Value }
}

function Resolve-TargetPath {
  param(
    [string]$SourceFile,
    [string]$Target
  )

  if ([string]::IsNullOrWhiteSpace($Target)) { return $null }
  if ($Target.StartsWith('http://') -or $Target.StartsWith('https://') -or $Target.StartsWith('mailto:')) { return $null }
  if ($Target.StartsWith('#')) {
    return [pscustomobject]@{ Path = $SourceFile; Anchor = $Target.Substring(1) }
  }

  $pathPart = $Target
  $anchor = $null
  if ($Target -match '^(?<p>[^#]+)#(?<a>.+)$') {
    $pathPart = $Matches['p']
    $anchor = $Matches['a']
  }

  $decodedPath = [Uri]::UnescapeDataString($pathPart)
  $baseDir = Split-Path -Parent $SourceFile
  $resolved = Join-Path $baseDir $decodedPath
  $normalized = [IO.Path]::GetFullPath($resolved)

  [pscustomobject]@{ Path = $normalized; Anchor = $anchor }
}

function Test-Anchor {
  param(
    [string]$FilePath,
    [string]$Anchor
  )

  if ([string]::IsNullOrWhiteSpace($Anchor)) { return $true }
  if (-not (Test-Path $FilePath)) { return $false }

  $content = Get-Content $FilePath -Raw
  $headings = [regex]::Matches($content, '(?m)^#{1,6}\s+(.+)$') |
    ForEach-Object {
      $h = $_.Groups[1].Value.Trim().ToLowerInvariant()
      $h = ($h -replace '[^a-z0-9\s-]', '')
      $h = ($h -replace '\s+', '-')
      $h
    }

  $anchorNorm = $Anchor.Trim().ToLowerInvariant()
  $anchorNorm = ($anchorNorm -replace '%20', '-')
  $anchorNorm = ($anchorNorm -replace '\s+', '-')

  return ($headings -contains $anchorNorm)
}

function Test-TargetExists {
  param(
    [string]$Path
  )

  try {
    return (Test-Path -LiteralPath $Path)
  }
  catch {
    return $false
  }
}

$workspaceRoot = [IO.Path]::GetFullPath($RootPath)
$mdFiles = foreach ($scanRoot in $ScanRoots) {
  $fullScanRoot = Join-Path $workspaceRoot $scanRoot
  if (Test-Path $fullScanRoot) {
    Get-ChildItem $fullScanRoot -Recurse -File -Filter '*.md'
  }
}

$broken = New-Object System.Collections.Generic.List[object]
$checkedLinks = 0

foreach ($file in $mdFiles) {
  $text = Get-Content $file.FullName -Raw
  $links = Get-MarkdownLinks -Text $text

  foreach ($link in $links) {
    $resolved = Resolve-TargetPath -SourceFile $file.FullName -Target $link
    if ($null -eq $resolved) { continue }

    $checkedLinks++
    if (-not (Test-TargetExists -Path $resolved.Path)) {
      $broken.Add([pscustomobject]@{
          Source = $file.FullName
          Target = $link
          Reason = 'Missing or malformed target file path'
        })
      continue
    }

    if (-not (Test-Anchor -FilePath $resolved.Path -Anchor $resolved.Anchor)) {
      $broken.Add([pscustomobject]@{
          Source = $file.FullName
          Target = $link
          Reason = 'Missing target anchor'
        })
    }
  }
}

$result = [pscustomobject]@{
  CheckedFiles = @($mdFiles).Count
  CheckedLinks = $checkedLinks
  BrokenLinks = $broken.Count
  Issues = $broken
}

if ($broken.Count -gt 0) {
  $result | ConvertTo-Json -Depth 6
  exit 1
}

Write-Output "Governance link graph validation passed. Files: $(@($mdFiles).Count); Links: $checkedLinks"
exit 0

