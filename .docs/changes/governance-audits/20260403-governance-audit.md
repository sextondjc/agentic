<!-- markdownlint-disable-file -->
# Governance Audit Report

| Metric | Value |
|---|---|
| Audit Date | 2026-04-03 |
| Scope | all |
| Previous Audit Compared | 2026-04-02 |

## Coverage Grid

| Lane | Agent Count | Skill Count | Coverage |
|---|---:|---:|---|
| Planning | 4 | 8 | Pass |
| Execution | 4 | 12 | Pass |
| Review | 5 | 14 | Pass |

## Standards Health Grid

| ID | Standard | Outcome | Evidence | Severity |
|---|---|---|---|---|
| GOV-M1 | Lane coverage complete | Pass | All lanes have at least one agent and one skill; counts verified from catalogs. | High |
| GOV-M2 | Instruction frontmatter valid | Pass | All instruction files include opening and closing frontmatter delimiters and required keys: name, description, applyTo. | High |
| GOV-M3 | Catalog integrity | Fail | `.github/instructions/README.md` is missing `namespace-and-assembly-boundaries.instructions.md` from Instruction Mapping table. | High |
| GOV-M4 | Governance instruction coverage | Pass | `lifecycle-governance.instructions.md` uses `applyTo: '**/*.md'`, which covers `.docs/**/*.md` outputs including plans and changes. | High |
| GOV-S1 | Traceability ID usage | Pass | `.docs/plans/20260402-customization-taxonomy-promotion-plan.md` contains `PLAN-*`, `WS-*`, and `DEC-*` IDs. | Medium |
| GOV-S2 | ADR directory exists | Pass | `.docs/adr/` exists and includes `README.md` plus at least one ADR artifact. | Medium |
| GOV-S3 | Change history is indexed | Pass | `.docs/changes/README.md` indexes active subdirectories including `governance-audits/`. | Medium |
| GOV-S4 | Review cadence mechanism | Pass with advisory | Monthly cadence mechanism exists via `.github/prompts/governance-cadence.prompt.md`; CI trigger still deferred. | Low |
| GOV-S5 | Taxonomy currency | Pass | `.docs/reference/customization-taxonomy-v1.md` is approved baseline status and aligned to current renamed assets. | Medium |
| GOV-S6 | No orphaned governance documents | Pass | Key governance docs are linked from indexes/catalogs (`README.md`, `.docs/reference/index.md`, prompt and skill references). | Medium |
| GOV-S7 | Hub file freshness | Advisory | `.github/copilot-instructions.md` Preferred Skills omits 6 existing skills: `curating-copilot-instructions`, `current-test-coverage`, `customization-authoring`, `sync-customizations`, `validate-customization`, `write-technical-docs`. | Medium |

## Catalog Integrity Grid

| Asset Type | Cataloged Count | Actual Count | Missing In Catalog | Stale Catalog Rows |
|---|---:|---:|---:|---:|
| Agents | 13 | 13 | 0 | 0 |
| Skills | 34 | 34 | 0 | 0 |
| Instructions | 15 | 16 | 1 | 0 |
| Prompts | 12 | 12 | 0 | 0 |

## Aggregate Metrics

| Metric | Value |
|---|---:|
| Audit Date | 2026-04-03 |
| GOV-M Pass | 3 |
| GOV-M Fail | 1 |
| GOV-S Pass | 5 |
| GOV-S Advisory | 2 |

## Ranked Recommendations

| ID | Action | Fixes | Priority |
|---|---|---|---|
| R1 | Add missing instruction row to `.github/instructions/README.md` for `namespace-and-assembly-boundaries.instructions.md` with lane and rationale | GOV-M3 | High |
| R2 | Sync `.github/copilot-instructions.md` Preferred Skills with full current skill inventory or explicitly label it as intentionally curated subset | GOV-S7 | Medium |
| R3 | Add CI schedule workflow for monthly governance cadence execution and report reminder | GOV-S4 | Medium |
| R4 | Keep monthly manual governance run on first working day and retain dated report artifacts | GOV-S4 | Low |

## Regression Comparison vs 2026-04-02

| Area | 2026-04-02 | 2026-04-03 | Delta |
|---|---|---|---|
| GOV-M3 Catalog integrity | Pass | Fail | Regression: instruction catalog drift introduced (1 missing row). |
| GOV-S7 Hub freshness | Pass | Advisory | Regression: Preferred Skills list no longer reflects full current inventory. |
| GOV-S4 Cadence mechanism | Pass with advisory | Pass with advisory | No change (manual prompt cadence retained, CI still deferred). |

## Disposition

- One unresolved High severity finding remains (GOV-M3).
- Governance baseline remains usable, but catalog integrity should be remediated before next audit cycle.