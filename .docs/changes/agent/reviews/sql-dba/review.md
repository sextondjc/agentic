# Agent Review Report

## Metadata

- Review Date: 2026-04-15
- Reviewer Skill: agent-review
- Target Agent: sql-dba
- Target Path: .github/agents/sql-dba.agent.md
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
| AGR-M1 | Pass | Scoped to SQL Server DBA operations. | Singular DBA role. |
| AGR-M2 | Pass | Valid frontmatter including `tools` array. `## Specialization` present. | Extension is `.agent.md`. `tools` is a valid current field. |
| AGR-M3 | Advisory | Description "Work with Microsoft SQL Server databases using the MS SQL extension." is terse and directive-framed rather than third-person specialist. Does not state when to invoke. | Rewrite: "Performs Microsoft SQL Server operational administration, schema inspection, and query execution. Use when live DBA work, schema analysis, or T-SQL is required." |
| AGR-M4 | Fail | No `## Hard Constraints` section. The safety note ("Before running any database tools, ensure extension is installed") is not a prohibitions list. | Add: no general application code changes, no schema destructive operations without explicit user confirmation, no DML outside approved scope. |
| AGR-S1 | Advisory | `## Specialization` and `## Preferred Companion Skills` present. Missing `## Focus Areas` (has `## Capabilities`), `## Standards`, `## Hard Constraints`. | Rename `## Capabilities` → `## Focus Areas`, add `## Standards` referencing `sql-dba.instructions.md`, add `## Hard Constraints`. |
| AGR-S2 | Pass | No hardcoded agent invocations. | Clean. |
| AGR-S3 | Pass | DBA lane is distinct from all other agents. | No conflict. |
| AGR-S4 | Pass | External reference links present and appear valid (Microsoft Learn URLs). | Links are external; assumed live based on source-catalog verification of Microsoft Learn base domain. |
| AGR-S5 | Pass | `tools` and `name`/`description` used. All are valid current fields. No deprecated `infer` field. | Platform currency confirmed 2026-04-15. `tools` array is appropriately scoped to database and execution tools. |

## Platform Currency Check

- Source Catalog Consulted: Yes
- Sources Evaluated: 2
- Sources Needing Review: 0
- Deprecated Fields Found: None
- New Fields Applicable: `tools` already in use and correctly scoped.
- Recommendation: No additional platform-currency changes needed.

## Recommendations

| Recommendation ID | Description | Priority | Status |
|---|---|---|---|
| REC-001 | Add `## Hard Constraints` section: no general application code, no destructive operations without confirmation, no DML outside approved scope. | High | Proposed |
| REC-002 | Rewrite `description` to third-person specialist form with invocation context. | Medium | Proposed |
| REC-003 | Rename `## Capabilities` → `## Focus Areas` and add `## Standards` section. | Low | Proposed |

## History Guard Check

- History File Loaded: No (first review)
- Deny-list Entries Applied: 0
- Suppressed Repeat Recommendations: 0
- Notes: No prior history.

## Next Actions

1. Add `## Hard Constraints` (MUST fix).
2. Improve description (advisory).
3. Add missing schema sections (advisory).
