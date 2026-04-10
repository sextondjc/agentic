---
name: governance-cadence
description: 'Periodic governance health check prompt. Run monthly to assess workspace instruction, agent, skill, and prompt catalog integrity and produce a ranked remediation report.'
---

# Governance Cadence Audit Prompt

Use the `governance-health-overview` skill to run a reconciled workspace governance health assessment that synthesizes core governance, skill quality, and customization quality outputs.

Execution Flag: `fresh-run required`

> **Note:** CI cadence is implemented via `.github/workflows/governance-cadence.yml`. Use this prompt for manual reruns, local investigations, and variance analysis between scheduled runs.

## Purpose

Detect governance drift early: uncatalogued assets, stale instruction frontmatter, broken traceability, missing lifecycle artifacts, hub freshness issues, unresolved customization conflicts, and skill quality regressions before they accumulate into integration problems.

## Scope

- All assets in `.github/agents/`, `.github/instructions/`, `.github/prompts/`, `.github/skills/`.
- Catalog READMEs for all four asset types.
- `copilot-instructions.md` preferred lists.
- [planning-execution-review-governance.md](./../skills/audit-governance/references/planning-execution-review-governance.md) traceability model.
- [customization-taxonomy-v1.md](./../skills/audit-governance/references/customization-taxonomy-v1.md) classification reference.
- `.docs/adr/` and `.docs/changes/` directory existence and index state.

## Required Actions

1. Load and follow [SKILL.md](./../skills/governance-health-overview/SKILL.md) before starting.
2. Invoke the skill with execution flag `fresh-run required`.
3. Run `audit-governance` first, `skill-review` second, `validate-customization` third, and `optimize-customizations` fourth in the same invocation.
4. Supply today's date as the audit date in `YYYY-MM-DD` format.
5. Write the reconciled governance health report to `.docs/changes/governance/audits/comprehensive-workspace-health-audit.md`.
6. Return results in chat as specified in the skill output format rules.
7. Run `.github/scripts/powershell/test-governance-link-graph.ps1` and include its outcome as GOV-S6 evidence.
8. Compare the new reconciled report with the latest prior report in `.docs/changes/governance/audits/` and summarize deltas.

## Output Requirements

Return the following in chat, in this order:

### Coverage Grid

| Lane | Agent Count | Skill Count | Coverage |
|---|---|---|---|
| Planning | N | N | Pass / Gap |
| Execution | N | N | Pass / Gap |
| Review | N | N | Pass / Gap |

### Standards Health Grid

| ID | Standard | Outcome | Evidence | Severity |
|---|---|---|---|---|
| GOV-M1 | Lane coverage | ... | ... | ... |
| GOV-M2 | Instruction frontmatter | ... | ... | ... |
| GOV-M3 | Catalog integrity | ... | ... | ... |
| GOV-M4 | Governance instruction applyTo | ... | ... | ... |
| GOV-S1 | Traceability ID usage | ... | ... | ... |
| GOV-S2 | ADR directory | ... | ... | ... |
| GOV-S3 | Change history index | ... | ... | ... |
| GOV-S4 | Review cadence mechanism | ... | ... | ... |
| GOV-S5 | Taxonomy currency | ... | ... | ... |
| GOV-S6 | No orphaned docs | ... | ... | ... |
| GOV-S7 | Hub file freshness | ... | ... | ... |
| GOV-S8 | Governance artifact contract conformance | ... | ... | ... |
| GOV-S9 | Utilization coverage | ... | ... | ... |
| GOV-S10 | Review recency | ... | ... | ... |
| GOV-OPT | Optimization factor coverage | ... | ... | ... |
| GOV-SK | Skill quality aggregate | ... | ... | ... |
| GOV-CUS | Customization quality aggregate | ... | ... | ... |

### Aggregate Metrics

| Metric | Value |
|---|---|
| Audit Date | YYYY-MM-DD |
| GOV-M Pass | N |
| GOV-M Fail | N |
| GOV-S Pass | N |
| GOV-S Advisory | N |
| Skill Review Fail | N |
| Customization Review Fail | N |
| Open Conflicts | N |

### Ranked Recommendations

| ID | Action | Fixes | Priority |
|---|---|---|---|
| R1 | ... | ... | High/Medium/Low |

## Recommended Cadence

Run on the first working day of each month.

Compare output against the previous month's report stored in `.docs/changes/governance/audits/`.

Treat this comparison as required unless no prior report exists.
