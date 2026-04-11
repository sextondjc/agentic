# test-responsibility-overlap.ps1: Detect responsibility overlap signals across agents, instructions, prompts, and skills.
# Usage: ./.github/scripts/powershell/test-responsibility-overlap.ps1 [-RootPath <path>] [-SimilarityThreshold <double>] [-MinimumSharedTokens <int>] [-MaxAllowedDuplicatePairs <int>] [-OutputPath <path>]
# Output: PSCustomObject summary with overlap pairs. Exits 1 when DuplicatePairCount exceeds MaxAllowedDuplicatePairs.

[CmdletBinding()]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$RootPath = (Get-Location).Path,

    [Parameter()]
    [ValidateRange(0.50, 1.00)]
    [double]$SimilarityThreshold = 0.82,

    [Parameter()]
    [ValidateRange(2, 30)]
    [int]$MinimumSharedTokens = 6,

    [Parameter()]
    [ValidateRange(0, 500)]
    [int]$MaxAllowedDuplicatePairs = 0,

    [Parameter()]
    [string]$OutputPath
)

$ErrorActionPreference = 'Stop'

function Normalize-Text {
    param([string]$Text)
    if ([string]::IsNullOrWhiteSpace($Text)) { return '' }
    $value = $Text.ToLowerInvariant()
    $value = $value -replace '\[[^\]]+\]\([^\)]+\)', ' '
    $value = $value -replace '`', ' '
    $value = $value -replace '[^a-z0-9\s-]', ' '
    $value = $value -replace '\s+', ' '
    return $value.Trim()
}

function Get-DescriptionFromFrontmatter {
    param([string]$Raw)
    if ($Raw -notmatch '(?s)^---\s*\r?\n(.*?)\r?\n---') { return '' }
    $frontmatter = $Matches[1]
    foreach ($line in ($frontmatter -split '\r?\n')) {
        if ($line -match '^description\s*:\s*(.+)$') {
            $desc = $Matches[1].Trim()
            if (($desc.StartsWith("'")) -and ($desc.EndsWith("'")) -and $desc.Length -ge 2) {
                return $desc.Substring(1, $desc.Length - 2)
            }
            if (($desc.StartsWith('"')) -and ($desc.EndsWith('"')) -and $desc.Length -ge 2) {
                return $desc.Substring(1, $desc.Length - 2)
            }
            return $desc
        }
    }
    return ''
}

function Get-SectionBody {
    param(
        [string]$Raw,
        [string]$Heading
    )
    $pattern = "(?ms)^##\s+$([Regex]::Escape($Heading))\s*$\r?\n(.*?)(?=^##\s+|\z)"
    $match = [Regex]::Match($Raw, $pattern)
    if (-not $match.Success) { return '' }
    return $match.Groups[1].Value.Trim()
}

function Get-PurposeText {
    param(
        [string]$Raw,
        [string]$AssetType
    )
    $parts = [System.Collections.Generic.List[string]]::new()

    $description = Get-DescriptionFromFrontmatter -Raw $Raw
    if ($description) { $parts.Add($description) }

    if ($AssetType -eq 'skills') {
        $specialization = Get-SectionBody -Raw $Raw -Heading 'Specialization'
        if ($specialization) { $parts.Add($specialization) }
    }
    elseif ($AssetType -eq 'agents') {
        $specialization = Get-SectionBody -Raw $Raw -Heading 'Specialization'
        if ($specialization) { $parts.Add($specialization) }
    }
    elseif ($AssetType -eq 'instructions') {
        $body = Get-SectionBody -Raw $Raw -Heading 'Core Principles'
        if ($body) { $parts.Add($body) }
    }
    elseif ($AssetType -eq 'prompts') {
        $goal = Get-SectionBody -Raw $Raw -Heading 'Goal'
        if ($goal) { $parts.Add($goal) }
    }

    if ($parts.Count -eq 0) {
        $fallback = ($Raw -split '\r?\n' | Select-Object -First 40) -join ' '
        $parts.Add($fallback)
    }

    return (Normalize-Text -Text (($parts -join ' ')))
}

