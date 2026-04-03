<!-- markdownlint-disable-file -->
# Governance Audit Report (Core Governance Only)

> **Note**: A comprehensive workspace health audit including skill and customization quality checks is available at [20260403-comprehensive-workspace-health-audit.md](./20260403-comprehensive-workspace-health-audit.md).

| Metric | Value |
|---|---|
| Audit Date | 2026-04-03 |
| Scope | Core governance (structure, catalogs, traceability) |
| Comprehensive Audit | [20260403-comprehensive-workspace-health-audit.md](./20260403-comprehensive-workspace-health-audit.md) |
| Previous Audit Compared | 2026-04-02 |

## Coverage Grid

| Lane | Agent Count | Skill Count | Coverage |
|---|---:|---:|---|
| Planning | 4 | 8 | Pass |
| Execution | 4 | 15 | Pass |
| Review | 5 | 14 | Pass |

## Standards Health Grid

| ID | Standard | Outcome | Evidence | Severity |
|---|---|---|---|---|
| GOV-M1 | Lane coverage complete | Pass | All three lifecycle lanes have at least one agent and one skill; current catalog counts are Planning 4 agents / 8 skills, Execution 4 agents / 15 skills, Review 5 agents / 14 skills. | High |
| GOV-M2 | Instruction frontmatter valid | Pass | All 16 `.instructions.md` files include valid frontmatter delimiters and required keys: `name`, `description`, and `applyTo`. | High |
| GOV-M3 | Catalog integrity | Pass | Catalog and repository inventories are aligned with no missing or stale rows: agents 13/13, skills 37/37, instructions 16/16, prompts 12/12. | High |
| GOV-M4 | Governance instruction coverage | Pass | `lifecycle-governance.instructions.md` uses `applyTo: '**/*.md'`, which covers primary governed markdown outputs under `.docs/`, including plans and changes. | High |
| GOV-S1 | Traceability ID usage | Pass | [20260402-customization-taxonomy-promotion-plan.md](./../../plans/20260402-customization-taxonomy-promotion-plan.md) uses the defined `PLAN-*`, `WS-*`, and `DEC-*` ID scheme. | Medium |
| GOV-S2 | ADR directory exists | Pass | `.docs/adr/` exists, includes [README.md](./../../../README.md), and indexes an accepted ADR. | Medium |
| GOV-S3 | Change history is indexed | Pass | [README.md](./../../../README.md) indexes active subdirectories including `governance-audits/` and references lifecycle governance. | Medium |
| GOV-S4 | Review cadence mechanism | Pass with advisory | Monthly cadence is documented via [governance-cadence.prompt.md](./../../../.github/prompts/governance-cadence.prompt.md); no CI-based scheduled trigger exists yet. | Low |
| GOV-S5 | Taxonomy currency | Pass | [customization-taxonomy-v1.md](./../../reference/customization-taxonomy-v1.md) is in approved-baseline status and remains aligned with current asset names and catalog lane assignments. | Medium |
| GOV-S6 | No orphaned governance documents | Pass | Core governance docs are linked from active index surfaces, including [README.md](./../../../README.md), [README.md](./../../../README.md), and [README.md](./../../../README.md). | Medium |
| GOV-S7 | Hub file freshness | Pass | [copilot-instructions.md](./../../../.github/copilot-instructions.md) Preferred Agents and Preferred Skills lists are fully aligned with the current agent and skill inventories; no missing or stale entries were found. | Medium |

## Catalog Integrity Grid

| Asset Type | Cataloged Count | Actual Count | Missing In Catalog | Stale Catalog Rows |
|---|---:|---:|---:|---:|
| Agents | 13 | 13 | 0 | 0 |
| Skills | 37 | 37 | 0 | 0 |
| Instructions | 16 | 16 | 0 | 0 |
| Prompts | 12 | 12 | 0 | 0 |

## Aggregate Metrics

| Metric | Value |
|---|---:|
| Audit Date | 2026-04-03 |
| GOV-M Pass | 4 |
| GOV-M Fail | 0 |
| GOV-S Pass | 6 |
| GOV-S Advisory | 1 |

## Ranked Recommendations

| ID | Action | Fixes | Priority |
|---|---|---|---|
| R1 | Add a scheduled CI workflow or equivalent automation for monthly governance cadence execution and remindering. | GOV-S4 | Medium |
| R2 | Continue the manual first-working-day governance cadence and retain dated audit artifacts until scheduled automation exists. | GOV-S4 | Low |
| R3 | Correct the helper PowerShell audit scripts so automated counts and name matching stay consistent with current asset naming conventions. | Audit reliability | Low |

## Regression Comparison vs 2026-04-02

| Area | 2026-04-02 | 2026-04-03 | Delta |
|---|---|---|---|
| GOV-M outcomes | 4 pass / 0 fail | 4 pass / 0 fail | No regression |
| GOV-S outcomes | 6 pass / 1 advisory | 6 pass / 1 advisory | No regression |
| Coverage counts | Planning 3/8, Execution 4/10, Review 5/12 | Planning 4/8, Execution 4/15, Review 5/14 | Inventory expanded while maintaining full lane coverage |
| Cadence mechanism | Manual prompt cadence; CI deferred | Manual prompt cadence; CI deferred | No change |

## Disposition

- No unresolved High severity findings remain.
- Governance baseline is healthy; the only open advisory is cadence automation.
