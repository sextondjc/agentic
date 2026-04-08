# Governance Retention Policy

## Objective

Keep governance evidence durable and auditable while preventing daily revision sprawl.

## Policy Rules

| Rule ID | Rule | Rationale |
|---|---|---|
| RET-01 | Use `.docs/reference/governance-current-state.md` as the single rolling governance digest. | Concentrates current status in one authoritative location. |
| RET-02 | Do not create daily full governance audit files when disposition is unchanged and no new high-severity issue exists. | Eliminates low-value repetitive artifacts. |
| RET-03 | Create governance audit files only for month-end, milestone, or exception events. | Preserves meaningful checkpoints and incident evidence. |
| RET-04 | Always record High findings, policy changes, and architecture-impacting governance decisions as dedicated artifacts. | Maintains required audit depth for material events. |
| RET-05 | Keep links from digest to underlying evidence artifacts and scripts. | Preserves traceability while reducing file count. |

## Event Classification

| Event Type | Detailed Artifact Required | Location |
|---|---|---|
| Routine pass-only run | No | Update `.docs/reference/governance-current-state.md` only |
| High severity finding | Yes | `.docs/changes/governance/audits/` |
| Governance policy change | Yes | `.docs/changes/` and/or `.docs/adr/` |
| Month-end checkpoint | Yes | `.docs/changes/governance/audits/` |
| Milestone/release checkpoint | Yes | `.docs/changes/governance/audits/` |

## Minimum Required Digest Fields

| Field |
|---|
| Last Updated |
| Current Disposition |
| Open High, Medium, Low findings |
| Active risks and exceptions |
| Baseline snapshot log |
| Next actions |

## Retention Window

| Artifact Type | Keep in Active Tree | Notes |
|---|---|---|
| Rolling digest | 1 current file | Always current |
| Month-end snapshots | Last 3 snapshots | Older snapshots remain available in git history |
| Milestone snapshots | All for active milestone horizon | Keep at least until next major milestone closes |
| Exception reports (High/policy/ADR-impacting) | All | No automatic pruning |

## Transition Plan For Existing Daily Artifacts

| Step | Action | Outcome |
|---|---|---|
| 1 | Keep existing historical daily artifacts as legacy evidence. | No loss of audit traceability. |
| 2 | Stop producing new daily pass-only audit files. | Immediate reduction in document churn. |
| 3 | Continue updating the rolling digest on every governance run. | Current state remains explicit and centralized. |
| 4 | Add only month-end, milestone, or exception artifacts using descriptive kebab-case names. | New history remains concise and high-signal. |
| 5 | If desired later, archive older daily pass-only files in a dedicated archive path while retaining git history. | Working tree stays lean without deleting history. |

## Operating Procedure

1. Run governance checks and collect evidence.
2. Update `.docs/reference/governance-current-state.md` in place.
3. Determine whether the run is routine, baseline, or exception.
4. If baseline or exception, create one artifact under `.docs/changes/governance/audits/`.
5. If routine and unchanged, do not create a new dated audit file.

## Compliance Notes

- This policy complements lifecycle governance by preserving traceability and explicit decision records.
- Git history remains the long-term historical source for routine state evolution.
