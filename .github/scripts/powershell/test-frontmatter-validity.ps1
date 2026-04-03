# Test-FrontmatterValidity.ps1: Validate instruction/agent frontmatter structure
# Usage: ./test-frontmatter-validity.ps1 -AssetType 'instructions'|'agents'|'prompts'
# Output: Array of validation errors or success message

param(
  [Parameter(Mandatory=$true)][ValidateSet('instructions','agents','prompts')][string]$AssetType
)

$filePath = ".github/$AssetType"
if (-not (Test-Path $filePath)) {
  Write-Error "Asset directory not found: $filePath"
  exit 1
}

$ext = @{'instructions'='*.instructions.md'; 'agents'='*.agent.md'; 'prompts'='*.prompt.md'}[$AssetType]
$files = Get-ChildItem $filePath/$ext
$bad = @()
$requiredKeys = @('name:', 'description:')
if ($AssetType -ne 'prompts') { $requiredKeys += 'applyTo:' }

foreach ($f in $files) {
  $lines = Get-Content $f.FullName
  $first = [array]::IndexOf($lines, '---')
  $second = [array]::IndexOf($lines, '---', $first + 1)
  
  if ($first -ne 0 -or $second -lt 1) {
    $bad += "$($f.Name): missing valid frontmatter delimiters"
    continue
  }
  
  $fm = $lines[($first + 1)..($second - 1)]
  foreach ($key in $requiredKeys) {
    if (-not ($fm | Where-Object { $_ -like "$key*" })) {
      $bad += "$($f.Name): missing $key"
    }
  }
}

if ($bad.Count -eq 0) {
  Write-Output "All $AssetType files have required frontmatter keys and delimiters."
} else {
  $bad
  exit 1
}
