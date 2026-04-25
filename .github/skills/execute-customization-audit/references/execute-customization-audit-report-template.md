# Execute Customization Audit

## Executive Briefing

| Field | Value |
|---|---|
| Audit Date | <YYYY-MM-DD> |
| Scope | <scope> |
| Final Disposition | <PASSED/FAILED/PROVISIONAL-FAILED> |
| One-Report Contract | <Pass/Fail> |
| Notes | <brief summary> |

## Aggregate Outcome Grid

| Source Audit | Outcome | MUST Failures | SHOULD Advisories | Evidence |
|---|---|---:|---:|---|
| Governance Audit | <Pass/Fail/Advisory> | <n> | <n> | [governance-audit.md](./governance-audit.md) |
| Skill Type Audit | <Pass/Fail/Advisory> | <n> | <n> | [governance-audit-types-skills.md](./../../../../.docs/changes/skill/reviews/governance-audit-types-skills.md) |
| Customization Type Audit | <Pass/Fail/Advisory> | <n> | <n> | [governance-audit-types-customizations.md](./../../../../.docs/changes/customization/reviews/governance-audit-types-customizations.md) |
| Optimization Type Audit | <Pass/Fail/Advisory> | <n> | <n> | [governance-audit-types-optimization.md](./../../../../.docs/changes/customization/reviews/governance-audit-types-optimization.md) |

## Failure Matrix

| Failure ID | Source Audit | Severity | Why It Failed | Impact | Evidence |
|---|---|---|---|---|---|
| F-001 | <source> | <High/Medium/Low> | <explicit failure reason> | <impact statement> | human-readable-evidence.md |

## Per-Type Results

| Type | Outcome | MUST Failures | SHOULD Advisories | Open Conflicts | Evidence |
|---|---|---:|---:|---:|---|
| agents | <status> | <n> | <n> | <n> | type-report.md |
| instructions | <status> | <n> | <n> | <n> | type-report.md |
| prompts | <status> | <n> | <n> | <n> | type-report.md |
| skills | <status> | <n> | <n> | <n> | type-report.md |
| optimization | <status> | <n> | <n> | <n> | type-report.md |

## Ranked Recommendations

| Rank | Priority | Recommendation | Owner | Target Date | Evidence |
|---|---:|---|---|---|---|
| 1 | 1 | <action> | <owner> | <YYYY-MM-DD> | evidence.md |

## Optional: Delta vs Prior Grid

| Metric | Prior | Current | Delta | Trend |
|---|---:|---:|---:|---|
| Total MUST Failures | <n> | <n> | <n> | <Increase/Decrease/Flat> |

## Optional: Evidence Index

| Evidence | Source | Human Readable |
|---|---|---|
| [governance-audit.md](./governance-audit.md) | Governance | Yes |

