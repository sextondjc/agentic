# Governance Executive Audit

<!-- Audit Date: 2026-04-18 | Run Mode: fresh-run | Segments: 4 of 4 | Disposition: FAILED | Revision: 2 -->

## Report Navigation Grid (Level 1 -> Level 2 -> Level 3)

| Level | Artifact | Status | Link |
|---|---|---|---|
| Level 1 | Executive workspace disposition | Fresh — 2026-04-18 (Revision 2) | [governance-executive-audit.md](./governance-executive-audit.md) |
| Level 2 | Governance aggregate audit | Fresh — 2026-04-18 | [governance-audit.md](./governance-audit.md) |
| Level 2 | Skill aggregate audit | Fresh — 2026-04-18 | [governance-audit-types-skills.md](./../../skill/reviews/governance-audit-types-skills.md) |
| Level 2 | Customization aggregate audit | Fresh — 2026-04-18 | [governance-audit-types-customizations.md](./../../customization/reviews/governance-audit-types-customizations.md) |
| Level 2 | Optimization aggregate audit | Fresh — 2026-04-18 | [governance-audit-types-optimization.md](./../../customization/reviews/governance-audit-types-optimization.md) |
| Level 3 | Governance health overview skill review | Available | [review.md](./../../skill/reviews/governance-health-overview/review.md) |
| Level 3 | Skill-review skill review | Available | [review.md](./../../skill/reviews/skill-review/review.md) |
| Level 3 | Librarian skill review | Available | [review.md](./../../skill/reviews/librarian/review.md) |

## Coverage Grid

| Asset Type | Pattern | Count | Fresh Deep Scan | Coverage Status | Notes |
|---|---|---:|---|---|---|
| Agents | `.github/agents/*.agent.md` | 18 | Yes | Complete | Included in fresh-run governance synthesis (flat vs prior exec audit) |
| Instructions | `.github/instructions/*.instructions.md` | 21 | Yes | Complete | Included in fresh-run governance synthesis (flat vs prior exec audit) |
| Prompts | `.github/prompts/*.prompt.md` | 19 | Yes | Complete | Included in fresh-run governance synthesis (flat vs prior exec audit) |
| Skills | `.github/skills/*/SKILL.md` | 69 | Yes | Complete | Included in fresh-run governance synthesis (+1 vs prior exec audit) |
| Workspace Total | All mandatory patterns | 126 | Yes | Complete | Per optimization audit; skills audit arithmetic yields 127 — 1-asset discrepancy noted |

## Standards Health Grid

| Standard | Status | Evidence | Notes |
|---|---|---|---|
| GOV-M1 | Pass | [governance-audit.md](./governance-audit.md) | Lane coverage verified: Execution 6, Planning 5, Review 7 |
| GOV-M2 | **Fail** | [test-frontmatter-validity.ps1](./../../../../.github/scripts/powershell/test-frontmatter-validity.ps1) | frontmatter-agents: 15 agents missing frontmatter delimiters; 3 with unknown key 'handoffs' — ongoing from prior run |
| GOV-M3 | **Fail** | [test-catalog-integrity.ps1](./../../../../.github/scripts/powershell/test-catalog-integrity.ps1) | catalog-agents: script path bug; catalog-instructions: 3 missing (mobile-frontend, ux-design, web-frontend) — ongoing from prior run |
| GOV-M4 | Pass | [governance-lifecycle.instructions.md](./../../../../.github/instructions/governance-lifecycle.instructions.md) | Lifecycle governance policy present and covered in instruction scans |
| GOV-M5 | **Fail** | [governance-audit.md](./governance-audit.md) | artifact-reference-hygiene: new failure in this run; artifact reference hygiene check failing across docs corpus |
| GOV-M6 | **Fail** | [test-governance-must-traceability.ps1](./../../../../.github/scripts/powershell/test-governance-must-traceability.ps1) | must-finding-traceability: trust guard now failing — new regression; MUST finding traceability check reports violations |
| GOV-S1 | **Fail** | [governance-audit.md](./governance-audit.md) | 11 script checks failing: catalog-agents, catalog-instructions, frontmatter-agents, frontmatter-prompts*, frontmatter-instructions*, hub-sync, link-graph, artifact-reference-hygiene, docs-naming, index-refresh*, must-finding-traceability (* 3 likely false positives) |
| GOV-S2 | Pass | [governance-audit-types-customizations.md](./../../customization/reviews/governance-audit-types-customizations.md) | Customization aggregate pass (0 missing specialization, 0 missing applyTo, 0 open conflicts) |
| GOV-S3 | Pass With Advisories | [governance-audit-types-skills.md](./../../skill/reviews/governance-audit-types-skills.md) | Skill advisories present; 0 MUST failures, 22 SHOULD advisories (flat vs prior exec audit) |
| GOV-S4 | Pass With Advisories | [governance-audit-types-optimization.md](./../../customization/reviews/governance-audit-types-optimization.md) | 0 MUST failures, 11 SHOULD advisories (+2 vs prior exec audit — maps to 11 failing governance checks) |
| GOV-SK | Pass With Advisories | [governance-audit-types-skills.md](./../../skill/reviews/governance-audit-types-skills.md) | 0 MUST failures, 22 SHOULD advisories (17 skills Pass With Advisories, 52 Pass, 0 Fail) — flat vs prior exec audit |
| GOV-CUS | Pass | [governance-audit-types-customizations.md](./../../customization/reviews/governance-audit-types-customizations.md) | No open customization conflicts; all agents and instructions structurally valid |
| GOV-OPT | Pass With Advisories | [governance-audit-types-optimization.md](./../../customization/reviews/governance-audit-types-optimization.md) | 0 MUST failures, 11 SHOULD advisories from failing script checks (+2 vs prior exec audit) |

