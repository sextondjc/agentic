# Agent Review Report

## Metadata

- Review Date: 2026-04-15
- Reviewer Skill: agent-review
- Target Agent: architecture-designer
- Target Path: .github/agents/architecture-designer.agent.md
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
| AGR-M1 | Pass | Scope bounded to architecture, DDD, and blueprints — one domain lane. | No scope bleed observed. |
| AGR-M2 | Pass | Valid frontmatter (`name`, `description`). `## Specialization` present. | Extension is `.agent.md`. |
| AGR-M3 | Pass | Description is third-person and describes the role. | Could be more explicit about invocation context ("Use when evaluating architecture...") but passes threshold. |
| AGR-M4 | Fail | No `## Hard Constraints` section present. Closest alternative is a note in `## Specialization` about ADR delegation. | Add explicit `## Hard Constraints` defining what this agent will not do (e.g., no production code implementation, no ADR authoring independently). |
| AGR-S1 | Advisory | Missing `## Focus Areas` (has `## Capabilities`), `## Standards`. `## Specialization` and `## Preferred Companion Skills` are present. | Rename `## Capabilities` → `## Focus Areas` and add `## Standards` referencing active instruction files. |
| AGR-S2 | Pass | References `adr-generator` skill (not an agent) for delegation. No hardcoded agent invocations. | Acceptable — skill references are not AGR-S2 violations. |
| AGR-S3 | Pass | No harmful overlap detected with other agents. | Architecture lane is distinct from engineering and research lanes. |
| AGR-S4 | Pass | No markdown links present. | Nothing to validate. |
| AGR-S5 | Pass | Only `name` and `description` in frontmatter. No deprecated `infer` field. | Platform currency confirmed against source-catalog 2026-04-15. |

## Platform Currency Check

- Source Catalog Consulted: Yes
- Sources Evaluated: 2
- Sources Needing Review: 0
- Deprecated Fields Found: None
- New Fields Applicable: Consider `tools` restriction if read-only research mode is intended; current broad tool access is inconsistent with the ADR delegation-only note.
- Recommendation: Add `tools` restriction list if the agent should not edit production code files — would platform-enforce the "does not implement" boundary.

## Recommendations

| Recommendation ID | Description | Priority | Status |
|---|---|---|---|
| REC-001 | Add `## Hard Constraints` section: no production code implementation, no standalone ADR authoring, no implementation hand-off without explicit user request. | High | Proposed |
| REC-002 | Rename `## Capabilities` → `## Focus Areas` to align with required body section schema. | Low | Proposed |
| REC-003 | Add `## Standards` section referencing `architecture.instructions.md` and related files. | Low | Proposed |

## History Guard Check

- History File Loaded: No (first review)
- Deny-list Entries Applied: 0
- Suppressed Repeat Recommendations: 0
- Notes: No prior history.

## Next Actions

1. Add `## Hard Constraints` section (AGR-M4 MUST fix — required to reach Pass).
2. Rename `## Capabilities` and add `## Standards` section (advisory).
