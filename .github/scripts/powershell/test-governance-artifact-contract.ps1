# test-governance-artifact-contract.ps1: Detect legacy governance artifact path contracts in active governance assets.
# Usage: ./.github/scripts/powershell/test-governance-artifact-contract.ps1
# Output: PSCustomObject array of violations (empty = clean). Exits 1 if violations found.

[CmdletBinding()]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$RootPath = '.'
)

$ErrorActionPreference = 'Stop'

$scanTargets = @(
    '.github/agents/governance-briefer.agent.md',
    '.github/skills/skill-review/SKILL.md',
    '.github/skills/skill-review/references/skill-review-report-template.md',
    '.github/skills/skill-review/references/skill-conflict-report-template.md',
    '.github/skills/skill-review/references/scripts',
    '.github/skills/audit-governance/SKILL.md',
    '.github/skills/governance-health-overview/SKILL.md',
    '.github/skills/summarize-governance/SKILL.md',
    '.github/prompts/governance-type-audit.prompt.md',
    '.github/prompts/governance-executive-audit.prompt.md',
    '.github/prompts/governance-item-audit.prompt.md',
    '.github/scripts/powershell'
)

$rules = @(
    @{
        Id = 'LegacySkillReviewPath'
        Pattern = '\.docs/changes/skill-reviews(?:/|\b)'
        Recommendation = '.docs/changes/skill/reviews'
    },
    @{
        Id = 'LegacySkillConflictPath'
        Pattern = '\.docs/changes/skill-conflicts(?:/|\b)'
        Recommendation = '.docs/changes/skill/conflicts'
    },
    @{
        Id = 'LegacyGovernanceAuditPath'
        Pattern = '\.docs/changes/governance-audits(?:/|\b)'
        Recommendation = '.docs/changes/governance/audits'
    },
    @{
        Id = 'LegacyCustomizationReviewPath'
        Pattern = '\.docs/changes/customization-reviews(?:/|\b)'
        Recommendation = '.docs/changes/customization/reviews'
    },
    @{
        Id = 'DatedSkillReviewArtifact'
        Pattern = '\.docs/changes/skill/reviews/[^\s)"''`]+/\d{8}-review\.md'
        Recommendation = '.docs/changes/skill/reviews/<skill-name>/review.md'
    },
    @{
        Id = 'DatedSkillAggregateArtifact'
        Pattern = '\.docs/changes/skill/reviews/\d{8}-full-skill-review-grid\.md'
        Recommendation = '.docs/changes/skill/reviews/governance-type-audit-skills.md'
    },
    @{
        Id = 'LegacyExecutiveAuditReportName'
        Pattern = '(?<![A-Za-z0-9_-])comprehensive-workspace-health-audit\.md(?![A-Za-z0-9_-])'
        Recommendation = 'governance-executive-audit.md'
    },
    @{
        Id = 'LegacySkillAggregateReportName'
        Pattern = '(?<![A-Za-z0-9_-])full-skill-review-grid\.md(?![A-Za-z0-9_-])'
        Recommendation = 'governance-type-audit-skills.md'
    },
    @{
        Id = 'LegacyOptimizationReportName'
        Pattern = '(?<![A-Za-z0-9_-])optimization-factor\.md(?![A-Za-z0-9_-])'
        Recommendation = 'governance-type-audit-optimization.md'
    },
    @{
        Id = 'LegacyCustomizationAggregateReportPath'
        Pattern = '(?<![A-Za-z0-9_-])\.docs/changes/customization/reviews/audit\.md(?![A-Za-z0-9_-])'
        Recommendation = '.docs/changes/customization/reviews/governance-type-audit-customizations.md'
    }
)

$violations = [System.Collections.Generic.List[PSCustomObject]]::new()

foreach ($target in $scanTargets) {
    $fullTarget = Join-Path $RootPath $target
    if (-not (Test-Path -LiteralPath $fullTarget)) {
        continue
    }

    $items = if ((Get-Item -LiteralPath $fullTarget) -is [System.IO.DirectoryInfo]) {
        Get-ChildItem -LiteralPath $fullTarget -Recurse -File |
            Where-Object {
                $_.Extension -in @('.md', '.ps1', '.psm1') -and
                $_.FullName -notlike '*\references\history\*' -and
                $_.FullName -ne $PSCommandPath
            }
    }
    else {
        $item = Get-Item -LiteralPath $fullTarget
        if ($item.FullName -eq $PSCommandPath) {
            @()
        }
        else {
            @($item)
        }
    }

    foreach ($item in $items) {
        $content = Get-Content -LiteralPath $item.FullName -Raw
        foreach ($rule in $rules) {
            $ruleMatches = [regex]::Matches($content, $rule.Pattern)
            foreach ($match in ($ruleMatches | Select-Object -First 5)) {
                $violations.Add([PSCustomObject]@{
                    File = [System.IO.Path]::GetRelativePath((Resolve-Path -LiteralPath $RootPath).Path, $item.FullName).Replace('\\', '/')
                    Rule = $rule.Id
                    Match = $match.Value
                    Recommendation = $rule.Recommendation
                })
            }
        }
    }
}

if ($violations.Count -gt 0) {
    Write-Warning "Governance artifact contract: $($violations.Count) violation(s) found."
    $violations | Sort-Object File, Rule, Match -Unique
    exit 1
}

$violations
exit 0
