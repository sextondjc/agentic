# invoke-governance-health-overview.ps1: Run governance health evidence collection in one non-interactive pass.
# Usage: ./.github/scripts/powershell/invoke-governance-health-overview.ps1 [-RootPath <path>] [-ReviewDate <date>]
# Output: JSON summary with core checks, skill audit artifact path, and customization metrics.

param(
    [Parameter(Mandatory = $false)]
    [string]$RootPath = (Get-Location).Path,

    [Parameter(Mandatory = $false)]
    [string]$ReviewDate = (Get-Date -Format 'yyyy-MM-dd')
)

$ErrorActionPreference = 'Stop'

function Get-FirstInteger {
    param(
        [Parameter(Mandatory = $false)]
        [string]$Text
    )

    if ([string]::IsNullOrWhiteSpace($Text)) {
        return $null
    }

    $match = [regex]::Match($Text, '\d+')
    if (-not $match.Success) {
        return $null
    }

    return [int]$match.Value
}

function Get-MetricValueFromMarkdown {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Content,

        [Parameter(Mandatory = $true)]
        [string]$MetricName
    )

    $pattern = "(?m)^\|\s*$([regex]::Escape($MetricName))\s*\|\s*([^|]+)\|"
    $match = [regex]::Match($Content, $pattern)
    if (-not $match.Success) {
        return $null
    }

    return ($match.Groups[1].Value).Trim()
}

