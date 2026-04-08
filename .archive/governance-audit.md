# Governance Audit

| Metric | Value |
|---|---|
| Audit Date | 2026-04-08 |
| Scope | full workspace |
| Execution Mode | fresh-run required |

## Coverage Grid

| Lane | Agent Count | Skill Count | Coverage |
|---|---:|---:|---|
| Planning | 4 | 12 | Pass |
| Execution | 4 | 18 | Pass |
| Review | 7 | 16 | Pass |

## Standards Health Grid

| ID | Standard | Outcome | Evidence | Severity |
|---|---|---|---|---|
| GOV-M1 | Lane coverage complete | Pass | [README.md](./../../reference/planning-execution-review-governance.md) | High |
| GOV-M2 | Instruction frontmatter valid | Pass | `test-frontmatter-validity.ps1` (agents/prompts/instructions all passed) | High |
| GOV-M3 | Catalog integrity | Pass | `test-catalog-integrity.ps1` (agents/prompts/instructions all passed) | High |
| GOV-M4 | Governance instruction coverage | Pass | [lifecycle-governance.instructions.md](./../../../.github/instructions/lifecycle-governance.instructions.md) | High |
| GOV-S1 | Traceability ID usage | Pass | [customization-taxonomy-v1.md](./../../reference/customization-taxonomy-v1.md) and active plan/change artifacts | Medium |
| GOV-S2 | ADR directory exists | Pass | [README.md](./../../adr/README.md) | Low |
| GOV-S3 | Change history is indexed | Pass | [README.md](./../README.md) | Low |
| GOV-S4 | Review cadence mechanism | Pass | [governance-cadence.prompt.md](./../../../.github/prompts/governance-cadence.prompt.md) | Medium |
| GOV-S5 | Taxonomy currency | Pass | [customization-taxonomy-v1.md](./../../reference/customization-taxonomy-v1.md) | Low |
| GOV-S6 | No orphaned governance documents | Advisory | `test-governance-link-graph.ps1` returned non-zero with broken-link findings in current run | Low |
| GOV-S7 | Hub file freshness | Pass | `test-hub-file-sync.ps1` passed | Medium |

## Aggregate Metrics

| Metric | Value |
|---|---|
| GOV-M Pass | 4 |
| GOV-M Fail | 0 |
| GOV-S Pass | 6 |
| GOV-S Advisory | 1 |

## Ranked Recommendations

| ID | Action | Fixes | Priority |
|---|---|---|---|
| R1 | Remediate broken local links reported by link-graph validation | Closes GOV-S6 advisory and reduces navigation failures across governance docs | High |
| R2 | Keep script-based integrity checks bundled in the one-shot governance runner | Preserves single-approval execution and reduces operator friction | Medium |
| R3 | Continue orchestrator-first intake and single-command execution policy for governance runs | Prevents routing drift and repeated manual approvals | Medium |
