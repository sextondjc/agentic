# Agent Review Report

## Metadata

- Review Date: 2026-04-15
- Reviewer Skill: agent-review
- Target Agent: workspace-scaffolder
- Target Path: .github/agents/workspace-scaffolder.agent.md
- Review Scope: Full

## Summary Outcome Grid

| Metric | Value |
|---|---|
| Overall Outcome | Fail |
| MUST Failures | 1 |
| SHOULD Advisories | 2 |
| Conflict Status | None |

## Standards Evaluation

| Standard ID | Result | Evidence | Notes |
|---|---|---|---|
| AGR-M1 | Pass | Scoped to project scaffolding and workspace configuration. "Does not write application code." | Clean boundary. |
| AGR-M2 | Pass | Valid frontmatter. `## Specialization` present. | Extension is `.agent.md`. |
| AGR-M3 | Pass | Third-person. Describes scaffolding role and explicit exclusion of application code. | Clear. |
| AGR-M4 | Fail | No `## Hard Constraints` section. Only implicit constraint noted in `## Specialization`. | Add: no application domain code, no production repository edits, questionnaire required before any output. |
| AGR-S1 | Advisory | `## Specialization` and `## Preferred Companion Skills` present. Missing `## Focus Areas` (has `## Core Principles`), `## Standards`, `## Hard Constraints`. | Three of five sections absent or non-canonically named. |
| AGR-S2 | Pass | No hardcoded agent invocations. Skills referenced only. | Clean. |
| AGR-S3 | Pass | Scaffolding lane is distinct from engineering and architecture agents. | No conflict. |
| AGR-S4 | Pass | No markdown links in body (the truncated view at end of file suggests possible content but no unresolved links were found in the read range). | Acceptable. |
| AGR-S5 | Pass | Only `name` and `description`. No deprecated fields. | Platform currency confirmed 2026-04-15. |

## Platform Currency Check

- Source Catalog Consulted: Yes
- Sources Evaluated: 2
- Sources Needing Review: 0
- Deprecated Fields Found: None
- New Fields Applicable: None required.
- Recommendation: No platform-currency changes needed.

## Recommendations

| Recommendation ID | Description | Priority | Status |
|---|---|---|---|
| REC-001 | Add `## Hard Constraints` section: no application domain code, no production repository edits, questionnaire required before any scaffolding output. | High | Proposed |
| REC-002 | Rename `## Core Principles` → `## Focus Areas` or add a canonical `## Focus Areas` section. | Low | Proposed |
| REC-003 | Add `## Standards` section referencing `governance-naming-conventions.instructions.md` and workspace scaffold conventions. | Low | Proposed |

## History Guard Check

- History File Loaded: No (first review)
- Deny-list Entries Applied: 0
- Suppressed Repeat Recommendations: 0
- Notes: No prior history.

## Next Actions

1. Add `## Hard Constraints` (MUST fix).
2. Add missing schema sections (advisory).
