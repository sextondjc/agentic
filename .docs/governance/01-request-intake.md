# 01 · Request Intake Governance

**Lane:** Planning  
**Primary Assets:** `orchestrator.agent.md`, `work-intake-governance/SKILL.md`, `governance-lifecycle.instructions.md`  
**Back to:** [Executive Summary](./executive-summary.md) · [INDEX](./INDEX.md)

---

## Purpose

Classify every inbound request before any specialist or skill execution begins. Prevent scope drift, role bleed, and unapproved work from entering the delivery pipeline.

---

## Why It Exists

Without mandatory intake, specialists execute incorrectly scoped work, lanes collapse into each other, and deliverables diverge silently from plans. The intake function is the governance system's first line of defence: it ensures every request is bounded, owned, and routed before a single line of code or documentation is written.

---

## The Two Mechanisms

### 1. Orchestrator (Every Request)

The `orchestrator` agent is the mandatory entry point for **all** workspace requests without exception. It performs lane classification, specialist selection, and composition gate validation before any work begins.

**Why it's stated in three places:** `copilot-instructions.md`, `governance-lifecycle.instructions.md`, and `orchestrator.agent.md` all mandate the intake rule. This redundancy is intentional — no single file's absence can create a bypass path.

**Orchestrator workflow:**

| Step | Action |
|---|---|
| 1 | Classify request into one primary category using the Category Routing Map |
| 2 | Resolve lane owner from the category map |
| 3 | Select candidate specialist agents from `agents-discovery-index.md` |
| 4 | Select companion skills from `skills-discovery-index.md` |
| 5 | Apply tie-break rules; assign exactly one owner per phase |
| 6 | Publish intake schema before any specialist execution begins |

**Required intake schema fields (all mandatory):**

| Field | Description |
|---|---|
| Objective | What the request accomplishes |
| In-scope | Explicit boundary of what is included |
| Out-of-scope | Explicit boundary of what is excluded |
| Required outputs | Named, durable deliverables |
| Primary lane + Owner + Handoff target | Lane classification and ownership chain |
| Candidate capabilities | Skills/agents evaluated with accept/reject decisions |
| Determinism status | Whether deterministic execution is possible |
| Bounded exploration (if needed) | Hypothesis, time-box, success criteria, closure decision owner |

**Hard constraints on orchestrator:**
- Must not perform domain implementation work
- Must not allow intake bypass under any circumstance
- Must not let planning, implementation, and review collapse into one workflow
- No direct specialist execution is allowed before orchestrator routing, including single-lane tasks

### 2. Work Intake Governance (Pre-Backlog Control)

The `work-intake-governance` skill handles raw demand that arrives before it has been shaped into a plan — support tickets, stakeholder asks, incidents, or ad hoc ideas.

**When to use it:** Raw requests, ideas, incidents, or stakeholder asks must be classified and admitted, deferred, rejected, or routed before they enter planning or delivery.

**Workflow:**

| Step | Output |
|---|---|
| Classify request | Category, urgency, source |
| Assess evidence sufficiency | Is there enough to plan? |
| Assess urgency and impact | Priority signal for backlog placement |
| Make admission decision | Accept / Defer / Reject / Route |
| Document decision | Intake record with named decision and rationale |

**Admission outcomes:**

| Decision | Meaning |
|---|---|
| Accept | Sufficient evidence; enters planning |
| Defer | Valid but lower priority; held in backlog |
| Reject | Out of scope or does not meet criteria |
| Route | Belongs to a different domain; handed off |

**Output artifacts:**
- Intake record (request, source, urgency, impact)
- Evidence sufficiency note
- Admission decision with rationale
- Next-action trigger

---

## Composition Gate

Multi-capability requests must pass a composition gate before execution begins. The gate requires a phase-output ownership matrix where every required output maps to exactly one owning phase.

If any required output lacks an owner or shares ownership between phases without explicit handoff, the composition gate fails and the request is returned for re-scoping.

---

## Bounded Exploration Exception

Deterministic execution is the default. Bounded exploration is only permitted when:
- Novelty, ambiguity, or conflicting constraints make deterministic execution suboptimal
- The hypothesis is stated, the scope boundary is strict, a time-box is defined, measurable success criteria exist, and a closure decision owner is named

Bounded exploration that does not meet all five conditions is treated as undocumented scope drift.

---

## Integration Points

| Downstream Governance Type | Connection |
|---|---|
| [Lifecycle & Lanes](./04-lifecycle-lanes.md) | Orchestrator enforces lane classification |
| [Customization Types](./02-customization-types.md) | Orchestrator selects audit skills from catalog |
| [Change Control](./07-change-control.md) | Scope changes during delivery re-enter intake |
| [Release Governance](./05-release.md) | Promotion decisions are intake-classified as Review-lane |

---

## Violation Codes

| Code | Type | Meaning |
|---|---|---|
| GOV-M4 | MUST | Lifecycle-governance coverage — intake must be present for every request |

Missing intake is treated as a MUST failure regardless of how simple the request appears.