## Aggregate Metrics Grid

| Metric | Value |
|---|---|
| Review Date | 2026-04-18 |
| Revision | 2 |
| Total Script Checks | 22 |
| Passed Script Checks | 11 |
| Failed Script Checks | 11 |
| Failed Check Names | catalog-agents, catalog-instructions, frontmatter-agents, frontmatter-prompts, frontmatter-instructions, hub-sync, link-graph, artifact-reference-hygiene, docs-naming, index-refresh, must-finding-traceability |
| New Failures vs Prior Exec Audit | artifact-reference-hygiene, must-finding-traceability |
| Likely False Positives (exit code bugs) | frontmatter-prompts, frontmatter-instructions, index-refresh |
| Confirmed Real Failures | catalog-agents, catalog-instructions, frontmatter-agents, hub-sync, link-graph, artifact-reference-hygiene, docs-naming, must-finding-traceability |
| Agents | 18 |
| Instructions | 21 |
| Prompts | 19 |
| Skills | 69 |
| Asset Total | 126 (per optimization audit; skills arithmetic yields 127 — 1-asset discrepancy) |
| Overlap Duplicate Pairs | 2 (carried from prior exec audit — not freshly reported) |
| Overlap Threshold | 8 |
| Overlap Threshold Breached | No |
| Skill Aggregate Outcome | Pass With Advisories |
| Skill Aggregate MUST Failures | 0 |
| Skill Aggregate SHOULD Advisories | 22 |
| Customization Aggregate Outcome | Pass |
| Open Conflicts | 0 |
| Optimization Aggregate Outcome | Pass With Advisories |
| Optimization Aggregate MUST Failures | 0 |
| Optimization Aggregate SHOULD Advisories | 11 |
| Trust Guard | **Failing** (`must-finding-traceability` — new regression in this run) |

## Failure Detail Grid

