# Governance Executive Audit

| Metric | Value |
|---|---|
| Audit Date | 2026-04-11 |
| Scope | Full workspace deep scan across agents, instructions, prompts, and skills |
| Fresh Evidence | [governance-health-overview.latest.json](./../../../../.artifacts/governance-health-overview.latest.json), [responsibility-overlap.routing.json](./../../../../.artifacts/responsibility-overlap.routing.json) |
| Prior Level 1 Report | [governance-executive-audit.md](./governance-executive-audit.md) |

## Report Navigation Grid

| Level | Artifact | Status | Link |
|---|---|---|---|
| Level 1 | Executive workspace disposition | Fresh | [governance-executive-audit.md](./governance-executive-audit.md) |
| Level 2 | Skill aggregate audit | Fresh | [governance-type-audit-skills.md](./../../skill/reviews/governance-type-audit-skills.md) |
| Level 2 | Governance aggregate audit | Fresh | [governance-audit.md](./governance-audit.md) |
| Level 2 | Customization aggregate audit | Fresh | [governance-type-audit-customizations.md](./../../customization/reviews/governance-type-audit-customizations.md) |
| Level 2 | Optimization aggregate audit | Fresh | [governance-type-audit-optimization.md](./../../customization/reviews/governance-type-audit-optimization.md) |
| Level 3 | Governance health overview skill review | Available | [review.md](./../../skill/reviews/governance-health-overview/review.md) |
| Level 3 | Skill-review skill review | Available | [review.md](./../../skill/reviews/skill-review/review.md) |
| Level 3 | Librarian skill review | Available | [review.md](./../../skill/reviews/librarian/review.md) |

## Coverage Grid

| Asset Type | Pattern | Count | Fresh Deep Scan | Fresh Type Artifact | Notes |
|---|---|---:|---|---|---|
| Agents | `.github/agents/*.agent.md` | 15 | Yes | Yes | Included in fresh customization and optimization Level 2 outputs |
| Instructions | `.github/instructions/*.instructions.md` | 17 | Yes | Yes | Included in fresh customization and optimization Level 2 outputs |
| Prompts | `.github/prompts/*.prompt.md` | 17 | Yes | Yes | Included in fresh optimization Level 2 output and core checks |
| Skills | `.github/skills/*/SKILL.md` | 51 | Yes | Yes | Fresh Level 2 skill aggregate available at [governance-type-audit-skills.md](./../../skill/reviews/governance-type-audit-skills.md) |
| Workspace Total | All required customization patterns | 100 | Yes | Yes | All 4 expected fresh aggregate artifacts are present |

## Standards Health Grid

| Standard | Status | Evidence | Notes |
|---|---|---|---|
| GOV-M1 | Pass | [governance-audit.md](./governance-audit.md) | Governance aggregate produced and lane coverage published |
| GOV-M2 | Pass | [governance-health-overview.latest.json](./../../../../.artifacts/governance-health-overview.latest.json) | Agents, prompts, and instructions frontmatter checks passed |
| GOV-M3 | Pass | [governance-health-overview.latest.json](./../../../../.artifacts/governance-health-overview.latest.json) | Catalog integrity passed for agents, prompts, and instructions |
| GOV-M4 | Pass | [governance-audit.md](./governance-audit.md) | Lifecycle-governance policy checks included in fresh aggregate output |
| GOV-S1 | Pass | [governance-audit.md](./governance-audit.md) | Governance aggregate is present and passing |
| GOV-S2 | Pass | [governance-type-audit-customizations.md](./../../customization/reviews/governance-type-audit-customizations.md) | Fresh customization aggregate present and passing |
| GOV-S3 | Pass | [governance-type-audit-skills.md](./../../skill/reviews/governance-type-audit-skills.md) | Fresh skill aggregate present |
| GOV-S4 | Pass | [governance-type-audit-optimization.md](./../../customization/reviews/governance-type-audit-optimization.md) | Fresh optimization aggregate present and passing |
| GOV-S5 | Pass | [governance-health-overview.latest.json](./../../../../.artifacts/governance-health-overview.latest.json) | Source-catalog freshness check passed |
| GOV-S6 | Pass | [governance-health-overview.latest.json](./../../../../.artifacts/governance-health-overview.latest.json) | Link graph validation passed |
| GOV-S7 | Pass | [governance-health-overview.latest.json](./../../../../.artifacts/governance-health-overview.latest.json) | Hub sync check passed |
| GOV-S8 | Pass | [governance-health-overview.latest.json](./../../../../.artifacts/governance-health-overview.latest.json) | Artifact contract check passed |
| GOV-S9 | Pass | [governance-health-overview.latest.json](./../../../../.artifacts/governance-health-overview.latest.json) | Utilization coverage passed for all indexed skills |
| GOV-S10 | Pass | [governance-health-overview.latest.json](./../../../../.artifacts/governance-health-overview.latest.json) | Review recency passed for tracked assets |
| GOV-S11 | Pass | [responsibility-overlap.routing.json](./../../../../.artifacts/responsibility-overlap.routing.json) | Responsibility overlap is within threshold: 1 duplicate pair of 8 allowed |
| GOV-SK | Pass With Advisories | [governance-type-audit-skills.md](./../../skill/reviews/governance-type-audit-skills.md) | 52 skills reviewed, 0 MUST failures, 2 pass-with-advisories outcomes |
| GOV-CUS | Pass | [governance-type-audit-customizations.md](./../../customization/reviews/governance-type-audit-customizations.md) | Customization aggregate present with 0 missing specialization/applyTo and 0 conflicts |
| GOV-OPT | Pass | [governance-type-audit-optimization.md](./../../customization/reviews/governance-type-audit-optimization.md) | Optimization aggregate present with 0 MUST failures |

