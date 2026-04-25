# Phase 1 Baseline Lock

## Snapshot

| Field | Value |
|---|---|
| Date | 2026-04-25 |
| Plan Source | /memories/session/plan.md |
| Primary Lane | Execution |
| Scope | Phase 1 Step 1 only |
| Status | Locked |

## Scope Boundaries

| In Scope | Out of Scope |
|---|---|
| Baseline governance controls for implementation start | File deletions, moves, or renames |
| Evidence bundle contract and storage locations | Capability expansion assets |
| Approval chain definition | Cadence rollout artifacts |
| Entry criteria for Phase 1 Step 2 and Step 3 audits | Promotion or release packaging |

## Required Evidence Bundle Contract

| Evidence Item | Required | Storage Path | Owner |
|---|---|---|---|
| Type-audit report | Yes | .docs/changes/governance/type-audits/ | Execution Owner |
| Optimization review report | Yes | .docs/changes/customization/reviews/ | Execution Owner |
| Governance audit report | Yes | .docs/changes/governance/audits/ | Execution Owner |
| Checklist outcome | Yes | .docs/changes/governance/phase-1-audit-entry-checklist.md | Execution Owner |
| Approval entries (named + timestamped) | Yes | .docs/changes/governance/phase-1-status.md | Engineering Owner and Delivery Owner |
| Rollback reference | Yes | .docs/changes/governance/phase-1-status.md | Rollback Owner |

## Approval Chain

| Role | Name | Decision | Timestamp |
|---|---|---|---|
| Engineering Owner | Pending Assignment | Pending | Pending |
| Product or Delivery Owner | Pending Assignment | Pending | Pending |
| Security Sign-off (only if risk escalates) | Not Required Yet | N/A | N/A |

## Rollback Preconditions

- Rollback owner must be assigned before Phase 1 Step 2 starts.
- Rollback steps must be executable without in-flight context.
- If any mandatory artifact is missing, baseline lock remains active and downstream steps are blocked.

## Gate Decision

| Gate | Result | Reason |
|---|---|---|
| Proceed to Phase 1 Step 2 and Step 3 | No-Go (until approvals assigned) | Named approvals and rollback owner are not yet recorded |

## Blocking Rule

No execution of Phase 1 Step 2 or Phase 1 Step 3 is allowed until the approval chain and rollback owner are recorded in the phase status artifact.
