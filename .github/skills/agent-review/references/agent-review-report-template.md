# Agent Review Report

## Metadata

- Review Date: YYYY-MM-DD
- Reviewer Skill: agent-review
- Target Agent: <agent-name>
- Target Path: <path-to-agent-md>
- Review Scope: Full | Delta

## Storage

- Save this file to .docs/changes/agent/reviews/<agent-name>/review.md

## Summary Outcome Grid

| Metric | Value |
|---|---|
| Overall Outcome | Pass \| Pass With Advisories \| Fail \| Blocked |
| MUST Failures | <count> |
| SHOULD Advisories | <count> |
| Conflict Status | None \| Detected \| Resolved \| Blocked |

## Standards Evaluation

| Standard ID | Result | Evidence | Notes |
|---|---|---|---|
| AGR-M1 | Pass/Fail | <evidence> | <notes> |
| AGR-M2 | Pass/Fail | <evidence> | <notes> |
| AGR-M3 | Pass/Fail | <evidence> | <notes> |
| AGR-M4 | Pass/Fail | <evidence> | <notes> |
| AGR-S1 | Pass/Advisory | <evidence> | <notes> |
| AGR-S2 | Pass/Advisory | <evidence> | <notes> |
| AGR-S3 | Pass/Advisory/Blocked | <evidence> | <notes> |
| AGR-S4 | Pass/Advisory | <evidence> | <notes> |
| AGR-S5 | Pass/Advisory | <evidence> | <notes> |

## Platform Currency Check

- Source Catalog Consulted: <yes/no>
- Sources Evaluated: <count>
- Sources Needing Review: <count>
- Deprecated Fields Found: <list or none>
- New Fields Applicable: <list or none>
- Recommendation: <platform currency recommendation>

## Recommendations

| Recommendation ID | Description | Priority | Status |
|---|---|---|---|
| REC-001 | <recommendation> | High/Medium/Low | Proposed/Accepted/Rejected/Removed/Implemented |

## History Guard Check

- History File Loaded: <yes/no>
- Deny-list Entries Applied: <count>
- Suppressed Repeat Recommendations: <count>
- Notes: <what was suppressed and why>

## Next Actions

1. <action>
2. <action>

## Aggregate Results Grid (Use for multi-agent reviews)

| Agent | Outcome | MUST Failures | SHOULD Advisories | Conflict Status | Report |
|---|---|---:|---:|---|---|
| <agent-name> | Pass/Pass With Advisories/Fail/Blocked | <n> | <n> | None/Detected/Resolved/Blocked | <report-file> |