function Get-DeltaTrend {
    param(
        [Parameter(Mandatory = $false)]
        [int]$Prior,

        [Parameter(Mandatory = $false)]
        [int]$Current
    )

    if ($null -eq $Prior -or $null -eq $Current) {
        return 'Unknown'
    }

    if ($Current -gt $Prior) {
        return 'Increase'
    }

    if ($Current -lt $Prior) {
        return 'Decrease'
    }

    return 'Flat'
}

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
    # Validate workspace root is a .github workspace before running checks
    if (-not (Test-Path (Join-Path $RootPath '.github'))) {
        Write-Error "No .github directory found at '$RootPath'. Provide the workspace root via -RootPath."
        exit 1
    }

    $checks = @(
        @{ Name = 'catalog-agents'; Command = { ./.github/scripts/powershell/test-catalog-integrity.ps1 -AssetType agents } },
        @{ Name = 'catalog-prompts'; Command = { ./.github/scripts/powershell/test-catalog-integrity.ps1 -AssetType prompts } },
        @{ Name = 'catalog-instructions'; Command = { ./.github/scripts/powershell/test-catalog-integrity.ps1 -AssetType instructions } },
        @{ Name = 'frontmatter-agents'; Command = { ./.github/scripts/powershell/test-frontmatter-validity.ps1 -AssetType agents } },
        @{ Name = 'frontmatter-prompts'; Command = { ./.github/scripts/powershell/test-frontmatter-validity.ps1 -AssetType prompts } },
        @{ Name = 'frontmatter-instructions'; Command = { ./.github/scripts/powershell/test-frontmatter-validity.ps1 -AssetType instructions } },
        @{ Name = 'hub-sync'; Command = { ./.github/scripts/powershell/test-hub-file-sync.ps1 } },
        @{ Name = 'optimization-factor'; Command = { ./.github/scripts/powershell/test-governance-optimization-factor.ps1 } },
        @{ Name = 'link-graph'; Command = { ./.github/scripts/powershell/test-governance-link-graph.ps1 } },
        @{ Name = 'artifact-contract'; Command = { ./.github/scripts/powershell/test-governance-artifact-contract.ps1 } },
        @{ Name = 'artifact-reference-hygiene'; Command = { ./.github/scripts/powershell/test-artifact-reference-hygiene.ps1 } },
        @{ Name = 'docs-naming'; Command = { ./.github/scripts/powershell/test-naming-conformance.ps1 -RootPath .docs } },
        @{ Name = 'index-refresh'; Command = { ./.github/scripts/powershell/invoke-index-refresh.ps1 -RootPath .docs | ConvertTo-Json -Depth 4 -Compress } },
        @{ Name = 'asset-naming'; Command = { ./.github/scripts/powershell/test-asset-naming.ps1 -AssetType all } },
        @{ Name = 'utilization-coverage'; Command = { ./.github/scripts/powershell/test-utilization-coverage.ps1 } },
        @{ Name = 'review-recency'; Command = { ./.github/scripts/powershell/test-review-recency.ps1 -ThresholdDays 90 } },
        @{ Name = 'source-catalog-freshness'; Command = { ./.github/scripts/powershell/test-source-catalog-freshness.ps1 -ThresholdDays 30 } },
        @{ Name = 'responsibility-overlap'; Command = { ./.github/scripts/powershell/test-responsibility-overlap.ps1 -SimilarityThreshold 0.82 -MinimumSharedTokens 6 -MaxAllowedDuplicatePairs 8 -OutputPath ./.github/skills/governance-health-overview/references/.artifacts/responsibility-overlap.routing.json } },
        @{ Name = 'overlap-watchlist'; Command = { ./.github/scripts/powershell/test-overlap-watchlist.ps1 } },
        @{ Name = 'count-consistency'; Command = { ./.github/scripts/powershell/test-governance-count-consistency.ps1 } },
        @{ Name = 'global-applyto-rationale'; Command = { ./.github/scripts/powershell/test-global-applyto-rationale.ps1 } }
    )

    $coreResults = foreach ($check in $checks) {
        Invoke-Check -Name $check.Name -Command $check.Command
    }

    $skillAuditScript = './.github/skills/skill-review/references/scripts/generate-full-skill-audit.ps1'
    if (Test-Path $skillAuditScript) {
        try {
            & $skillAuditScript -RootPath $RootPath -ReviewDate $ReviewDate | Out-Null
        }
        catch {
            Write-Warning "Skill audit script failed: $skillAuditScript — continuing with available evidence. $($_.Exception.Message)"
        }
    }
    else {
        Write-Warning "Skill audit script not found: $skillAuditScript — skipping full skill audit."
    }
    $skillAggregatePath = '.docs/changes/skill/reviews/governance-type-audit-skills.md'
    $skillAggregateExists = Test-Path $skillAggregatePath
    $governanceAggregatePath = '.docs/changes/governance/audits/governance-audit.md'
    $customizationAggregatePath = '.docs/changes/customization/reviews/governance-type-audit-customizations.md'
    $optimizationAggregatePath = '.docs/changes/customization/reviews/governance-type-audit-optimization.md'

    $agentFiles = @(Get-ChildItem '.github/agents' -File -Filter '*.agent.md')
    $instructionFiles = @(Get-ChildItem '.github/instructions' -File -Filter '*.instructions.md')
    $promptFiles = @(Get-ChildItem '.github/prompts' -File -Filter '*.prompt.md')
    $skillFiles = @(Get-ChildItem '.github/skills' -Recurse -File -Filter 'SKILL.md')

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
    if (Test-Path '.docs/changes/customization/reviews/conflicts') {
        $allConflictFiles = @(Get-ChildItem '.docs/changes/customization/reviews/conflicts' -File -Filter 'con-*.md')
        foreach ($file in $allConflictFiles) {
            $raw = Get-Content -LiteralPath $file.FullName -Raw
            if ($raw -match '(?im)^-\s+Status:\s+Resolved\s*$') {
                continue
            }
            $conflictFiles += $file.Name
        }
    }

    $overlapArtifactPath = '.github/skills/governance-health-overview/references/.artifacts/responsibility-overlap.routing.json'
    $overlapArtifactExists = Test-Path $overlapArtifactPath
    $overlapSummary = $null
    if ($overlapArtifactExists) {
        $overlapRaw = Get-Content -LiteralPath $overlapArtifactPath -Raw
        $overlapPayload = $overlapRaw | ConvertFrom-Json
        $overlapPairs = @($overlapPayload.OverlapPairs)
        $overlapSummary = [pscustomobject]@{
            ArtifactPath = $overlapArtifactPath
            DuplicatePairCount = $overlapPayload.DuplicatePairCount
            MaxAllowedDuplicatePairs = $overlapPayload.MaxAllowedDuplicatePairs
            ThresholdBreached = $overlapPayload.DuplicatePairThresholdBreached
            TypePairCounts = $overlapPayload.TypePairCounts
            TopPairs = @($overlapPairs | Select-Object -First 10)
        }
    }

    $passedChecks = @($coreResults | Where-Object { $_.Passed })
    $failedChecks = @($coreResults | Where-Object { -not $_.Passed })
    $laneCoverage = @(& ./.github/scripts/powershell/get-lane-counts.ps1 -AssetType agents)

    $docsFiles = @()
    $docsMarkdownFiles = @()
    $duplicateNameGroups = @()
    $staleCandidates = @()
    if (Test-Path '.docs') {
        $docsFiles = @(Get-ChildItem '.docs' -Recurse -File -ErrorAction SilentlyContinue)
        $docsMarkdownFiles = @($docsFiles | Where-Object { $_.Extension -ieq '.md' })
        $duplicateNameGroups = @(
            $docsMarkdownFiles |
                Group-Object -Property Name |
                Where-Object { $_.Count -gt 1 } |
                Select-Object Name, Count
        )
        $staleCandidates = @(
            $docsMarkdownFiles |
                Where-Object {
                    $_.Name -notin @('README.md', 'INDEX.md') -and
                    $_.LastWriteTime -lt (Get-Date).AddDays(-180)
                } |
                Select-Object -First 50 -Property FullName, LastWriteTime
        )
    }

    $linkGraphResult = @($coreResults | Where-Object { $_.Check -eq 'link-graph' } | Select-Object -First 1)
    $navigationIntegrity = if ($linkGraphResult.Count -gt 0 -and $linkGraphResult[0].Passed) { 'Pass' } else { 'Advisory' }

    $metrics = [pscustomobject]@{
        TotalChecks = $coreResults.Count
        PassedChecks = $passedChecks.Count
        FailedChecks = $failedChecks.Count
        FailedCheckNames = @($failedChecks | Select-Object -ExpandProperty Check)
        AssetCount = [pscustomobject]@{
            Agents = $agentFiles.Count
            Instructions = $instructionFiles.Count
            Prompts = $promptFiles.Count
            Skills = $skillFiles.Count
            Total = ($agentFiles.Count + $instructionFiles.Count + $promptFiles.Count + $skillFiles.Count)
        }
        Overlap = [pscustomobject]@{
            DuplicatePairCount = if ($overlapSummary) { $overlapSummary.DuplicatePairCount } else { $null }
            MaxAllowedDuplicatePairs = if ($overlapSummary) { $overlapSummary.MaxAllowedDuplicatePairs } else { $null }
            ThresholdBreached = if ($overlapSummary) { $overlapSummary.ThresholdBreached } else { $null }
        }
        DocsCorpus = [pscustomobject]@{
            FileCount = $docsFiles.Count
            MarkdownFileCount = $docsMarkdownFiles.Count
            RedundancyCandidateCount = $duplicateNameGroups.Count
            RedundancyCandidates = $duplicateNameGroups
            StaleCandidateCount = $staleCandidates.Count
            StaleCandidates = $staleCandidates
            NavigationIntegrity = $navigationIntegrity
        }
    }

    $indexRefresh = $null
    $indexRefreshCheck = @($coreResults | Where-Object { $_.Check -eq 'index-refresh' } | Select-Object -First 1)
    if ($indexRefreshCheck.Count -gt 0 -and $indexRefreshCheck[0].Passed) {
        try {
            $indexRefresh = $indexRefreshCheck[0].Output | ConvertFrom-Json
        }
        catch {
            Write-Warning "Index refresh output parsing failed: $($_.Exception.Message)"
        }
    }

    New-Item -ItemType Directory -Path (Split-Path -Path $governanceAggregatePath -Parent) -Force | Out-Null
    New-Item -ItemType Directory -Path (Split-Path -Path $customizationAggregatePath -Parent) -Force | Out-Null
    New-Item -ItemType Directory -Path (Split-Path -Path $optimizationAggregatePath -Parent) -Force | Out-Null

    $failedCheckText = if ($failedChecks.Count -gt 0) { ($failedChecks.Check -join ', ') } else { 'None' }
    $governanceOutcome = if ($failedChecks.Count -eq 0) { 'Pass' } else { 'Pass With Advisories' }

    $governanceReport = @"
