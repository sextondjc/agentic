# Governance Executive Audit

## Report Navigation Grid (Level 1 -> Level 2 -> Level 3)

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

| Asset Type | Pattern | Count | Fresh Deep Scan | Coverage Status | Notes |
|---|---|---:|---|---|---|
| Agents | `.github/agents/*.agent.md` | 15 | Yes | Complete | Included in fresh-run governance synthesis |
| Instructions | `.github/instructions/*.instructions.md` | 17 | Yes | Complete | Included in fresh-run governance synthesis |
| Prompts | `.github/prompts/*.prompt.md` | 18 | Yes | Complete | Included in fresh-run governance synthesis |
| Skills | `.github/skills/*/SKILL.md` | 53 | Yes | Complete | Included in fresh-run governance synthesis |
| Workspace Total | All mandatory patterns | 103 | Yes | Complete | Full-scope deep scan satisfied |

## Standards Health Grid

| Standard | Status | Evidence | Notes |
|---|---|---|---|
| GOV-M1 | Pass | [governance-audit.md](./governance-audit.md) | Governance aggregate produced in fresh run |
| GOV-M2 | Pass | [governance-health-overview.latest.json](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json) | Frontmatter checks passed for agents/prompts/instructions |
| GOV-M3 | Pass | [governance-health-overview.latest.json](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json) | Catalog integrity checks passed |
| GOV-M4 | Pass | [governance-audit.md](./governance-audit.md) | Lifecycle governance checks included |
| GOV-S1 | Pass | [governance-audit.md](./governance-audit.md) | Core governance checks all passing |
| GOV-S2 | Pass | [governance-type-audit-customizations.md](./../../customization/reviews/governance-type-audit-customizations.md) | Customization aggregate present |
| GOV-S3 | Pass | [governance-type-audit-skills.md](./../../skill/reviews/governance-type-audit-skills.md) | Skill aggregate present |
| GOV-S4 | Pass | [governance-type-audit-optimization.md](./../../customization/reviews/governance-type-audit-optimization.md) | Optimization aggregate present |
| GOV-S5 | Pass | [governance-health-overview.latest.json](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json) | Source-catalog freshness passed |
| GOV-S6 | Pass | [governance-health-overview.latest.json](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json) | Link graph passed |
| GOV-S7 | Pass | [governance-health-overview.latest.json](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json) | Hub sync passed |
| GOV-S8 | Pass | [governance-health-overview.latest.json](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json) | Artifact contract passed |
| GOV-S9 | Pass | [governance-health-overview.latest.json](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json) | Utilization coverage passed |
| GOV-S10 | Pass | [governance-health-overview.latest.json](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json) | Review recency passed |
| GOV-S11 | Pass | [responsibility-overlap.routing.json](./../../../../.github/skills/governance-health-overview/references/.artifacts/responsibility-overlap.routing.json) | Responsibility overlap within threshold (1/8) |
| GOV-SK | Pass With Advisories | [governance-type-audit-skills.md](./../../skill/reviews/governance-type-audit-skills.md) | Aggregate skill review emitted with advisories |
| GOV-CUS | Pass | [governance-type-audit-customizations.md](./../../customization/reviews/governance-type-audit-customizations.md) | No open customization conflicts |
| GOV-OPT | Pass | [governance-type-audit-optimization.md](./../../customization/reviews/governance-type-audit-optimization.md) | No optimization MUST failures |

## Aggregate Metrics Grid

| Metric | Value |
|---|---|
| Total Script Checks | 17 |
| Passed Script Checks | 17 |
| Failed Script Checks | 0 |
| Failed Check Names | None |
| Agents | 15 |
| Instructions | 17 |
| Prompts | 18 |
| Skills | 53 |
| Asset Total | 103 |
| Fresh Aggregate Artifacts Found | 4 of 4 |
| Open Conflicts | 0 |
| Duplicate Responsibility Pairs | 1 |
| Responsibility Pair Threshold | 8 |
| Docs Corpus Files | 198 |
| Docs Markdown Files | 198 |
| Docs Redundancy Candidate Groups | 3 |
| Docs Stale Candidates | 0 |
| Broken Links | 0 |
| Missing Agent Specialization Sections | 0 |
| Missing Instruction `applyTo` Values | 0 |

