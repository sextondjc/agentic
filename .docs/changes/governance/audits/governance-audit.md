# Governance Audit

| Metric | Value |
|---|---|
| Audit Date | 2026-04-07 |
| Scope | all |
| Workspace Root | c:/Projects/agentic |
| Disposition | PASSED |

| ID | Standard | Outcome | Evidence |
|---|---|---|---|
| GOV-M1 | Lane coverage complete | Pass | [get-lane-counts.ps1](./../../../../.github/scripts/powershell/get-lane-counts.ps1) |
| GOV-M2 | Instruction frontmatter valid | Pass | [test-frontmatter-validity.ps1](./../../../../.github/scripts/powershell/test-frontmatter-validity.ps1) |
| GOV-M3 | Catalog integrity | Pass | [test-catalog-integrity.ps1](./../../../../.github/scripts/powershell/test-catalog-integrity.ps1) |
| GOV-M4 | Governance instruction coverage | Pass | [lifecycle-governance.instructions.md](./../../../../.github/instructions/lifecycle-governance.instructions.md) |
| GOV-S7 | Hub file freshness | Pass | [test-hub-file-sync.ps1](./../../../../.github/scripts/powershell/test-hub-file-sync.ps1) |

## Supporting References

- [governance-current-state.md](./../../../reference/governance-current-state.md)
- [governance-retention-policy.md](./../../../reference/governance-retention-policy.md)
- [governance-specialization-alignment-plan.md](./../../../plans/governance-specialization-alignment-plan.md)
- [link-graph-check.json](./link-graph-check.json)
