# Agent Review Report

## Metadata

- Review Date: 2026-04-15
- Reviewer Skill: agent-review
- Target Agent: code-reviewer
- Target Path: .github/agents/code-reviewer.agent.md
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
| AGR-M1 | Pass | Scope is singular: review completed implementation work. | No scope bleed. |
| AGR-M2 | Pass | Valid frontmatter. `## Specialization` present. | Extension is `.agent.md`. |
| AGR-M3 | Pass | Description is third-person, clearly states what the agent does and the output contract (severity-ranked findings). | Invocation context implicit from "completed implementation steps." |
| AGR-M4 | Fail | No `## Hard Constraints` section. The body defines scope but not explicit prohibitions. | Add constraints: no implementation of fixes, no plan authoring, no production code changes during review. |
| AGR-S1 | Advisory | Missing `## Focus Areas` (partially covered by `## Review Scope`), `## Standards` (partially covered by `## Standards Source`). `## Hard Constraints` absent. | The existing sections are semantically close but not schema-compliant. Rename `## Review Scope` → `## Focus Areas`, promote standards note to `## Standards` section. |
| AGR-S2 | Pass | No hardcoded agent invocations. | Clean. |
| AGR-S3 | Pass | No overlap with other agents. | Code review is a distinct lane. |
| AGR-S4 | Pass | No markdown links. | Nothing to validate. |
| AGR-S5 | Pass | Only `name` and `description`. No deprecated fields. | Platform currency confirmed 2026-04-15. |

## Platform Currency Check

- Source Catalog Consulted: Yes
- Sources Evaluated: 2
- Sources Needing Review: 0
- Deprecated Fields Found: None
- New Fields Applicable: `tools` restriction (read-only tools) would platform-enforce the review-only posture.
- Recommendation: Advisory — add `tools` if an explicit read-only posture is desired.

## Recommendations

| Recommendation ID | Description | Priority | Status |
|---|---|---|---|
| REC-001 | Add `## Hard Constraints` section defining no code implementation, no plan production, review findings output only. | High | Proposed |
| REC-002 | Rename `## Review Scope` → `## Focus Areas` for schema compliance. | Low | Proposed |
| REC-003 | Expand standards note to a full `## Standards` section. | Low | Proposed |

## History Guard Check

- History File Loaded: No (first review)
- Deny-list Entries Applied: 0
- Suppressed Repeat Recommendations: 0
- Notes: No prior history.

## Next Actions

1. Add `## Hard Constraints` section (MUST fix).
2. Section renames optional but advised for schema alignment.
