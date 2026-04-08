# invoke-governance-health-overview.ps1: Run governance health evidence collection in one non-interactive pass.
# Usage: ./.github/scripts/powershell/invoke-governance-health-overview.ps1 -RootPath c:/Projects/agentic -ReviewDate 2026-04-08
# Output: JSON summary with core checks, skill audit artifact path, and customization metrics.

param(
    [Parameter(Mandatory = $false)]
    [string]$RootPath = 'c:/Projects/agentic',

    [Parameter(Mandatory = $false)]
    [string]$ReviewDate = (Get-Date -Format 'yyyy-MM-dd')
)

$ErrorActionPreference = 'Stop'

function Invoke-Check {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Name,

        [Parameter(Mandatory = $true)]
        [scriptblock]$Command
    )

    $output = ''
    $exitCode = 0
    try {
        $output = (& $Command 2>&1 | Out-String).Trim()
        $exitCode = $LASTEXITCODE
        if ($null -eq $exitCode) {
            $exitCode = 0
        }
    }
    catch {
        $output = $_ | Out-String
        $exitCode = 1
    }

    [pscustomobject]@{
        Check = $Name
        ExitCode = $exitCode
        Passed = ($exitCode -eq 0)
        Output = $output
    }
}

Push-Location $RootPath
try {
    $checks = @(
        @{ Name = 'catalog-agents'; Command = { ./.github/scripts/powershell/test-catalog-integrity.ps1 -AssetType agents } },
        @{ Name = 'catalog-prompts'; Command = { ./.github/scripts/powershell/test-catalog-integrity.ps1 -AssetType prompts } },
        @{ Name = 'catalog-instructions'; Command = { ./.github/scripts/powershell/test-catalog-integrity.ps1 -AssetType instructions } },
        @{ Name = 'frontmatter-agents'; Command = { ./.github/scripts/powershell/test-frontmatter-validity.ps1 -AssetType agents } },
        @{ Name = 'frontmatter-prompts'; Command = { ./.github/scripts/powershell/test-frontmatter-validity.ps1 -AssetType prompts } },
        @{ Name = 'frontmatter-instructions'; Command = { ./.github/scripts/powershell/test-frontmatter-validity.ps1 -AssetType instructions } },
        @{ Name = 'hub-sync'; Command = { ./.github/scripts/powershell/test-hub-file-sync.ps1 } },
        @{ Name = 'link-graph'; Command = { ./.github/scripts/powershell/test-governance-link-graph.ps1 } }
    )

    $coreResults = foreach ($check in $checks) {
        Invoke-Check -Name $check.Name -Command $check.Command
    }

    $skillAuditScript = './.github/skills/skill-review/references/scripts/generate-full-skill-audit.ps1'
    & $skillAuditScript -RootPath $RootPath -ReviewDate $ReviewDate | Out-Null
    $skillReviewDate = $ReviewDate -replace '-', ''
    $datedSkillAggregatePath = ".docs/changes/skill-reviews/$skillReviewDate-full-skill-review-grid.md"
    $skillAggregatePath = '.docs/changes/skill-reviews/full-skill-review-grid.md'

    if (Test-Path $datedSkillAggregatePath) {
        $lines = Get-Content -LiteralPath $datedSkillAggregatePath
        $converted = foreach ($line in $lines) {
            if ($line -match '^\| (?<skill>[^|]+) \| (?<outcome>[^|]+) \| (?<must>[^|]+) \| (?<should>[^|]+) \| (?<conflict>[^|]+) \| (?<report>\.docs/changes/skill-reviews/[^|]+) \|$') {
                $report = $Matches.report.Trim()
                $relativeReport = './' + ($report -replace '^\.docs/changes/skill-reviews/', '')
                "| $($Matches.skill.Trim()) | $($Matches.outcome.Trim()) | $($Matches.must.Trim()) | $($Matches.should.Trim()) | $($Matches.conflict.Trim()) | [review.md]($relativeReport) |"
            }
            else {
                $line
            }
        }

        Set-Content -LiteralPath $skillAggregatePath -Value ($converted -join "`r`n") -Encoding UTF8
        Remove-Item -LiteralPath $datedSkillAggregatePath -Force
    }

    $agentFiles = @(Get-ChildItem '.github/agents' -File -Filter '*.agent.md')
    $instructionFiles = @(Get-ChildItem '.github/instructions' -File -Filter '*.instructions.md')

    $missingSpecialization = @()
    foreach ($file in $agentFiles) {
        $raw = Get-Content -LiteralPath $file.FullName -Raw
        if ($raw -notmatch '(?m)^##\s+Specialization\s*$') {
            $missingSpecialization += $file.Name
        }
    }

    $missingApplyTo = @()
    foreach ($file in $instructionFiles) {
        $raw = Get-Content -LiteralPath $file.FullName -Raw
        if ($raw -notmatch '(?m)^applyTo:\s*.+$') {
            $missingApplyTo += $file.Name
        }
    }

    $conflictFiles = @()
    if (Test-Path '.docs/changes/customization-reviews/conflicts') {
        $conflictFiles = @(Get-ChildItem '.docs/changes/customization-reviews/conflicts' -File -Filter '*.md' |
            Select-Object -ExpandProperty Name)
    }

    $result = [pscustomobject]@{
        RootPath = $RootPath
        ReviewDate = $ReviewDate
        CoreChecks = $coreResults
        SkillReviewAggregatePath = $skillAggregatePath
        Customization = [pscustomobject]@{
            AgentCount = $agentFiles.Count
            InstructionCount = $instructionFiles.Count
            MissingSpecializationCount = $missingSpecialization.Count
            MissingApplyToCount = $missingApplyTo.Count
            ConflictFileCount = $conflictFiles.Count
            MissingSpecialization = $missingSpecialization
            MissingApplyTo = $missingApplyTo
            ConflictFiles = $conflictFiles
        }
    }

    $result | ConvertTo-Json -Depth 8
}
finally {
    Pop-Location
}