function Get-TokenSet {
    param([string]$Text)
    $stopWords = @{
        'the' = $true; 'and' = $true; 'for' = $true; 'with' = $true; 'from' = $true; 'that' = $true;
        'this' = $true; 'when' = $true; 'where' = $true; 'into' = $true; 'only' = $true; 'must' = $true;
        'should' = $true; 'review' = $true; 'quality' = $true; 'artifact' = $true; 'artifacts' = $true;
        'agent' = $true; 'agents' = $true; 'skill' = $true; 'skills' = $true; 'prompt' = $true;
        'prompts' = $true; 'instruction' = $true; 'instructions' = $true; 'file' = $true; 'files' = $true;
        'workflow' = $true; 'workflows' = $true; 'output' = $true; 'outputs' = $true; 'guidance' = $true;
        'customization' = $true; 'customizations' = $true; 'using' = $true; 'perform' = $true; 'against' = $true;
        'produce' = $true; 'producing' = $true; 'across' = $true; 'active' = $true; 'deep' = $true
    }

    $tokens = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::Ordinal)
    foreach ($token in ($Text -split '\s+')) {
        if ([string]::IsNullOrWhiteSpace($token)) { continue }
        if ($token.Length -lt 4) { continue }
        if ($stopWords.ContainsKey($token)) { continue }
        [void]$tokens.Add($token)
    }
    return $tokens
}

function Get-Jaccard {
    param(
        [System.Collections.Generic.HashSet[string]]$A,
        [System.Collections.Generic.HashSet[string]]$B
    )

    $intersection = [System.Collections.Generic.HashSet[string]]::new($A, [System.StringComparer]::Ordinal)
    $intersection.IntersectWith($B)

    $union = [System.Collections.Generic.HashSet[string]]::new($A, [System.StringComparer]::Ordinal)
    $union.UnionWith($B)

    if ($union.Count -eq 0) {
        return [pscustomobject]@{ Score = 0.0; SharedTokens = @() }
    }

    $shared = @($intersection | Sort-Object)
    $score = [Math]::Round(($intersection.Count / $union.Count), 4)
    return [pscustomobject]@{ Score = $score; SharedTokens = $shared }
}