| ID | Type | Severity | Check | Asset | Evidence | Failure Description |
|---|---|---|---|---|---|---|
| F-001 | Infrastructure | MUST (GOV-M3) | catalog-agents | agent-lifecycle-catalog.md | [governance-health-overview.summary.md](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.summary.md), [governance-health-overview.latest.json](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json) | CoreChecks entry `catalog-agents` shows path resolution failure for `.github/agents/agent-lifecycle-catalog.md` (missing file). |
| F-002 | Coverage | MUST (GOV-M3) | catalog-instructions | instruction-lifecycle-catalog.md | [governance-health-overview.summary.md](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.summary.md), [governance-health-overview.latest.json](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json) | CoreChecks entry `catalog-instructions` reports 3 missing catalog entries: `mobile-frontend.instructions.md`, `ux-design.instructions.md`, `web-frontend.instructions.md`. |
| F-003 | Quality | MUST (GOV-M2) | frontmatter-agents | 15+ agent files | [governance-health-overview.summary.md](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.summary.md), [governance-health-overview.latest.json](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json) | CoreChecks entry `frontmatter-agents` lists missing YAML frontmatter delimiters and unknown key `handoffs` for 3 agent files. |
| F-004 | Coverage | SHOULD (GOV-S1) | hub-sync | instruction-lifecycle-catalog.md | [governance-health-overview.summary.md](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.summary.md), [governance-health-overview.latest.json](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json) | CoreChecks entry `hub-sync` includes the same 3 missing instruction catalog items. |
| F-005 | Integrity | SHOULD (GOV-S1) | link-graph | Multiple docs files | [governance-health-overview.summary.md](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.summary.md), [governance-health-overview.latest.json](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json) | CoreChecks entry `link-graph` contains the broken link payload (`BrokenLinks: 100`) and detailed issue list by source/target. |
| F-006 | Naming | SHOULD (GOV-S1) | docs-naming | .docs/changes/agent/reviews/ | [governance-health-overview.summary.md](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.summary.md), [governance-health-overview.latest.json](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json) | CoreChecks entry `docs-naming` records the 14 naming violations in output text. |
| F-007 | False Positive | Advisory | frontmatter-prompts | All prompt files | [governance-health-overview.summary.md](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.summary.md), [governance-health-overview.latest.json](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json) | CoreChecks entry `frontmatter-prompts` shows success message in Output with non-zero ExitCode (false positive). |
| F-008 | False Positive | Advisory | frontmatter-instructions | All instruction files | [governance-health-overview.summary.md](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.summary.md), [governance-health-overview.latest.json](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json) | CoreChecks entry `frontmatter-instructions` shows success message in Output with non-zero ExitCode (false positive). |
| F-009 | False Positive | Advisory | index-refresh | .docs corpus | [governance-health-overview.summary.md](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.summary.md), [governance-health-overview.latest.json](./../../../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json) | CoreChecks entry `index-refresh` shows index counts in Output with non-zero ExitCode (false positive). |
| F-010 | Integrity | MUST (GOV-M5) | artifact-reference-hygiene | docs corpus | [governance-audit.md](./governance-audit.md) | New failure in this run. `artifact-reference-hygiene` check failing — artifact cross-references in docs corpus contain invalid or broken references. |
| F-011 | Trust Guard | MUST (GOV-M6) | must-finding-traceability | governance artifacts | [test-governance-must-traceability.ps1](./../../../../.github/scripts/powershell/test-governance-must-traceability.ps1), [governance-audit.md](./governance-audit.md) | New regression in this run. Trust guard `must-finding-traceability` is now failing — MUST findings in executive report are not fully traceable to canonical check IDs and script-backed evidence. |

## Delta vs Prior Report Grid

<!-- Prior = previous executive audit current values (2026-04-18 Revision 1). Current = today's source audit values. -->

| Metric | Prior | Current | Delta | Trend |
|---|---:|---:|---:|---|
| Asset Total | 126 | 126 | 0 | Flat |
| Agents | 18 | 18 | 0 | Flat |
| Instructions | 21 | 21 | 0 | Flat |
| Prompts | 19 | 19 | 0 | Flat |
| Skills | 68 | 69 | +1 | Increase |
| Total Script Checks | 22 | 22 | 0 | Flat |
| Passed Script Checks | 13 | 11 | -2 | Decrease |
| Failed Script Checks | 9 | 11 | +2 | Increase |
| Skill MUST Failures | 0 | 0 | 0 | Flat |
| Skill SHOULD Advisories | 22 | 22 | 0 | Flat |
| Optimization MUST Failures | 0 | 0 | 0 | Flat |
| Optimization SHOULD Advisories | 9 | 11 | +2 | Increase |
| Open Conflicts | 0 | 0 | 0 | Flat |
| Overlap Duplicate Pairs | 2 | 2 | 0 | Flat |
| Docs Corpus Markdown Files | 288 | Not freshly reported | — | — |
| Docs Redundancy Candidate Groups | 4 | Not freshly reported | — | — |
| Broken Links | 100 | Not freshly reported | — | — |

## Docs Corpus Hygiene Grid

<!-- Source: .docs folder inspection + prior run corpus metrics. Corpus size metrics not freshly reported in current source audits; carried from prior exec audit run. -->

