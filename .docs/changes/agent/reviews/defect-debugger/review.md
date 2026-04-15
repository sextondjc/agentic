# Agent Review Report

## Metadata

- Review Date: 2026-04-15
- Reviewer Skill: agent-review
- Target Agent: defect-debugger
- Target Path: .github/agents/defect-debugger.agent.md
- Review Scope: Full

## Summary Outcome Grid

| Metric | Value |
|---|---|
| Overall Outcome | Fail |
| MUST Failures | 2 |
| SHOULD Advisories | 2 |
| Conflict Status | None |

## Standards Evaluation

| Standard ID | Result | Evidence | Notes |
|---|---|---|---|
| AGR-M1 | Pass | Scoped to defect reproduction, isolation, fix, and verification. | Singular debug-and-fix role. |
| AGR-M2 | Pass | Valid frontmatter (`name`, `description`, `tools`). `## Specialization` present. `tools` is a valid platform field. | Extension is `.agent.md`. |
| AGR-M3 | Fail | Description reads: "Debug your application to find and fix a bug" — this is a second-person directive, not a third-person specialist description. It does not state when to invoke the agent. | Rewrite: "Reproduces, isolates, and fixes concrete software defects with minimal, testable changes. Use when a specific bug must be diagnosed and resolved." |
| AGR-M4 | Fail | No `## Hard Constraints` section. | Add: no architectural refactoring during a debug session, no silent scope pivot to feature work, escalate to `architecture-designer` when root cause is structural. |
| AGR-S1 | Advisory | Missing `## Focus Areas`, `## Standards`, `## Hard Constraints`. `## Specialization` and `## Preferred Companion Skills` present. | Three of five required sections absent. |
| AGR-S2 | Pass | No hardcoded agent invocations in the body. | Clean. |
| AGR-S3 | Pass | Debug lane is distinct from engineering and planning lanes. | No overlap. |
| AGR-S4 | Pass | No markdown links. | Nothing to validate. |
| AGR-S5 | Pass | `tools` field is valid and current. `name` and `description` are valid. No deprecated `infer` field. | Platform currency confirmed 2026-04-15. `tools` array is a supported current field. |

## Platform Currency Check

- Source Catalog Consulted: Yes
- Sources Evaluated: 2
- Sources Needing Review: 0
- Deprecated Fields Found: None
- New Fields Applicable: `tools` already in use appropriately.
- Recommendation: No additional platform-currency changes beyond description rewrite and constraints.

## Recommendations

| Recommendation ID | Description | Priority | Status |
|---|---|---|---|
| REC-001 | Rewrite `description` to third-person specialist form stating role and invocation context. | High | Proposed |
| REC-002 | Add `## Hard Constraints` section defining no architectural refactoring, no feature-scope pivot, no silent mode switch. | High | Proposed |
| REC-003 | Add `## Focus Areas` section covering reproduction, root-cause analysis, fix, and regression prevention. | Low | Proposed |
| REC-004 | Add `## Standards` section referencing `testing-strategy.instructions.md` and `security-and-secure-coding.instructions.md`. | Low | Proposed |

## History Guard Check

- History File Loaded: No (first review)
- Deny-list Entries Applied: 0
- Suppressed Repeat Recommendations: 0
- Notes: No prior history.

## Next Actions

1. Fix description (AGR-M3 MUST).
2. Add `## Hard Constraints` (AGR-M4 MUST).
3. Add missing sections (advisory).
