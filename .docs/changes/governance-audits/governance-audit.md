# Governance Audit

| Metric | Value |
|---|---|
| Audit Date | 2026-04-09 |
| Scope | all |
| Execution Mode | fresh-run required |

## Coverage Grid

| Lane | Agent Count | Skill Count | Coverage |
|---|---:|---:|---|
| Planning | 4 | 12 | Pass |
| Execution | 4 | 19 | Pass |
| Review | 7 | 16 | Pass |

## Standards Grid

| ID | Standard | Outcome | Evidence | Severity |
|---|---|---|---|---|
| GOV-M1 | Lane coverage | Pass | [evidence-2026-04-09.json](./evidence-2026-04-09.json) laneCounts includes Planning/Execution/Review for agents and skills | None |
| GOV-M2 | Frontmatter validity | Pass | [evidence-2026-04-09.json](./evidence-2026-04-09.json) frontmatter.agents/instructions/prompts all passed | None |
| GOV-M3 | Catalog integrity | Pass | [evidence-remediation-2026-04-09.json](./evidence-remediation-2026-04-09.json) skillsCatalog shows no missing or stale entries | None |
| GOV-M4 | Lifecycle-governance coverage | Pass | [planning-execution-review-governance.md](../../reference/planning-execution-review-governance.md), [agent-lifecycle-catalog.md](../../../.github/agents/agent-lifecycle-catalog.md), [instruction-lifecycle-catalog.md](../../../.github/instructions/instruction-lifecycle-catalog.md), [prompt-lifecycle-catalog.md](../../../.github/prompts/prompt-lifecycle-catalog.md), [skill-discovery-index.md](../../../.github/skills/skill-discovery-index.md) present | None |
| GOV-S1 | Traceability ID usage | Pass | Regex scan in `.docs/**/*.md` returned active `VIS-`, `PLAN-`, `WS-`, `DEC-`, `REV-` usage | None |
| GOV-S2 | ADR directory | Pass | [README.md](../../adr/README.md) and [INDEX.md](../../adr/INDEX.md) exist under `.docs/adr/` | None |
| GOV-S3 | Change history index | Pass | [INDEX.md](../../changes/INDEX.md) exists and `.docs/changes` is populated | None |
| GOV-S4 | Review cadence mechanism | Pass | [governance-cadence.yml](../../../.github/workflows/governance-cadence.yml) exists with monthly schedule and workflow-dispatch trigger; verified in [evidence-final-pass-2026-04-09.json](./evidence-final-pass-2026-04-09.json) | None |
| GOV-S5 | Taxonomy currency | Pass | [customization-taxonomy-v1.md](../../reference/customization-taxonomy-v1.md) exists and is referenced by active governance docs | None |
| GOV-S6 | No orphaned docs | Pass | [evidence-2026-04-09.json](./evidence-2026-04-09.json) linkGraph passed via `test-governance-link-graph.ps1` | None |
| GOV-S7 | Hub file freshness | Pass | [evidence-remediation-2026-04-09.json](./evidence-remediation-2026-04-09.json) hubSync passed and reports full preferred-list alignment | None |
| GOV-SK | Skill quality aggregate | Pass | [evidence-final-pass-2026-04-09.json](./evidence-final-pass-2026-04-09.json) and [20260409-full-skill-review-grid.md](../skill-reviews/20260409-full-skill-review-grid.md) show 0 MUST failures and 0 SHOULD advisories | None |
| GOV-CUS | Customization quality aggregate | Pass | [audit.md](../customization/reviews/audit.md) reports MUST Failures = 0, Open Conflicts = 0, disposition PASSED | None |

## Aggregate Metrics

| Metric | Value |
|---|---:|
| GOV-M Pass | 4 |
| GOV-M Fail | 0 |
| GOV-S Pass | 9 |
| GOV-S Advisory | 0 |
| Skill Review Fail | 0 |
| Customization Review Fail | 0 |
| Open Conflicts | 0 |

## Ranked Recommendations

| ID | Action | Fixes | Priority |
|---|---|---|---|
| R0 | No open remediation actions. Continue monthly cadence execution and evidence capture. | Sustained compliance | Low |

## Disposition

PASSED

Reason: All GOV-M and GOV-S checks passed with no open advisories.
