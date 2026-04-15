# Agent Review Report

## Metadata

- Review Date: 2026-04-15
- Reviewer Skill: agent-review
- Target Agent: csharp-engineer
- Target Path: .github/agents/csharp-engineer.agent.md
- Review Scope: Full

## Summary Outcome Grid

| Metric | Value |
|---|---|
| Overall Outcome | Fail |
| MUST Failures | 1 |
| SHOULD Advisories | 1 |
| Conflict Status | None |

## Standards Evaluation

| Standard ID | Result | Evidence | Notes |
|---|---|---|---|
| AGR-M1 | Pass | Scope is .NET engineering — writing, modifying, and improving code. | Broad but bounded to one specialist domain. |
| AGR-M2 | Pass | Valid frontmatter. `## Specialization` present. | Extension is `.agent.md`. |
| AGR-M3 | Pass | Third-person. "Expert C#/.NET engineering agent consolidating craftsmanship, modernization, and performance guidance." | Could be more explicit about when to invoke, but the role is clear. |
| AGR-M4 | Fail | No `## Hard Constraints` section. The agent has implicit constraints (stay in .NET domain) but no explicit prohibitions. | Add constraints: no architecture boundary decisions without `architecture-designer`, no standalone DBA work, no research-phase planning outputs. |
| AGR-S1 | Advisory | `## Specialization`, `## Focus Areas`, `## Standards`, and `## Preferred Companion Skills` all present. Only `## Hard Constraints` missing. | The body is otherwise the most complete in the workspace. |
| AGR-S2 | Pass | Companion skill references only. No hardcoded agent invocations. | Clean. |
| AGR-S3 | Pass | Clear lane boundary from planning and architecture agents. | No overlap risk. |
| AGR-S4 | Pass | No markdown links. | Nothing to validate. |
| AGR-S5 | Pass | Only `name` and `description`. No deprecated fields. | Platform currency confirmed 2026-04-15. |

## Platform Currency Check

- Source Catalog Consulted: Yes
- Sources Evaluated: 2
- Sources Needing Review: 0
- Deprecated Fields Found: None
- New Fields Applicable: No immediate need. `tools` is not useful here since full tool access is appropriate for an implementation agent.
- Recommendation: No platform-currency changes needed beyond Hard Constraints fix.

## Recommendations

| Recommendation ID | Description | Priority | Status |
|---|---|---|---|
| REC-001 | Add `## Hard Constraints` section: no architectural boundary decisions without `architecture-designer` involvement, no DBA work, no planning-only outputs when implementation is requested. | High | Proposed |

## History Guard Check

- History File Loaded: No (first review)
- Deny-list Entries Applied: 0
- Suppressed Repeat Recommendations: 0
- Notes: No prior history.

## Next Actions

1. Add `## Hard Constraints` section — sole MUST failure. Body is otherwise well-structured.
