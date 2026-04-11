---
name: audit-governance
description: Use when assessing the workspace governance layer as a whole and producing a ranked, evidence-backed remediation report.
---

# Audit Governance

## Specialization

Run a workspace-level governance assessment and return a single report with coverage, standards outcomes, and prioritized remediation.

## Trigger Conditions

- Governance posture must be assessed across agents, instructions, prompts, skills, and catalogs.
- A periodic governance health check is requested.
- A restructuring event may have introduced drift.

## Inputs

- Workspace root path.
- Audit date (YYYY-MM-DD).
- Optional scope filter: all, agents, instructions, prompts, skills, catalogs.

## Required Outputs

- Governance report at .docs/changes/governance/audits/governance-audit.md.
- Coverage grid by lane.
- Standards grid for GOV-M* and GOV-S*.
- Ranked recommendations with priority and evidence.

#### Violation Code Legend

| Code Prefix | Standard | Type | Skill Source |
|---|---|---|---|
| GOV-M* | Mandatory governance check | MUST | audit-governance |
| GOV-S* | Advisory governance check | SHOULD | audit-governance |
| GOV-SK | Skill quality aggregate | Aggregate | skill-review |
| GOV-CUS | Customization quality aggregate | Aggregate | validate-customization |
| GOV-OPT | Optimization factor coverage | Aggregate | optimize-customizations |
| SKR-M* | Mandatory skill quality check | MUST | skill-review |
| SKR-S* | Advisory skill quality check | SHOULD | skill-review |
| INR-M* | Mandatory instruction quality check | MUST | validate-customization |
| INR-S* | Advisory instruction quality check | SHOULD | validate-customization |
| AGR-M* | Mandatory agent quality check | MUST | validate-customization |
| AGR-S* | Advisory agent quality check | SHOULD | validate-customization |
| PRR-M* | Mandatory prompt quality check | MUST | validate-customization |
| PRR-S* | Advisory prompt quality check | SHOULD | validate-customization |
| OPR-M* | Mandatory optimization quality check | MUST | optimize-customizations |
| OPR-S* | Advisory optimization quality check | SHOULD | optimize-customizations |

## Standards

Core checks:
- GOV-M1 lane coverage
- GOV-M2 frontmatter validity
- GOV-M3 catalog integrity
- GOV-M4 lifecycle-governance coverage
- GOV-S1..GOV-S11 advisory checks
- GOV-OPT optimization factor coverage across authoring and review routines
- GOV-S9 utilization coverage across skills, agents, and prompts
- GOV-S10 review recency threshold coverage for tracked assets
- GOV-S11 responsibility overlap threshold coverage across agents, instructions, prompts, and skills

Companion checks:
- Use skill-review for GOV-SK outcomes.
- Use validate-customization for GOV-CUS outcomes.
- Use optimize-customizations for GOV-OPT outcomes.

## Workflow

1. Inventory assets and read governance catalogs.
2. Run script-based checks from .github/scripts/powershell.
3. Evaluate GOV-M* first, then GOV-S*.
4. Pull GOV-SK, GOV-CUS, and GOV-OPT outcomes from companion skills.
5. Produce grids and prioritized remediation actions.

## Script Integration

Use these existing scripts:
- get-lane-counts.ps1
- test-catalog-integrity.ps1
- test-frontmatter-validity.ps1
- test-hub-file-sync.ps1
- test-governance-link-graph.ps1
- test-governance-artifact-contract.ps1
- test-utilization-coverage.ps1
- test-review-recency.ps1
- test-source-catalog-freshness.ps1
- test-responsibility-overlap.ps1

## Output Rules

- Use markdown grids for all outcomes.
- Mark MUST failures as High severity.
- Set final disposition to FAILED if any MUST check fails.

## Done Criteria

- All GOV-M* and GOV-S* checks executed with evidence.
- Report saved at required path.
- Recommendations mapped to specific failures or advisories.
- Source catalogs for execute-sync-customizations and execute-sync-skills are checked for freshness threshold drift.