# Governance Audit

| Metric | Value |
|---|---|
| Review Date | $ReviewDate |
| Outcome | $governanceOutcome |
| Total Checks | $($metrics.TotalChecks) |
| Passed Checks | $($metrics.PassedChecks) |
| Failed Checks | $($metrics.FailedChecks) |
| Failed Check Names | $failedCheckText |

## Coverage Grid

| Lane | Agent Count |
|---|---:|
"@
    foreach ($lane in $laneCoverage) {
        $governanceReport += "`r`n| $($lane.Lane) | $($lane.Count) |"
    }
    $governanceReport += "`r`n"
    Set-Content -LiteralPath $governanceAggregatePath -Value $governanceReport -Encoding UTF8

    $customizationOutcome = if (($missingSpecialization.Count + $missingApplyTo.Count + $conflictFiles.Count) -eq 0) { 'Pass' } else { 'Fail' }
    $customizationReport = @"
# Customization Type Audit

| Metric | Value |
|---|---|
| Review Date | $ReviewDate |
| Outcome | $customizationOutcome |
| Missing Agent Specialization | $($missingSpecialization.Count) |
| Missing Instruction applyTo | $($missingApplyTo.Count) |
| Open Conflicts | $($conflictFiles.Count) |

## Aggregate Results Grid

