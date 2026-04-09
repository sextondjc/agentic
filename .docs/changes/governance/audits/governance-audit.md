# Governance Audit

## Metadata

| Metric | Value |
|---|---|
| Audit Date | 2026-04-09 |
| Scope | all |
| Workspace Root | c:/Projects/agentic |
| Disposition | PASSED |
| MUST Failures | 0 |
| Advisory Failures | 0 |

Disposition rationale: rerun remediation checks now pass for catalog integrity, link graph integrity, naming conformance, and hub sync.

## Coverage Grid By Lane

| Asset Type | Planning | Execution | Review | Coverage Outcome |
|---|---:|---:|---:|---|
| Instructions | 4 | 12 | 0 | Pass (all records lane-classified) |
| Agents | 4 | 4 | 7 | Pass |
| Prompts | 0 | 9 | 8 | Pass |
| Skills | 13 | 20 | 16 | Pass |

Evidence: [get-lane-counts.ps1](./../../../../.github/scripts/powershell/get-lane-counts.ps1)

## Standards Grid

| ID | Standard | Outcome | Severity | Evidence |
|---|---|---|---|---|
| GOV-M1 | Lane coverage complete | Pass | - | [get-lane-counts.ps1](./../../../../.github/scripts/powershell/get-lane-counts.ps1) |
| GOV-M2 | Frontmatter validity | Pass | - | [test-frontmatter-validity.ps1](./../../../../.github/scripts/powershell/test-frontmatter-validity.ps1) |
| GOV-M3 | Catalog integrity | Pass | - | [test-catalog-integrity.ps1](./../../../../.github/scripts/powershell/test-catalog-integrity.ps1), [skill-discovery-index.md](./../../../../.github/skills/skill-discovery-index.md) |
| GOV-M4 | Lifecycle governance coverage | Pass | - | [lifecycle-governance.instructions.md](./../../../../.github/instructions/lifecycle-governance.instructions.md), [instruction-lifecycle-catalog.md](./../../../../.github/instructions/instruction-lifecycle-catalog.md), [agent-lifecycle-catalog.md](./../../../../.github/agents/agent-lifecycle-catalog.md), [prompt-lifecycle-catalog.md](./../../../../.github/prompts/prompt-lifecycle-catalog.md) |
| GOV-S1 | Link graph integrity | Pass | - | [test-governance-link-graph.ps1](./../../../../.github/scripts/powershell/test-governance-link-graph.ps1) |
| GOV-S2 | Naming conformance | Pass | - | [test-naming-conformance.ps1](./../../../../.github/scripts/powershell/test-naming-conformance.ps1), [naming-conventions.instructions.md](./../../../../.github/instructions/naming-conventions.instructions.md) |
| GOV-S3 | Hub file sync | Pass | - | [test-hub-file-sync.ps1](./../../../../.github/scripts/powershell/test-hub-file-sync.ps1) |
| GOV-S4 | Artifact contract path hygiene | Pass | - | [test-governance-artifact-contract.ps1](./../../../../.github/scripts/powershell/test-governance-artifact-contract.ps1) |

## Ranked Findings

| ID | Severity | Finding | Standard Impact | Evidence |
|---|---|---|---|---|
| F-001 | High positive | Skill catalog integrity restored after removing stale `customization-authoring` catalog entry. | GOV-M3 MUST | [skill-discovery-index.md](./../../../../.github/skills/skill-discovery-index.md), [test-catalog-integrity.ps1](./../../../../.github/scripts/powershell/test-catalog-integrity.ps1) |
| F-002 | High positive | All previously broken governance links are repaired; link graph rerun is clean. | GOV-S1 | [r3-advisory-backlog-matrix.md](./../../r3-advisory-backlog-matrix.md), [INDEX.md](./../../customization/reviews/conflicts/INDEX.md), [governance-one-pager.md](./governance-one-pager.md), [customization-taxonomy-v1.md](./../../../reference/customization-taxonomy-v1.md) |
| F-003 | Medium positive | Naming conformance passes with explicit documented handling for dated skill-review snapshots. | GOV-S2 | [test-naming-conformance.ps1](./../../../../.github/scripts/powershell/test-naming-conformance.ps1), [naming-conventions.instructions.md](./../../../../.github/instructions/naming-conventions.instructions.md) |
| F-004 | Medium positive | Governance one-pager evidence links now align with the passing rerun state. | GOV-S1/GOV-S3 (cross-artifact consistency) | [governance-one-pager.md](./governance-one-pager.md), [governance-audit.md](./governance-audit.md) |

## No-Issue Checks

- Frontmatter validation passed for instructions, agents, and prompts.
- Hub preferred lists are currently synchronized with actual agent and skill directories.
- Artifact contract path validation passed with no violations.
- Lifecycle lane catalogs are present and lane counts resolve for all governed asset types.

## Conflict And Deviation Matrix

| Rule | Observed State | Deviation Type | Disposition |
|---|---|---|---|
| Catalog row must match live asset inventory | Skill catalog row list now matches live skill directories | Conflict | Closed |
| Governance docs must maintain valid markdown links | Link graph rerun reports `BrokenLinks=0` | Deviation | Closed |
| `.docs` names must not use date prefixes | Dated skill-review snapshots are explicitly handled by naming conformance script policy | Deviation | Closed |
| Governance status summaries must align with latest audit | One-pager and governance-audit are synchronized to same-day passing evidence | Drift | Closed |

## Remediation Backlog

| Action ID | Priority | Action | Owner Lane | Acceptance Check |
|---|---|---|---|---|
| R-001 | P1 | Remove or restore `customization-authoring` and reconcile catalog row in same change. | Execution | Completed - `test-catalog-integrity.ps1 -AssetType skills` returns no stale entries. |
| R-002 | P1 | Repair all 11 broken links and malformed markdown table link targets in flagged files. | Execution | Completed - `test-governance-link-graph.ps1` exits 0 with `BrokenLinks=0`. |
| R-003 | P2 | Normalize dated skill-review artifact names or scope explicit exemptions in policy/script with rationale. | Planning -> Execution | Completed - `test-naming-conformance.ps1 -RootPath .docs` exits 0 using explicit dated snapshot handling. |
| R-004 | P2 | Refresh one-pager disposition and evidence index after remediation rerun. | Review | Completed - one-pager and governance-audit now match same-date rerun evidence. |

## Evidence

- Script runs executed on 2026-04-09 from workspace root with explicit parameters.
- Rerun outcomes on 2026-04-09: catalog integrity pass, link graph pass, naming conformance pass, and hub sync pass.
- Core evidence scripts:
	- [test-frontmatter-validity.ps1](./../../../../.github/scripts/powershell/test-frontmatter-validity.ps1)
	- [test-catalog-integrity.ps1](./../../../../.github/scripts/powershell/test-catalog-integrity.ps1)
	- [test-hub-file-sync.ps1](./../../../../.github/scripts/powershell/test-hub-file-sync.ps1)
	- [test-governance-link-graph.ps1](./../../../../.github/scripts/powershell/test-governance-link-graph.ps1)
	- [test-governance-artifact-contract.ps1](./../../../../.github/scripts/powershell/test-governance-artifact-contract.ps1)
	- [get-lane-counts.ps1](./../../../../.github/scripts/powershell/get-lane-counts.ps1)
	- [test-naming-conformance.ps1](./../../../../.github/scripts/powershell/test-naming-conformance.ps1)
