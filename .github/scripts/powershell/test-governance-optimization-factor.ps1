# test-governance-optimization-factor.ps1: Ensure optimization remains an enforced governance review factor.
# Usage: ./.github/scripts/powershell/test-governance-optimization-factor.ps1 [-RootPath <path>]

param(
    [Parameter(Mandatory = $false)]
    [string]$RootPath = (Get-Location).Path
)

$ErrorActionPreference = 'Stop'

$checks = @(
    @{ Name = 'skill-review brevity standard'; Path = '.github/skills/skill-review/SKILL.md'; Pattern = 'SKR-S5\s*\|\s*Brevity' },
    @{ Name = 'governance-validate-customization instruction brevity'; Path = '.github/skills/governance-validate-customization/SKILL.md'; Pattern = 'INR-S4\s*\|\s*Brevity' },
    @{ Name = 'governance-validate-customization agent brevity'; Path = '.github/skills/governance-validate-customization/SKILL.md'; Pattern = 'AGR-S3\s*\|\s*Brevity' },
    @{ Name = 'optimization skill exists'; Path = '.github/skills/optimize-customizations/SKILL.md'; Pattern = '^---' },
    @{ Name = 'skill discovery registration'; Path = '.github/skills/skill-discovery-index.md'; Pattern = '\|\s*optimize-customizations\s*\|' },
    @{ Name = 'copilot skills discovery pointer'; Path = '.github/copilot-instructions.md'; Pattern = '\[skill-discovery-index\.md\]\(\./skills/skill-discovery-index\.md\)' },
    @{ Name = 'governance-audit includes GOV-OPT'; Path = '.github/skills/governance-audit/SKILL.md'; Pattern = 'GOV-OPT' },
    @{ Name = 'execute-customization-audit includes optimization skill'; Path = '.github/skills/execute-customization-audit/SKILL.md'; Pattern = 'governance-audit-types-optimization' },
    @{ Name = 'executive prompt references execute customization audit workflow'; Path = '.github/prompts/execute-customization-audit.prompt.md'; Pattern = 'execute-customization-audit' },
    @{ Name = 'on-demand optimization prompt exists'; Path = '.github/prompts/optimize-customizations.prompt.md'; Pattern = '^---' },
    @{ Name = 'optimization prompt catalog registration'; Path = '.github/prompts/prompt-lifecycle-catalog.md'; Pattern = '\|\s*`optimize-customizations`\s*\|\s*`optimize-customizations\.prompt\.md`\s*\|' }
)

$violations = @()

Push-Location $RootPath
try {
    foreach ($check in $checks) {
        if (-not (Test-Path $check.Path)) {
            $violations += [pscustomobject]@{ Check = $check.Name; Path = $check.Path; Reason = 'Missing file' }
            continue
        }

        $raw = Get-Content -LiteralPath $check.Path -Raw
        if ($raw -notmatch $check.Pattern) {
            $violations += [pscustomobject]@{ Check = $check.Name; Path = $check.Path; Reason = 'Required pattern not found' }
        }
    }

    if ($violations.Count -gt 0) {
        $violations | ConvertTo-Json -Depth 5
        exit 1
    }

    Write-Output 'Governance optimization factor validation passed.'
    exit 0
}
finally {
    Pop-Location
}

