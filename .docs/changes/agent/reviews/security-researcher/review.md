# Agent Review Report

## Metadata

- Review Date: 2026-04-15
- Reviewer Skill: agent-review
- Target Agent: security-researcher
- Target Path: .github/agents/security-researcher.agent.md
- Review Scope: Full

## Summary Outcome Grid

| Metric | Value |
|---|---|
| Overall Outcome | Pass With Advisories |
| MUST Failures | 0 |
| SHOULD Advisories | 2 |
| Conflict Status | None |

## Standards Evaluation

| Standard ID | Result | Evidence | Notes |
|---|---|---|---|
| AGR-M1 | Pass | Scoped to .NET/C# security research and reporting. "You do nothing else." | Tight boundary. |
| AGR-M2 | Pass | Valid frontmatter. `## Specialization` present. | Extension is `.agent.md`. |
| AGR-M3 | Pass | Third-person. Clearly names role and excludes implementation. | Invocation context and exclusion both stated. |
| AGR-M4 | Pass | `## Hard Boundaries` present with five explicit prohibitions. | Functionally equivalent to `## Hard Constraints`. Section name is non-canonical — see AGR-S1. |
| AGR-S1 | Advisory | `## Hard Boundaries` present (not `## Hard Constraints`). Missing `## Focus Areas` and `## Standards`. `## Preferred Companion Skills` present. | Rename and add missing sections. Mirrors `performance-assessor` gap pattern. |
| AGR-S2 | Pass | Collaboration model names agents as hand-off targets. Not delegation directives. | Acceptable — same pattern as `performance-assessor`. |
| AGR-S3 | Pass | Distinct from engineering and debugging agents. | No overlap. |
| AGR-S4 | Pass | No markdown links. | Nothing to validate. |
| AGR-S5 | Pass | Only `name` and `description`. No deprecated fields. | Platform currency confirmed 2026-04-15. `tools` restriction advisory: same recommendation as `performance-assessor`. |

## Platform Currency Check

- Source Catalog Consulted: Yes
- Sources Evaluated: 2
- Sources Needing Review: 0
- Deprecated Fields Found: None
- New Fields Applicable: `tools` restriction to read/search tools would platform-enforce "no production code edits" alongside hard boundaries.
- Recommendation: Advisory — add `tools` restriction to reinforce research-only posture at platform level.

## Recommendations

| Recommendation ID | Description | Priority | Status |
|---|---|---|---|
| REC-001 | Rename `## Hard Boundaries` → `## Hard Constraints` for canonical section schema alignment. | Medium | Proposed |
| REC-002 | Add `## Focus Areas` and `## Standards` sections. | Low | Proposed |
| REC-003 | Consider adding `tools` restriction to platform-enforce read-only research posture. | Low | Proposed |

## History Guard Check

- History File Loaded: No (first review)
- Deny-list Entries Applied: 0
- Suppressed Repeat Recommendations: 0
- Notes: No prior history.

## Next Actions

1. Rename section and add missing schema sections (advisory — no MUST failures).
