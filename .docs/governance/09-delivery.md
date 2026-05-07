# 09 · Delivery Governance

**Lane:** Planning  
**Primary Asset:** `governance-delivery/SKILL.md`  
**Back to:** [Executive Summary](./executive-summary.md) · [INDEX](./INDEX.md)

---

## Purpose

Produce and maintain delivery coordination artifacts for multi-discipline initiatives: RAID logs, dependency maps, milestone lists, and status update templates. Delivery governance ensures that complex initiatives — those spanning more than one discipline or team — have explicit tracking structures before execution begins.

---

## When to Use

Use delivery governance when:
- Delivery spans more than one discipline or team
- A milestone plan exists but RAID management is absent
- A delivery review requires a structured status readout
- Escalation paths are undefined or implicit

---

## Core Artifacts

### RAID Log

The RAID log tracks four item categories with a consistent schema:

| Category | Examples |
|---|---|
| **Risk** | Schedule risk, capability gap, dependency delay, scope ambiguity |
| **Assumption** | Assumed resource availability, environment readiness, scope boundary |
| **Issue** | Active blocker, defect with delivery impact, failed dependency |
| **Dependency** | Cross-discipline artifact needed, external decision required, environment/tooling readiness |

**Required fields per RAID item:**

| Field | Content |
|---|---|
| ID | Unique identifier |
| Category | Risk / Assumption / Issue / Dependency |
| Description | Concise statement of the item |
| Owner | Named person or role |
| Status | Open / Mitigated / Closed / Escalated |
| Target resolution date | Specific date, not "TBD" |

### Dependency Map

Maps cross-discipline handoffs and external dependencies:

| Field | Content |
|---|---|
| Producing discipline | Who creates the artifact or makes the decision |
| Consuming discipline | Who needs it to unblock their work |
| Artifact or decision | What is being handed off |
| Current status | Not started / In progress / Ready / Blocked |

### Milestone List

Named checkpoints with entry and exit criteria:

| Field | Content |
|---|---|
| Milestone name | Descriptive checkpoint name |
| Target date | Specific date |
| Owner | Named person or role |
| Entry criteria | What must be true before this milestone can begin |
| Exit criteria | What must be true before this milestone is considered complete |

### Status Update Template

A reusable template for periodic delivery status communications:
- Milestone status grid (Red / Amber / Green per milestone)
- New blockers since last update
- Resolved items since last update
- Next checkpoint and owner

---

## Done Criteria for Delivery Governance

The governance artifacts are complete when:

| Artifact | Completion Criteria |
|---|---|
| RAID log | Populated with named owner and status per item; no open items without an owner |
| Dependency map | Covers all cross-discipline handoffs; status current |
| Milestone list | Every milestone has target date, owner, and entry/exit criteria |
| Status template | Present and populated for the current checkpoint |

---

## Integration Points

| Governance Type | Connection |
|---|---|
| [Request Intake](./01-request-intake.md) | Delivery governance artifacts are created during the planning phase, after intake classification |
| [Lifecycle & Lanes](./04-lifecycle-lanes.md) | Milestone structure aligns to the planning → execution → review lane sequence |
| [Change Control](./07-change-control.md) | Scope changes that affect milestones or RAID items require RAID log update |
| [Acceptance & Quality](./06-acceptance-quality.md) | Milestone exit criteria may reference acceptance governance dispositions |
| [Health & Audit Overview](./10-health-audit.md) | Delivery status grid (`delivery-status-grid` skill) provides milestone status evidence for governance audits |

---

## Companion Skills

- `delivery-status-grid` — produces table-first delivery status readouts with explicit X-of-Y measures
- `writing-plans` — produces the planning packet that delivery governance instruments with RAID/dependency tracking
- `analysis-execution` — converts discovery findings into traceable requirements that feed the RAID log
- `delivery-forecasting` — converts throughput and WIP data into confidence-based delivery forecasts
