# 07 · Change Control Governance

**Lane:** Execution  
**Primary Asset:** `scope-change-control/SKILL.md`  
**Back to:** [Executive Summary](./executive-summary.md) · [INDEX](./INDEX.md)

---

## Purpose

Govern scope changes during active delivery by producing explicit decisions with impact analysis instead of silent divergence. When work is in flight, new ideas, stakeholder requests, or discovered constraints frequently attempt to reshape scope. This governance type ensures that every change is evaluated, decided, and recorded — never silently absorbed.

---

## Why It Exists

Silent scope additions are the most common cause of commitment failures in delivery. When a team accepts a new task without removing something else, the date slips quietly. When descoped items are not recorded, acceptance criteria gaps appear at review. Change control governance forces every scope mutation to be a named decision with named trade-offs.

---

## Triggers

Use this governance type when:
- New work is proposed during an active execution slice
- A release candidate needs descoping or swapping under delivery pressure
- Teams are accepting additions without explicit trade-off evaluation
- A scope boundary is under stakeholder pressure without impact analysis

---

## Change Types

| Type | Description |
|---|---|
| **Add** | New work added to an active delivery slice |
| **Descope** | Work removed from the current scope |
| **Swap** | One item removed and replaced with another of equivalent cost |
| **Exception** | Work that must be done regardless of scope rules, with documented justification |

---

## Workflow

| Step | Action |
|---|---|
| 1 | Record the requested change and active delivery context |
| 2 | Classify the change type (Add / Descope / Swap / Exception) |
| 3 | Analyze impact on date, scope confidence, dependencies, and acceptance baseline |
| 4 | Make a decision: Approve / Reject / Defer / Swap |
| 5 | If approved: record the compensating action required to protect the commitment |
| 6 | If the acceptance baseline changes materially: define re-baseline trigger and owner |
| 7 | Publish the change record to prevent silent drift |

---

## Decision Rules

| Rule | Detail |
|---|---|
| No approved Add without impact | Every add must have an explicit impact analysis and a compensating action |
| A Swap names both sides | The incoming item and the outgoing item must both be named explicitly |
| A Defer is a decision | Deferring is not "parking" — it is a scoped, documented decision with a named review trigger |
| Invalidated baseline must update | If the change invalidates prior acceptance criteria assumptions, the baseline must be updated explicitly before execution continues |

---

## Output Artifacts

**Scope-change record:**

| Field | Content |
|---|---|
| Change ID | Unique identifier for the change |
| Type | Add / Descope / Swap / Exception |
| Request | What was requested and by whom |
| Source | Origin (stakeholder name, incident ID, plan reference) |
| Owner | Who owns the decision |
| Decision | Approve / Reject / Defer / Swap |

**Impact analysis:**

| Dimension | Assessment |
|---|---|
| Date impact | Effect on current delivery commitment |
| Scope confidence | Change to confidence level of remaining scope |
| Dependency effect | New or broken dependencies introduced |
| Acceptance baseline | Whether criteria require update |

**Supporting fields:**
- Compensating action note (for approvals)
- Re-baseline trigger (if criteria change)

---

## Integration Points

| Governance Type | Connection |
|---|---|
| [Request Intake](./01-request-intake.md) | Scope change records re-enter intake classification if they constitute a new workstream |
| [Acceptance & Quality](./06-acceptance-quality.md) | Changes that invalidate acceptance criteria require `acceptance-criteria` baseline update |
| [Lifecycle & Lanes](./04-lifecycle-lanes.md) | Scope changes are recorded in `.docs/changes/` as execution-lane artifacts with plan ID references |
| [Delivery Governance](./09-delivery.md) | Scope changes that affect milestones or RAID items require RAID log update |
