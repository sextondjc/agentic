# Skill Audit Operating Model Implementation Plan

> **For agentic workers:** REQUIRED WORKFLOW: Use the `plan-researcher` agent for planning handoff, then use `csharp-engineer` or `defect-debugger` to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Establish a scalable skill-auditing model with one primary cross-skill auditor and targeted domain-specific audit companions only where justified.

**Architecture:** Use a hub-and-spoke governance model. The hub is a single primary audit skill that evaluates all skills against a shared baseline; spokes are optional specialized audit companions for high-risk or domain-specific criteria. Evidence, history, and sign-off remain per reviewed skill.

**Tech Stack:** Markdown governance artifacts, workspace skills (`audit-skill`, `optimize-customizations`, `sync-skills`), review history files under `.docs/changes/skill/`.

---

## Scope And Decision

- Operating decision: default to one primary cross-skill auditor.
- Exception policy: create dedicated audit companions only when unique MUST-level checks cannot be reliably enforced by the primary auditor.
- Required governance outcomes:
  - Per-skill review outcome and evidence.
  - Per-skill history continuity.
  - Consistent standards and violation coding.

## File Structure

### Create
- `.docs/plans/governance/skill-auditing/skill-audit-operating-model-plan.md` (this implementation plan)
- `.docs/changes/skill/reviews/skill-audit-operating-model-review.md` (pilot results and decision evidence)
- `.docs/changes/skill/maintenance/2026-04-24-skill-audit-operating-model.md` (maintenance and adoption summary)

### Modify
- `.github/skills/audit-skill/SKILL.md` (confirm explicit default-hub language and companion escalation criteria)
- `.github/skills/optimize-customizations/SKILL.md` (align optimization checks with hub-and-spoke policy)
- `.github/skills/sync-skills/SKILL.md` (ensure maintenance workflow validates policy adherence over time)

---

### Task 1: Ratify Governance Policy

**Files:**
- Modify: `.github/skills/audit-skill/SKILL.md`
- Modify: `.github/skills/optimize-customizations/SKILL.md`
- Modify: `.github/skills/sync-skills/SKILL.md`

- [ ] **Step 1: Draft policy statement in one paragraph**

Text to add:
- Default model is one primary cross-skill auditor.
- Specialized audit companions are exception-based and must include justification.
- Per-skill evidence and history are mandatory regardless of auditor type.

- [ ] **Step 2: Define companion creation criteria**

Criteria:
- Unique domain risk or compliance obligation.
- Distinct MUST checks not representable in shared baseline.
- Repeated false positives/negatives from generic checks.
- Ownership and maintenance commitment is explicitly named.

- [ ] **Step 3: Add acceptance checks**

Checks:
- Every reviewed skill has a result row.
- Every reviewed skill has history update.
- Exception companions have explicit trigger conditions and boundaries.

- [ ] **Step 4: Commit policy update batch**

Commit message:
- `docs: define hub-and-spoke skill audit operating model`

### Task 2: Run Pilot On Representative Skills

**Files:**
- Create: `.docs/changes/skill/reviews/skill-audit-operating-model-review.md`
- Read/Update: `.docs/changes/skill/history/<skill-name>-history.md` (for each sampled skill)

- [ ] **Step 1: Select pilot sample**

Sample guidance:
- 5 to 8 skills across different domains (authoring, governance, execution, UX, data/security).

- [ ] **Step 2: Execute primary auditor pass**

Output:
- Consolidated grid: skill, outcome, MUST failures, SHOULD advisories, recommendation.

- [ ] **Step 3: Evaluate need for specialized companions**

Decision rule:
- Companion required only if primary auditor cannot enforce required domain checks with acceptable precision.

- [ ] **Step 4: Record pilot decision evidence**

Include:
- What worked with single auditor.
- What failed or was ambiguous.
- Whether any companion creation is approved, deferred, or rejected.

- [ ] **Step 5: Commit pilot artifacts**

Commit message:
- `docs: add skill audit operating model pilot evidence`

### Task 3: Establish Ongoing Delivery Cadence

**Files:**
- Create: `.docs/changes/skill/maintenance/2026-04-24-skill-audit-operating-model.md`

- [ ] **Step 1: Define recurring cadence**

Cadence:
- Monthly baseline audit pass.
- Event-triggered pass after any skill creation/modification.

- [ ] **Step 2: Define ownership model**

Ownership:
- Primary owner: governance maintainer.
- Backup owner: designated reviewer.
- Escalation owner for companion proposals: workspace governance owner.

- [ ] **Step 3: Publish maintenance checklist**

Checklist:
- Source freshness reviewed.
- Standards drift checked.
- History updated.
- Companion exceptions revalidated.

- [ ] **Step 4: Commit cadence artifact**

Commit message:
- `docs: add skill audit operating model maintenance cadence`

---

## Milestones

| Milestone | Target Date | Owner | Entry Criteria | Exit Criteria |
|---|---|---|---|---|
| M1 Policy Ratified | 2026-04-26 | Governance Owner | Draft policy text ready | Policy merged and visible in relevant skills |
| M2 Pilot Completed | 2026-04-30 | Audit Lead | Pilot sample selected | Evidence report published with go/no-go on companions |
| M3 Cadence Active | 2026-05-03 | Governance Maintainer | Policy and pilot evidence accepted | First scheduled cadence and status template in use |

## Dependency Map

| Producing Discipline | Consuming Discipline | Artifact/Decision | Status |
|---|---|---|---|
| Governance | Skill Maintainers | Operating model policy | Pending |
| Audit | Governance | Pilot evidence and recommendation | Pending |
| Governance | Delivery | Cadence and reporting template | Pending |
| Skill Maintainers | Audit | Updated skill files and history entries | Pending |

## RAID Log

| ID | Category | Description | Owner | Status | Target Resolution |
|---|---|---|---|---|---|
| R-01 | Risk | Generic auditor may miss domain-specific checks in niche skills | Audit Lead | Open | 2026-04-30 |
| R-02 | Risk | Companion sprawl may increase maintenance burden | Governance Owner | Open | 2026-05-03 |
| A-01 | Assumption | Existing review history structure is sufficient for per-skill traceability | Governance Maintainer | Open | 2026-04-26 |
| I-01 | Issue | No explicit companion qualification rubric is currently published | Governance Owner | Open | 2026-04-26 |
| D-01 | Dependency | Agreement from skill maintainers on exception criteria | Delivery Owner | Open | 2026-04-28 |

## Status Update Template

Use this at each checkpoint:

- Reporting Date:
- Milestone Status:
- New Blockers:
- Resolved Since Last Update:
- Companion Proposals Raised (if any):
- Companion Proposals Approved (if any):
- Next Actions Before Next Checkpoint:
- Owner Confirmations:

## Exit Criteria

- Primary cross-skill auditor is formally adopted as default.
- Exception criteria for specialized companions are documented and approved.
- Pilot evidence shows whether companions are needed for any sampled domains.
- Ongoing cadence, ownership, and reporting template are active.

## Execution Handoff

Plan complete and saved to `.docs/plans/governance/skill-auditing/skill-audit-operating-model-plan.md`.

Two execution options:

1. Agent-Routed (recommended) - route each task through `orchestrator` to the right specialist and review between tasks.
2. Inline Execution - execute tasks in this session directly, with checkpoint reviews between batches.
