# Agent Review Report

## Metadata

- Review Date: 2026-04-15
- Reviewer Skill: agent-review
- Target Agent: powershell-reviewer
- Target Path: .github/agents/powershell-reviewer.agent.md
- Review Scope: Full

## Summary Outcome Grid

| Metric | Value |
|---|---|
| Overall Outcome | Pass With Advisories |
| MUST Failures | 0 |
| SHOULD Advisories | 1 |
| Conflict Status | None |

## Standards Evaluation

| Standard ID | Result | Evidence | Notes |
|---|---|---|---|
| AGR-M1 | Pass | Scoped to PowerShell script review. "This agent is review-only by default." | Clean boundary. |
| AGR-M2 | Pass | Valid frontmatter. `## Specialization` present. | Extension is `.agent.md`. |
| AGR-M3 | Advisory | Description opens with "Use this agent when you need..." — second-person framing. Should be third-person specialist language. | Rewrite: "Reviews PowerShell scripts and modules for safety, automation readiness, and maintainability, and produces actionable correction recommendations." |
| AGR-M4 | Pass | `## Hard Constraints` section present with four explicit prohibitions. | Strong constraints. Canonical section name used correctly. |
| AGR-S1 | Pass | All five required sections present: `## Specialization`, `## Focus Areas`, `## Standards`, `## Hard Constraints`, `## Preferred Companion Skills`. | Best-in-class alongside `learning-agent`. |
| AGR-S2 | Pass | No hardcoded agent invocations. Companion skills listed declaratively. | Clean. |
| AGR-S3 | Pass | No overlap. PowerShell review is a distinct lane. | No conflict. |
| AGR-S4 | Pass | No markdown links. | Nothing to validate. |
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
| REC-001 | Rewrite `description` to third-person specialist form: "Reviews PowerShell scripts and modules for safety, automation readiness, and maintainability, and produces actionable correction recommendations. Use when reviewing any `.ps1` or `.psm1` file." | Medium | Proposed |

## History Guard Check

- History File Loaded: No (first review)
- Deny-list Entries Applied: 0
- Suppressed Repeat Recommendations: 0
- Notes: No prior history.

## Next Actions

1. Rewrite description to third-person form (advisory — passes all MUST standards).