## Failure Detail Grid

| ID | Severity | Failure | Evidence | Impact |
|---|---|---|---|---|
| F-000 | None | No current governance failures | [governance-health-overview.latest.json](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json) | All checks passed and all required Level 2 artifacts are present |

## Delta vs Prior Report Grid (Metric, Prior, Current, Delta, Trend)

| Metric | Prior | Current | Delta | Trend |
|---|---|---:|---|---|
| Total Script Checks | 16 | 17 | +1 | Increase |
| Passed Script Checks | 16 | 17 | +1 | Increase |
| Failed Script Checks | N/A | 0 | N/A | Flat |
| Asset Total | 100 | 103 | +3 | Increase |
| Open Conflicts | 0 | 0 | 0 | Flat |
| Docs Corpus Files | N/A | 198 | N/A | Unknown |
| Docs Redundancy Candidate Groups | N/A | 3 | N/A | Unknown |
| Duplicate Responsibility Pairs | 1 | 1 | 0 | Flat |

## Docs Corpus Hygiene Grid

| Check | Status | Current State | Evidence | Notes |
|---|---|---|---|---|
| Documentation root structure | Pass | `.docs` root healthy for governance artifacts | [governance-health-overview.latest.json](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json) | Companion librarian checks included in fresh run |
| Naming conformance | Pass | 0 naming violations in `.docs` | [governance-health-overview.latest.json](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json) | `docs-naming` passed |
| Index coverage | Pass | 78 folders indexed, 122 documents indexed | [governance-health-overview.latest.json](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json) | Index refresh executed during run |
| Link integrity | Pass | 0 broken links | [governance-health-overview.latest.json](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json) | Link graph check passed |
| Redundancy candidates | Advisory | 3 duplicate filename groups (`history.md`, `INDEX.md`, `review.md`) | [governance-health-overview.latest.json](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json) | Structural duplication only |
| Stale candidates | Pass | 0 stale markdown candidates | [governance-health-overview.latest.json](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json) | No stale files beyond threshold |

## Ranked Recommendations Grid

| Rank | Priority | Recommendation | Evidence | Expected Outcome |
|---|---:|---|---|---|
| 1 | 1 | Normalize generated artifact counts so governance metrics remain aligned for prompts/skills totals across all generated artifacts. | [governance-health-overview.latest.json](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json), [invoke-governance-health-overview.ps1](./../../../../.github/scripts/powershell/invoke-governance-health-overview.ps1) | Single-source metrics consistency across artifacts |
| 2 | 2 | Keep librarian companion checks (link-graph, docs naming, index refresh) in every governance-health-overview invocation. | [librarian.prompt.md](./../../../../.github/prompts/librarian.prompt.md), [invoke-governance-health-overview.ps1](./../../../../.github/scripts/powershell/invoke-governance-health-overview.ps1) | Sustained docs hygiene and navigation integrity |
| 3 | 3 | Monitor the known high-overlap pair (`performance-research` vs `security-research`) to keep specialization boundaries explicit. | [responsibility-overlap.routing.json](./../../../../.github/skills/governance-health-overview/references/.artifacts/responsibility-overlap.routing.json) | Prevent overlap growth beyond threshold |
| 4 | 4 | Preserve explicit rationale for intentional global `applyTo: '**'` instruction scopes. | [request-economy.instructions.md](./../../../../.github/instructions/request-economy.instructions.md), [security-and-secure-coding.instructions.md](./../../../../.github/instructions/security-and-secure-coding.instructions.md) | Reduced false-positive governance warnings |

## Final Disposition (PASSED/FAILED/PROVISIONAL-FAILED)

`PASSED`
