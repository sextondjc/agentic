---
name: governance-cadence
description: 'Periodic governance health check prompt. Run monthly to assess workspace instruction, agent, skill, and prompt catalog integrity and produce a ranked remediation report.'
---

# Governance Cadence Audit Prompt

Use the `governance-health-overview` skill to run a reconciled workspace governance health assessment that synthesizes core governance, skill quality, and customization quality outputs.

> **Note:** A CI-based trigger for this prompt is on the backlog. Until a CI workflow is in place, run this prompt manually on a monthly cadence (first working day of each month is recommended).

## Purpose

Detect governance drift early: uncatalogued assets, stale instruction frontmatter, broken traceability, missing lifecycle artifacts, hub freshness issues, unresolved customization conflicts, and skill quality regressions before they accumulate into integration problems.

## Scope

- All assets in `.github/agents/`, `.github/instructions/`, `.github/prompts/`, `.github/skills/`.
- Catalog READMEs for all four asset types.
- `copilot-instructions.md` preferred lists.
- [planning-execution-review-governance.md](./../../.docs/reference/planning-execution-review-governance.md) traceability model.
- [customization-taxonomy-v1.md](./../../.docs/reference/customization-taxonomy-v1.md) classification reference.
- `.docs/adr/` and `.docs/changes/` directory existence and index state.

## Required Actions

1. Load and follow [SKILL.md](./../skills/governance-health-overview/SKILL.md) before starting.
2. Use today's source artifacts from `audit-governance`, `skill-review`, and `validate-customization` (or run them first if missing).
3. Supply today's date as the audit date in `YYYY-MM-DD` format.
4. Write the reconciled governance health report to `.docs/changes/governance-audits/YYYYMMDD-comprehensive-workspace-health-audit.md`.
5. Return results in chat as specified in the skill output format rules.

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

Compare output against the previous month's report stored in `.docs/changes/governance-audits/`.