| Check | Status | Current State | Evidence | Notes |
|---|---|---|---|---|
| Documentation root structure | Pass | `.docs` root hierarchy: `adr/`, `archive/`, `changes/`, `plans/` + `INDEX.md` | [governance-audit.md](./governance-audit.md) | Structure verified by direct folder inspection this run. Corpus size (288 md files) carried from prior run — not freshly reported. |
| Naming conformance | **Fail** | 14 violations — agent review subfolders flagged as non-conformant | [test-naming-conformance.ps1](./../../../../.github/scripts/powershell/test-naming-conformance.ps1) | All violations are hyphenated agent name folders (e.g. `changes/agent/reviews/architecture-designer`). Investigate whether naming check rule is over-strict for hyphened agent names. |
| Index coverage | Advisory | Indexes regenerated but script exits non-zero (likely exit-code bug) | [invoke-index-refresh.ps1](./../../../../.github/scripts/powershell/invoke-index-refresh.ps1) | Output confirms 124 folders indexed, 164 documents indexed. Script exit code bug reported as failure; functional result is pass. |
| Link integrity | **Fail** | 100 broken links across 648 checked files | [test-governance-link-graph.ps1](./../../../../.github/scripts/powershell/test-governance-link-graph.ps1) | Primary sources: `taxonomy-review.md` (18), `skill-review/references/history/*.md` (72+), `orchestrator/review.md`, `benchmark-researcher/review.md`, `matrix-skill-mapping` references, `skill-discovery-index.md`. |
| Redundancy candidates | Pass | 4 groups — all structural/expected patterns | [governance-audit.md](./governance-audit.md) | `history.md` ×50, `INDEX.md` ×124, `review.md` ×98, `README.md` ×2 — all intentional repeated-name patterns. |
| Stale candidates | Pass | 0 files older than 180 days | [governance-audit.md](./governance-audit.md) | No stale documentation candidates detected. |

## Ranked Recommendations Grid

| Rank | Priority | Recommendation | Evidence | Expected Outcome |
|---|---:|---|---|---|
| 1 | 1 | Resolve trust guard regression: fix `must-finding-traceability` failure by ensuring all MUST findings in the executive report are traceable to canonical check IDs with script-backed evidence. | [test-governance-must-traceability.ps1](./../../../../.github/scripts/powershell/test-governance-must-traceability.ps1), [governance-must-check-registry.json](./../../../../.github/scripts/powershell/governance-must-check-registry.json) | Restore trust guard to passing state and unblock clean disposition |
| 2 | 1 | Investigate and resolve `artifact-reference-hygiene` failure — identify artifact references in the docs corpus that are invalid or broken and remediate. | [governance-audit.md](./governance-audit.md) | Close new MUST failure F-010 |
| 3 | 2 | Address ongoing MUST failures: catalog-agents (script path bug), catalog-instructions (3 missing entries: mobile-frontend, ux-design, web-frontend), frontmatter-agents (15+ agents missing delimiters; handoffs key). | [governance-audit.md](./governance-audit.md) | Close F-001, F-002, F-003 |
| 4 | 2 | Address SHOULD failures: hub-sync, link-graph (100 broken links), docs-naming (14 violations). | [governance-audit.md](./governance-audit.md) | Close F-004, F-005, F-006 |
| 5 | 3 | Continue full fresh governance invocations for each remediation cycle to preserve Level 1/2/3 alignment. | [invoke-governance-health-overview.ps1](./../../../../.github/scripts/powershell/invoke-governance-health-overview.ps1) | Consistent cross-level freshness and traceability |
## Final Disposition

`FAILED`

Rationale:

- Full 4-of-4 source audit synthesis completed (Revision 2 of 2026-04-18 executive audit).
- 11 script checks failed (up from 9 in Revision 1) — a regression of 2 additional checks.
- **New regression (F-011):** GOV-M6 failing — `must-finding-traceability` trust guard is now failing. This is the highest-priority finding as it directly blocks governance trust; all MUST findings must be traceable to canonical check IDs with script-backed evidence.
- **New failure (F-010):** GOV-M5 failing — `artifact-reference-hygiene` now failing across the docs corpus.
- GOV-M2 ongoing: `frontmatter-agents` — 15+ agents missing valid YAML frontmatter delimiters; 3 agents contain unknown `handoffs` key.
- GOV-M3 ongoing: `catalog-agents` (script path bug) and `catalog-instructions` (3 instructions not yet catalogued: mobile-frontend, ux-design, web-frontend).
- 3 false-positive failures remain noted (F-007, F-008, F-009) and do not reflect genuine quality regressions.
- Skills grew by 1 to 69 total; asset base flat at 126; no open conflicts; skill and customization aggregate quality remain strong (0 MUST failures across both).
- Optimization SHOULD advisories increased from 9 to 11 — consistent with the 2 additional failing script checks.
- Disposition will return to `PASSED` when F-010 and F-011 are resolved, and ongoing F-001 through F-006 are remediated.