## Aggregate Metrics Grid

| Metric | Value |
|---|---|
| Total Script Checks | 16 |
| Passed Script Checks | 16 |
| Failed Script Checks | 0 |
| Failed Check Names | None |
| Agents | 15 |
| Instructions | 17 |
| Prompts | 17 |
| Skills | 51 |
| Asset Total | 100 |
| Fresh Aggregate Artifacts Found | 4 of 4 |
| Open Conflicts | 0 |
| Duplicate Responsibility Pairs | 1 |
| Responsibility Pair Threshold | 8 |
| Docs Corpus Files | 194 |
| Docs Markdown Files | 194 |
| Docs Redundancy Candidate Groups | 3 |
| Docs Stale Candidates | 0 |
| Broken Links | 0 |
| Missing Agent Specialization Sections | 0 |
| Missing Instruction `applyTo` Values | 0 |

## Failure Detail Grid

| ID | Severity | Failure | Evidence | Impact |
|---|---|---|---|---|
| F-000 | None | No current governance failures | [governance-health-overview.latest.json](./../../../../.artifacts/governance-health-overview.latest.json) | All script checks passed and all required aggregates are present |

## Delta vs Prior Report Grid

| Metric | Prior | Current | Delta | Trend |
|---|---|---:|---|---|
| Total Script Checks | 16 | 16 | 0 | Flat |
| Passed Script Checks | 15 | 16 | +1 | Increase |
| Failed Script Checks | 1 | 0 | -1 | Decrease |
| Asset Total | 100 | 100 | 0 | Flat |
| Open Conflicts | 0 | 0 | 0 | Flat |
| Broken Links | 132 | 0 | -132 | Decrease |
| Duplicate Responsibility Pairs | 1 | 1 | 0 | Flat |
| Docs Corpus Files | 98 | 194 | +96 | Increase |
| Docs Redundancy Candidate Groups | 2 | 3 | +1 | Increase |
| Fresh Aggregate Artifacts Found | 1 of 4 | 4 of 4 | +3 | Increase |

## Docs Corpus Hygiene Grid

| Check | Status | Current State | Evidence | Notes |
|---|---|---|---|---|
| Documentation root structure | Pass | `.docs` contains `adr`, `changes`, and `plans` | [governance-health-overview.latest.json](./../../../../.artifacts/governance-health-overview.latest.json) | Structure remains coherent at the top level |
| Naming conformance | Pass | 0 naming violations in `.docs` | [governance-health-overview.latest.json](./../../../../.artifacts/governance-health-overview.latest.json) | `docs-naming` check passed |
| Index coverage | Pass | 76 `INDEX.md` files refreshed in `.docs` | [governance-health-overview.latest.json](./../../../../.artifacts/governance-health-overview.latest.json) | Index refresh now runs in the governance workflow |
| Link integrity | Pass | 0 broken links across 1189 checked links | [governance-health-overview.latest.json](./../../../../.artifacts/governance-health-overview.latest.json) | Recurring link failures were remediated and now validate cleanly |
| Redundancy candidates | Advisory | 3 duplicate filename groups: `history.md`, `INDEX.md`, `review.md` | [governance-health-overview.latest.json](./../../../../.artifacts/governance-health-overview.latest.json) | Repetition remains largely structural and expected for indexed reviews |
| Stale candidates | Pass | 0 stale markdown candidates older than 180 days | [governance-health-overview.latest.json](./../../../../.artifacts/governance-health-overview.latest.json) | No stale corpus candidates surfaced in the fresh run |
| Confirmation gate | Pass | Changes were deterministic and tied to ranked recommendations | [governance-executive-audit.md](./governance-executive-audit.md) | No unmanaged drift introduced by this closure pass |

## Ranked Recommendations Grid

| Rank | Priority | Recommendation | Evidence | Expected Outcome |
|---|---:|---|---|---|
| 1 | 1 | Emit all required fresh Level 2 artifacts in the same governance-health-overview invocation. | [governance-audit.md](./governance-audit.md), [governance-type-audit-customizations.md](./../../customization/reviews/governance-type-audit-customizations.md), [governance-type-audit-optimization.md](./../../customization/reviews/governance-type-audit-optimization.md) | Completed: all required aggregate artifacts are now present in each run |
| 2 | 2 | Resolve the broken link graph and rerun link validation. | [governance-health-overview.latest.json](./../../../../.artifacts/governance-health-overview.latest.json) | Completed: link graph now passes with 0 broken links |
| 3 | 3 | Run librarian-follow-up index refresh after corpus changes. | [governance-health-overview.latest.json](./../../../../.artifacts/governance-health-overview.latest.json) | Completed: index refresh is integrated into governance workflow and executed |
| 4 | 4 | Keep explicit rationale for intentional global `applyTo: '**'` instruction scope. | [request-economy.instructions.md](./../../../../.github/instructions/request-economy.instructions.md), [security-and-secure-coding.instructions.md](./../../../../.github/instructions/security-and-secure-coding.instructions.md) | Completed: explicit global scope rationale added to both instruction files |

## Final Disposition

`PASSED`

All ranked recommendations from the prior report were implemented and validated in a fresh deep-scan run. Core checks are fully passing, required aggregate artifacts are present, and documentation link integrity is now passing.