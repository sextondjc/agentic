[CmdletBinding()]
param(
    [Parameter()]
    [string]$RootPath = (Get-Location).Path,
    [Parameter()]
    [string]$OutputPath = '.artifacts/local-governance-run.json'
)

$ErrorActionPreference = 'Stop'
Push-Location $RootPath
try {
    New-Item -ItemType Directory -Path (Split-Path -Path $OutputPath -Parent) -Force | Out-Null

    function Invoke-Check {
        param([string]$Name,[scriptblock]$Cmd)
        try {
            $out = (& $Cmd 2>&1 | Out-String).Trim()
            $code = $LASTEXITCODE
            if ($null -eq $code) { $code = 0 }
        } catch {
            $out = ($_ | Out-String).Trim()
            $code = 1
        }
        [pscustomobject]@{ Name = $Name; ExitCode = $code; Passed = ($code -eq 0); Output = $out }
    }

    $checks = @(
        @{ Name='frontmatter-instructions'; Cmd={ ./.github/scripts/powershell/test-frontmatter-validity.ps1 -AssetType instructions } },
        @{ Name='frontmatter-agents'; Cmd={ ./.github/scripts/powershell/test-frontmatter-validity.ps1 -AssetType agents } },
        @{ Name='frontmatter-prompts'; Cmd={ ./.github/scripts/powershell/test-frontmatter-validity.ps1 -AssetType prompts } },
        @{ Name='catalog-agents'; Cmd={ ./.github/scripts/powershell/test-catalog-integrity.ps1 -AssetType agents } },
        @{ Name='catalog-skills'; Cmd={ ./.github/scripts/powershell/test-catalog-integrity.ps1 -AssetType skills } },
        @{ Name='catalog-instructions'; Cmd={ ./.github/scripts/powershell/test-catalog-integrity.ps1 -AssetType instructions } },
        @{ Name='catalog-prompts'; Cmd={ ./.github/scripts/powershell/test-catalog-integrity.ps1 -AssetType prompts } },
        @{ Name='hub-sync'; Cmd={ ./.github/scripts/powershell/test-hub-file-sync.ps1 } },
        @{ Name='optimization-factor-check'; Cmd={ ./.github/scripts/powershell/test-governance-optimization-factor.ps1 } },
        @{ Name='link-graph'; Cmd={ ./.github/scripts/powershell/test-governance-link-graph.ps1 } },
        @{ Name='artifact-contract'; Cmd={ ./.github/scripts/powershell/test-governance-artifact-contract.ps1 } },
        @{ Name='artifact-reference-hygiene'; Cmd={ ./.github/scripts/powershell/test-artifact-reference-hygiene.ps1 } },
        @{ Name='docs-naming'; Cmd={ ./.github/scripts/powershell/test-naming-conformance.ps1 -RootPath .docs } },
        @{ Name='asset-naming'; Cmd={ ./.github/scripts/powershell/test-asset-naming.ps1 -AssetType all } },
        @{ Name='utilization-coverage'; Cmd={ ./.github/scripts/powershell/test-utilization-coverage.ps1 } },
        @{ Name='review-recency'; Cmd={ ./.github/scripts/powershell/test-review-recency.ps1 -ThresholdDays 90 } },
        @{ Name='source-catalog-freshness'; Cmd={ ./.github/scripts/powershell/test-source-catalog-freshness.ps1 -ThresholdDays 30 } }
    )

    $results = foreach ($check in $checks) { Invoke-Check -Name $check.Name -Cmd $check.Cmd }

    $laneAgents = @(& ./.github/scripts/powershell/get-lane-counts.ps1 -AssetType agents)
    $laneSkills = @(& ./.github/scripts/powershell/get-lane-counts.ps1 -AssetType skills)

    $coverage = foreach ($lane in @('Planning','Execution','Review')) {
        $agentCount = (@($laneAgents | Where-Object { $_.Lane -eq $lane }) | Select-Object -First 1).Count
        $skillCount = (@($laneSkills | Where-Object { $_.Lane -eq $lane }) | Select-Object -First 1).Count
        if ($null -eq $agentCount) { $agentCount = 0 }
        if ($null -eq $skillCount) { $skillCount = 0 }
        [pscustomobject]@{
            Lane = $lane
            AgentCount = [int]$agentCount
            SkillCount = [int]$skillCount
            Coverage = if (($agentCount -gt 0) -and ($skillCount -gt 0)) { 'Pass' } else { 'Gap' }
        }
    }

    $payload = [pscustomobject]@{
        AuditDate = (Get-Date -Format 'yyyy-MM-dd')
        Coverage = $coverage
        Checks = $results
        ArtifactSummary = [pscustomobject]@{
            SkillAggregateExists = (Test-Path '.docs/changes/skill/reviews/governance-type-audit-skills.md')
            CustomizationAuditExists = (Test-Path '.docs/changes/customization/reviews/governance-type-audit-customizations.md')
            OptimizationArtifactExists = (Test-Path '.docs/changes/customization/reviews/governance-type-audit-optimization.md')
        }
        Metrics = [pscustomobject]@{
            TotalChecks = $results.Count
            PassedChecks = @($results | Where-Object Passed).Count
            MustFailCount = @($results | Where-Object { -not $_.Passed -and $_.Name -match 'frontmatter|catalog|artifact-contract' }).Count
            AdvisoryFailCount = @($results | Where-Object { -not $_.Passed -and $_.Name -notmatch 'frontmatter|catalog|artifact-contract' }).Count
        }
    }

    $payload | ConvertTo-Json -Depth 8 | Set-Content -Path $OutputPath -Encoding UTF8
    Get-Content -Path $OutputPath -Raw
}
finally {
    Pop-Location
}

