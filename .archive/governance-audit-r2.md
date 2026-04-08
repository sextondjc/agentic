# Governance Audit Report (Core Governance Only)

| Metric | Value |
|---|---|
| Audit Date | 2026-04-03 |
| Scope | Core governance (structure, catalogs, traceability) |
| Rerun Type | Post-remediation |

## Coverage Grid

| Lane | Agent Count | Skill Count | Coverage |
|---|---:|---:|---|
| Planning | 4 | 8 | Pass |
| Execution | 4 | 15 | Pass |
| Review | 6 | 15 | Pass |

## Standards Health Grid

| ID | Standard | Outcome | Evidence | Severity |
|---|---|---|---|---|
| GOV-M1 | Lane coverage complete | Pass | All three lanes have at least one agent and one skill. | High |
| GOV-M2 | Instruction frontmatter valid | Pass | All instruction files retain valid required frontmatter keys. | High |
| GOV-M3 | Catalog integrity | Pass | Catalog and repository inventories remain aligned. | High |
| GOV-M4 | Governance instruction coverage | Pass | `lifecycle-governance.instructions.md` applies to governed markdown outputs. | High |
| GOV-S1 | Traceability ID usage | Pass | Plan artifacts use `PLAN-*`, `WS-*`, and `DEC-*` identifiers. | Medium |
| GOV-S2 | ADR directory exists | Pass | `.docs/adr/` exists and remains indexed. | Medium |
| GOV-S3 | Change history is indexed | Pass | [README.md](./../../../README.md) indexes active subdirectories. | Medium |
| GOV-S4 | Review cadence mechanism | Pass | Scheduled workflow now exists at `.github/workflows/governance-cadence.yml`. | Medium |
| GOV-S5 | Taxonomy currency | Pass | Taxonomy artifact remains approved and current. | Medium |
| GOV-S6 | No orphaned governance documents | Pass | Core governance docs are linked from active index surfaces. | Medium |
| GOV-S7 | Hub file freshness | Pass | Preferred agent and skill lists remain aligned with inventory. | Medium |

## Aggregate Metrics

| Metric | Value |
|---|---:|
| GOV-M Pass | 4 |
| GOV-M Fail | 0 |
| GOV-S Pass | 7 |
| GOV-S Advisory | 0 |

## Disposition

Governance baseline is fully green for core governance standards in this rerun.
