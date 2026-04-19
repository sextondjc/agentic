# Skill Review Report

## Metadata

- Review Date: 2026-04-19
- Reviewer Skill: audit-skill + optimize-customizations (via compose-skills)
- Target Skill: sre-practices
- Target Path: .github/skills/sre-practices/SKILL.md
- Review Scope: Full — All-Skills Optimization Pass

## Storage

- Save this file to .docs/changes/skill/reviews/sre-practices/review.md

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
| SKR-M1 | Pass | SKILL.md — scope is SLO/error-budget/reliability engineering only | Hyper-specialized. No scope bleed. |
| SKR-M2 | Pass | YAML frontmatter valid; Markdown structure well-formed | No issue. |
| SKR-M3 | Pass | `## Trigger Conditions` section present with concrete conditions | No issue. |
| SKR-M4 | **Fail** | SKILL.md line 50: "Design chaos experiments for the highest-risk failure modes using `experiment-design` skill outputs." | Workflow step 6 implies the executor must have run `experiment-design` to obtain its outputs before executing this step. This is an implicit delegation to a named sibling skill in a workflow step body — violates SKR-M4. **Remedy**: Inline the `experiment-design` output contract (hypothesis, success criteria, scope boundary, time-box, rollback criteria) directly into step 6, eliminating the cross-skill dependency. |
| SKR-S1 | Pass | No `references/` folder; skill is self-contained | No assets needed. |
| SKR-S3 | Pass | No markdown links in SKILL.md body | No issue. |
| SKR-S5 | Advisory | SKILL.md line 80: "Related skills: `operability-design`, `support-triage`, `experiment-design`, `release-readiness`, `support-runbook-generator`" | Enumerating 5 related skills by name in the body creates soft cross-skill coupling and may mislead executors into treating these as co-required. Recommend removing or replacing with a note that these are complementary skills in the same operational domain. |

## Recommendations

| Recommendation ID | Description | Priority | Status |
|---|---|---|---|
| REC-001 | Inline experiment-design output contract into workflow step 6. Replace "using `experiment-design` skill outputs" with explicit inline definition: each chaos experiment must include hypothesis, success criteria, scope boundary, time-box, and rollback criteria. | High | Implemented |
| REC-002 | Remove or replace the "Related skills" enumeration on line 80. If cross-skill navigation is needed, move it to a `references/README.md` or a NOTE callout, not the skill workflow body. | Low | Implemented |

## History Guard Check

- History File Loaded: No (no prior review file exists)
- Deny-list Entries Applied: 0
- Suppressed Repeat Recommendations: 0
- Notes: First review for sre-practices.

## Next Actions

1. Implement REC-001: inline experiment-design output contract into step 6.
2. Implement REC-002: remove Related skills enumeration from workflow body.
3. Re-run audit-skill check after remediation to confirm Pass outcome.