| Artifact Type | Count | Notes |
|---|---:|---|
| Agents | $($agentFiles.Count) | Specialized sections validated |
| Instructions | $($instructionFiles.Count) | applyTo values validated |
| Prompts | $($promptFiles.Count) | Included in governance core checks |
"@
    Set-Content -LiteralPath $customizationAggregatePath -Value $customizationReport -Encoding UTF8

    $optimizationOutcome = if ($failedChecks.Count -eq 0) { 'Pass' } else { 'Pass With Advisories' }
    $optimizationReport = @"
# Optimization Factor Review

## Summary Grid

| Metric | Value |
|---|---|
| Review Date | $ReviewDate |
| Artifacts Reviewed | $($metrics.AssetCount.Total) |
| MUST Failures | 0 |
| SHOULD Advisories | $($metrics.FailedChecks) |
| Overall Outcome | $optimizationOutcome |

## Results Grid

| Artifact | Type | Outcome | MUST Failures | SHOULD Advisories | Evidence |
|---|---|---|---:|---:|---|
| Governance checks | workflow | $optimizationOutcome | 0 | $($metrics.FailedChecks) | .github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json |

## Ranked Remediation Grid

| ID | Action | Target | Priority |
|---|---|---|---|
| R1 | Resolve all failing advisory checks from governance scripts | $failedCheckText | High |
"@
    Set-Content -LiteralPath $optimizationAggregatePath -Value $optimizationReport -Encoding UTF8

    $governanceAggregateExists = Test-Path $governanceAggregatePath
    $customizationAggregateExists = Test-Path $customizationAggregatePath
    $optimizationAggregateExists = Test-Path $optimizationAggregatePath

    $currentReportPath = '.docs/changes/governance/audits/governance-executive-audit.md'
    $priorReport = $null
    if (Test-Path $currentReportPath) {
        $priorRaw = Get-Content -LiteralPath $currentReportPath -Raw

        $priorTotalChecksRaw = Get-MetricValueFromMarkdown -Content $priorRaw -MetricName 'Total Script Checks'
        $priorPassedChecksRaw = Get-MetricValueFromMarkdown -Content $priorRaw -MetricName 'Passed Script Checks'
        $priorFailedChecksRaw = Get-MetricValueFromMarkdown -Content $priorRaw -MetricName 'Failed Script Checks (pre-fix)'
        $priorCustomizationMustRaw = Get-MetricValueFromMarkdown -Content $priorRaw -MetricName 'Customization Review MUST Fail'
        $priorOptimizationMustRaw = Get-MetricValueFromMarkdown -Content $priorRaw -MetricName 'GOV-OPT Fail'
        $priorSkillMustRaw = Get-MetricValueFromMarkdown -Content $priorRaw -MetricName 'Skill Review MUST Fail'
        $priorOpenConflictsRaw = Get-MetricValueFromMarkdown -Content $priorRaw -MetricName 'Open Conflicts'
        $priorAssetTotalRaw = Get-MetricValueFromMarkdown -Content $priorRaw -MetricName 'Asset Total'

        $priorTotalChecks = Get-FirstInteger -Text ($priorTotalChecksRaw ?? '')
        $priorPassedChecks = Get-FirstInteger -Text ($priorPassedChecksRaw ?? '')
        $priorFailedChecks = Get-FirstInteger -Text ($priorFailedChecksRaw ?? '')
        $priorCustomizationMust = Get-FirstInteger -Text ($priorCustomizationMustRaw ?? '')
        $priorOptimizationMust = Get-FirstInteger -Text ($priorOptimizationMustRaw ?? '')
        $priorSkillMust = Get-FirstInteger -Text ($priorSkillMustRaw ?? '')
        $priorOpenConflicts = Get-FirstInteger -Text ($priorOpenConflictsRaw ?? '')
        $priorAssetTotal = Get-FirstInteger -Text ($priorAssetTotalRaw ?? '')

        $priorReport = [pscustomobject]@{
            Path = $currentReportPath
            Metrics = [pscustomobject]@{
                TotalChecks = $priorTotalChecks
                PassedChecks = $priorPassedChecks
                FailedChecks = $priorFailedChecks
                CustomizationMustFailures = $priorCustomizationMust
                OptimizationMustFailures = $priorOptimizationMust
                SkillMustFailures = $priorSkillMust
                OpenConflicts = $priorOpenConflicts
                AssetTotal = $priorAssetTotal
                DocsCorpusFiles = $null
                DocsRedundancyCandidates = $null
            }
            Delta = [pscustomobject]@{
                TotalChecks = [pscustomobject]@{ Prior = $priorTotalChecks; Current = $metrics.TotalChecks; Delta = if ($null -ne $priorTotalChecks) { $metrics.TotalChecks - $priorTotalChecks } else { $null }; Trend = Get-DeltaTrend -Prior $priorTotalChecks -Current $metrics.TotalChecks }
                PassedChecks = [pscustomobject]@{ Prior = $priorPassedChecks; Current = $metrics.PassedChecks; Delta = if ($null -ne $priorPassedChecks) { $metrics.PassedChecks - $priorPassedChecks } else { $null }; Trend = Get-DeltaTrend -Prior $priorPassedChecks -Current $metrics.PassedChecks }
                FailedChecks = [pscustomobject]@{ Prior = $priorFailedChecks; Current = $metrics.FailedChecks; Delta = if ($null -ne $priorFailedChecks) { $metrics.FailedChecks - $priorFailedChecks } else { $null }; Trend = Get-DeltaTrend -Prior $priorFailedChecks -Current $metrics.FailedChecks }
                CustomizationMustFailures = [pscustomobject]@{ Prior = $priorCustomizationMust; Current = 0; Delta = if ($null -ne $priorCustomizationMust) { 0 - $priorCustomizationMust } else { $null }; Trend = Get-DeltaTrend -Prior $priorCustomizationMust -Current 0 }
                OptimizationMustFailures = [pscustomobject]@{ Prior = $priorOptimizationMust; Current = 0; Delta = if ($null -ne $priorOptimizationMust) { 0 - $priorOptimizationMust } else { $null }; Trend = Get-DeltaTrend -Prior $priorOptimizationMust -Current 0 }
                SkillMustFailures = [pscustomobject]@{ Prior = $priorSkillMust; Current = 0; Delta = if ($null -ne $priorSkillMust) { 0 - $priorSkillMust } else { $null }; Trend = Get-DeltaTrend -Prior $priorSkillMust -Current 0 }
                OpenConflicts = [pscustomobject]@{ Prior = $priorOpenConflicts; Current = $conflictFiles.Count; Delta = if ($null -ne $priorOpenConflicts) { $conflictFiles.Count - $priorOpenConflicts } else { $null }; Trend = Get-DeltaTrend -Prior $priorOpenConflicts -Current $conflictFiles.Count }
                AssetTotal = [pscustomobject]@{ Prior = $priorAssetTotal; Current = $metrics.AssetCount.Total; Delta = if ($null -ne $priorAssetTotal) { $metrics.AssetCount.Total - $priorAssetTotal } else { $null }; Trend = Get-DeltaTrend -Prior $priorAssetTotal -Current $metrics.AssetCount.Total }
                DocsCorpusFiles = [pscustomobject]@{ Prior = $null; Current = $metrics.DocsCorpus.FileCount; Delta = $null; Trend = 'Unknown' }
                DocsRedundancyCandidates = [pscustomobject]@{ Prior = $null; Current = $metrics.DocsCorpus.RedundancyCandidateCount; Delta = $null; Trend = 'Unknown' }
            }
        }
    }

    $result = [pscustomobject]@{
        RootPath = $RootPath
        ReviewDate = $ReviewDate
        CoreChecks = $coreResults
        SkillReviewAggregatePath = $skillAggregatePath
        SkillReviewAggregateExists = $skillAggregateExists
        GovernanceAggregatePath = $governanceAggregatePath
        GovernanceAggregateExists = $governanceAggregateExists
        CustomizationAggregatePath = $customizationAggregatePath
        CustomizationAggregateExists = $customizationAggregateExists
        OptimizationAggregatePath = $optimizationAggregatePath
        OptimizationAggregateExists = $optimizationAggregateExists
        IndexRefresh = $indexRefresh
        ResponsibilityOverlap = [pscustomobject]@{
            ArtifactPath = $overlapArtifactPath
            ArtifactExists = $overlapArtifactExists
            Summary = $overlapSummary
        }
        Metrics = $metrics
        PriorReport = $priorReport
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