$resolvedRoot = Resolve-Path -LiteralPath $RootPath -ErrorAction Stop
Push-Location $resolvedRoot
try {
    $assets = [System.Collections.Generic.List[PSCustomObject]]::new()

    $assetSpecs = @(
        @{ Type = 'agents'; Path = '.github/agents'; Filter = '*.agent.md' },
        @{ Type = 'instructions'; Path = '.github/instructions'; Filter = '*.instructions.md' },
        @{ Type = 'prompts'; Path = '.github/prompts'; Filter = '*.prompt.md' },
        @{ Type = 'skills'; Path = '.github/skills'; Filter = 'SKILL.md'; Recurse = $true }
    )

    foreach ($spec in $assetSpecs) {
        $directoryPath = Join-Path $resolvedRoot $spec.Path
        if (-not (Test-Path -LiteralPath $directoryPath)) { continue }

        $files = if ($spec.ContainsKey('Recurse') -and $spec.Recurse) {
            Get-ChildItem -LiteralPath $directoryPath -Filter $spec.Filter -File -Recurse
        }
        else {
            Get-ChildItem -LiteralPath $directoryPath -Filter $spec.Filter -File
        }

        foreach ($file in $files) {
            $raw = Get-Content -LiteralPath $file.FullName -Raw
            $purposeText = Get-PurposeText -Raw $raw -AssetType $spec.Type
            $tokenSet = Get-TokenSet -Text $purposeText
            if ($tokenSet.Count -eq 0) { continue }

            $relativePath = ($file.FullName.Substring($resolvedRoot.Path.Length) -replace '^[\\/]+', '') -replace '\\', '/'
            $assetName = if ($spec.Type -eq 'skills') {
                Split-Path -Leaf (Split-Path -Parent $file.FullName)
            }
            elseif ($spec.Type -eq 'agents') {
                $file.Name -replace '\.agent\.md$', ''
            }
            elseif ($spec.Type -eq 'instructions') {
                $file.Name -replace '\.instructions\.md$', ''
            }
            else {
                $file.Name -replace '\.prompt\.md$', ''
            }

            $assets.Add([PSCustomObject]@{
                AssetType = $spec.Type
                AssetName = $assetName
                Path = $relativePath
                PurposeText = $purposeText
                Description = (Get-DescriptionFromFrontmatter -Raw $raw)
                Tokens = $tokenSet
            })
        }
    }

    if ($assets.Count -lt 2) {
        Write-Error 'Not enough assets discovered to evaluate overlap.'
        exit 1
    }

    $pairs = [System.Collections.Generic.List[PSCustomObject]]::new()
    for ($i = 0; $i -lt $assets.Count; $i++) {
        for ($j = $i + 1; $j -lt $assets.Count; $j++) {
            $a = $assets[$i]
            $b = $assets[$j]

            $jaccard = Get-Jaccard -A $a.Tokens -B $b.Tokens
            $sameDescription = $false
            if ($a.Description -and $b.Description) {
                $sameDescription = (Normalize-Text -Text $a.Description) -eq (Normalize-Text -Text $b.Description)
            }

            $sharedTokenCount = $jaccard.SharedTokens.Count
            $isOverlap = $sameDescription -or (($jaccard.Score -ge $SimilarityThreshold) -and ($sharedTokenCount -ge $MinimumSharedTokens))
            if (-not $isOverlap) { continue }

            $pairs.Add([PSCustomObject]@{
                Signal = if ($sameDescription) { 'ExactPurposeMatch' } else { 'HighTokenSimilarity' }
                SimilarityScore = $jaccard.Score
                SharedTokenCount = $sharedTokenCount
                SharedTokens = ($jaccard.SharedTokens -join ', ')
                AssetAType = $a.AssetType
                AssetAName = $a.AssetName
                AssetAPath = $a.Path
                AssetBType = $b.AssetType
                AssetBName = $b.AssetName
                AssetBPath = $b.Path
            })
        }
    }

    $sortedPairs = @($pairs | Sort-Object @{ Expression = 'SimilarityScore'; Descending = $true }, AssetAType, AssetAName, AssetBType, AssetBName)
    $countsByTypePair = @{}
    foreach ($pair in $sortedPairs) {
        $types = @($pair.AssetAType, $pair.AssetBType) | Sort-Object
        $key = "$($types[0])-$($types[1])"
        if (-not $countsByTypePair.ContainsKey($key)) { $countsByTypePair[$key] = 0 }
        $countsByTypePair[$key]++
    }

    $result = [PSCustomObject]@{
        RootPath = $resolvedRoot.Path
        SimilarityThreshold = $SimilarityThreshold
        MinimumSharedTokens = $MinimumSharedTokens
        MaxAllowedDuplicatePairs = $MaxAllowedDuplicatePairs
        AssetCounts = [PSCustomObject]@{
            Agents = (@($assets | Where-Object { $_.AssetType -eq 'agents' })).Count
            Instructions = (@($assets | Where-Object { $_.AssetType -eq 'instructions' })).Count
            Prompts = (@($assets | Where-Object { $_.AssetType -eq 'prompts' })).Count
            Skills = (@($assets | Where-Object { $_.AssetType -eq 'skills' })).Count
            Total = $assets.Count
        }
        DuplicatePairCount = $sortedPairs.Count
        DuplicatePairThresholdBreached = ($sortedPairs.Count -gt $MaxAllowedDuplicatePairs)
        TypePairCounts = $countsByTypePair
        OverlapPairs = $sortedPairs
    }

    if ($OutputPath) {
        $outputFile = if ([System.IO.Path]::IsPathRooted($OutputPath)) { $OutputPath } else { Join-Path $resolvedRoot $OutputPath }
        $outputDir = Split-Path -Parent $outputFile
        if ($outputDir -and -not (Test-Path -LiteralPath $outputDir)) {
            New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
        }
        $result | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $outputFile
    }

    $result
    if ($sortedPairs.Count -gt $MaxAllowedDuplicatePairs) {
        Write-Warning "Responsibility overlap failed: $($sortedPairs.Count) duplicate pair(s) exceeds threshold $MaxAllowedDuplicatePairs."
        exit 1
    }

    Write-Output "Responsibility overlap passed: $($sortedPairs.Count) duplicate pair(s) within threshold $MaxAllowedDuplicatePairs."
    exit 0
}
finally {
    Pop-Location
}
