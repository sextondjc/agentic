# Test-FrontmatterValidity.ps1: Validate instruction/agent/prompt frontmatter structure and values.
# Usage: ./test-frontmatter-validity.ps1 -AssetType 'instructions'|'agents'|'prompts'
# Output: Validation errors (exit 1) or success message (exit 0).

param(
  [ValidateSet('instructions','agents','prompts')][string]$AssetType,
  [switch]$ShowContract
)

if (-not $PSBoundParameters.ContainsKey('AssetType') -or [string]::IsNullOrWhiteSpace($AssetType)) {
  Write-Error "Missing required parameter: -AssetType. Allowed values: instructions, agents, prompts."
  exit 1
}

$filePath = ".github/$AssetType"
if (-not (Test-Path $filePath)) {
  Write-Error "Asset directory not found: $filePath"
  exit 1
}

function Get-FrontmatterValue {
  param([string[]]$Lines, [string]$Key)
  $line = $Lines | Where-Object { $_ -match "^$Key\s*:\s*" } | Select-Object -First 1
  if (-not $line) { return $null }
  ($line -replace "^$Key\s*:\s*", '').Trim().Trim("'").Trim('"')
}

function Get-FrontmatterContract {
  param([string]$Type)

  switch ($Type) {
    'instructions' {
      # Source: VS Code Custom Instructions docs (optional: name, description, applyTo)
      return [pscustomobject]@{
        RequiredKeys = @('name', 'description', 'applyTo')
        AllowedKeys = @('name', 'description', 'applyTo')
      }
    }
    'agents' {
      # Source: VS Code Custom Agents docs + workspace source-catalog
      return [pscustomobject]@{
        RequiredKeys = @('name', 'description')
        AllowedKeys = @(
          'name',
          'description',
          'tools',
          'agents',
          'model',
          'user-invocable',
          'disable-model-invocation',
          'handoffs',
          'hooks',
          'target',
          'mcp-servers'
        )
      }
    }
    'prompts' {
      # Source: VS Code Prompt Files docs (all frontmatter fields are optional)
      return [pscustomobject]@{
        RequiredKeys = @('name', 'description')
        AllowedKeys = @('name', 'description', 'argument-hint', 'agent', 'model', 'tools')
      }
    }
    default {
      throw "Unsupported asset type '$Type'"
    }
  }
}

$frontmatterContract = Get-FrontmatterContract -Type $AssetType
if ($ShowContract) {
  [pscustomobject]@{
    AssetType = $AssetType
    RequiredKeys = $frontmatterContract.RequiredKeys
    OptionalKeys = @($frontmatterContract.AllowedKeys | Where-Object { $_ -notin $frontmatterContract.RequiredKeys })
    AllowedKeys = $frontmatterContract.AllowedKeys
  } | ConvertTo-Json -Depth 4
  exit 0
}

$ext = @{'instructions'='*.instructions.md'; 'agents'='*.agent.md'; 'prompts'='*.prompt.md'}[$AssetType]
$files = Get-ChildItem $filePath/$ext
$bad = @()

foreach ($f in $files) {
  $lines = Get-Content $f.FullName
  $first = [array]::IndexOf($lines, '---')
  $second = [array]::IndexOf($lines, '---', $first + 1)

  if ($first -ne 0 -or $second -lt 1) {
    $bad += "$($f.Name): missing valid frontmatter delimiters"
    continue
  }

  $fm = $lines[($first + 1)..($second - 1)]

  # Semantic: required keys must be present and non-empty
  foreach ($key in $frontmatterContract.RequiredKeys) {
    $val = Get-FrontmatterValue -Lines $fm -Key $key
    if ([string]::IsNullOrWhiteSpace($val)) {
      $bad += "$($f.Name): '$key' is missing or has an empty value"
    }
  }

  if ($AssetType -eq 'instructions') {
    $applyTo = Get-FrontmatterValue -Lines $fm -Key 'applyTo'
    if ($applyTo -eq '**' -or $applyTo -eq '**/*') {
      # Warn on global catch-all only - not an automatic failure, but flagged for review
      Write-Warning "$($f.Name): 'applyTo' is set to global '$applyTo' - confirm this is intentional"
    }
  }

  # Detect unknown top-level keys (advisory - keys beyond the required set are flagged)
  $allowedKeys = $frontmatterContract.AllowedKeys
  foreach ($line in ($fm | Where-Object { $_ -match '^\w[\w-]*\s*:' })) {
    $key = ($line -split ':')[0].Trim()
    if ($key -notin $allowedKeys) {
      $bad += "$($f.Name): unknown frontmatter key '$key' (allowed: $($allowedKeys -join ', '))"
    }
  }
}

if ($bad.Count -eq 0) {
  Write-Output "All $AssetType files passed frontmatter validation."
} else {
  $bad
  exit 1
}
