# 06 · Acceptance & Quality Governance

**Lane:** Review  
**Primary Assets:** `acceptance-criteria/SKILL.md`, `acceptance-governance/SKILL.md`  
**Back to:** [Executive Summary](./executive-summary.md) · [INDEX](./INDEX.md)

---

## Purpose

Acceptance governance covers two related functions:
1. **Acceptance Criteria** — convert backlog items into explicit, testable acceptance conditions *before* implementation starts
2. **Acceptance Governance** — standardize the review intake, checklist application, finding structure, and disposition format across all discipline reviews

Together, these ensure that "done" is defined before work begins and that every review — regardless of discipline — produces structurally comparable, auditable output.

---

## 6.1 Acceptance Criteria

### What It Produces

Before implementation begins, the `acceptance-criteria` skill produces:
- A **numbered acceptance criteria set** — one observable, testable outcome per criterion
- A **scenario matrix** with primary, edge, negative, and recovery cases
- A **done gate** — explicit conditions that must be met for the work item to be considered complete
- An **ambiguity log** — unresolved questions that would block testable criteria
- A **traceability note** linking each criterion to its source work item

### Rules for Each Criterion

Every acceptance criterion must:
- Express **one observable outcome**
- Be **testable** — a person or tool can verify it
- Avoid **implementation instructions** — criteria define *what*, not *how*
- Be **traceable** to a source work item (backlog item, plan ID, or decision)

### Why It Matters

Without explicit acceptance criteria, engineers implement to assumptions and reviewers evaluate against different mental models. The acceptance criteria set is the contract between planning and delivery — it is referenced by acceptance governance, code review, and release readiness.

---

## 6.2 Acceptance Governance

### Purpose

The `acceptance-governance` skill is the **shared review contract** across all disciplines. It does not perform primary discipline reviews; it standardizes the intake, checklist application, finding structure, and disposition format so that reviews from different disciplines are structurally comparable and auditable.

### Workflow

| Step | Action |
|---|---|
| 1 | Confirm artifact, acceptance criteria set, discipline, and review phase |
| 2 | Select the discipline-specific checklist |
| 3 | Apply checklist line by line — Pass / Fail / N/A with evidence note |
| 4 | Classify each Fail by severity |
| 5 | Write finding set |
| 6 | Write evidence summary |
| 7 | Record disposition |
| 8 | Populate follow-up list |

### Severity Classification

| Severity | Effect |
|---|---|
| **Critical** | Blocks sign-off; promotion cannot proceed |
| **Major** | Conditional sign-off; requires named resolution plan |
| **Minor** | Advisory; tracked but does not block |
| **Advisory** | Informational only; no action required |

### Disposition Options

| Disposition | Meaning |
|---|---|
| **Approved** | All Critical and Major findings resolved or absent |
| **Approved with conditions** | Major findings present with named, dated resolution plans |
| **Rejected** | Critical findings open; re-submission required after resolution |

### Hard Guardrails

- Do not record **Approved** when any Critical finding is open
- Do not omit findings to reach a cleaner disposition
- Do not merge findings from separate disciplines without labeling discipline context

---

## Discipline Checklists

The acceptance governance skill includes checklists for seven disciplines:

| Discipline | Core Check Areas |
|---|---|
| **Architecture** | Boundary conformance, coupling risk, ADR coverage, change safety |
| **Engineering** | Standards conformance, test coverage, plan fidelity, security baseline |
| **Security** | Control implementation, validation points, exposure surface, secrets handling |
| **Performance** | Budget compliance, regression risk, instrumentation coverage |
| **UX** | Accessibility (WCAG 2.1 AA), design fidelity, journey completeness |
| **Product Management** | Acceptance criteria coverage, value delivery, scope conformance |
| **Governance** | Policy conformance, evidence completeness, audit trail integrity |

---

## Connected Review Skills and Agents

The `acceptance-governance` skill is the structural foundation for all of these:

| Asset | Role |
|---|---|
| `code-reviewer` agent | Performs Engineering discipline review using acceptance-governance structure |
| `manual-code-reviewer` agent | Records observations during live review; findings follow acceptance-governance format |
| `request-code-review` skill | Entry point for triggering a code review; output follows acceptance-governance format |
| `remediate-review` skill | Processes incoming review feedback against acceptance-governance criteria before implementing |
| `test-design-review` skill | Reviews test plans using acceptance-governance checklist for test discipline |
| `release-readiness` skill | Requires acceptance-governance sign-off as part of the release gate |

---

## Integration Points

| Governance Type | Connection |
|---|---|
| [Request Intake](./01-request-intake.md) | Acceptance criteria are defined during planning phase, before intake to execution |
| [Release Governance](./05-release.md) | Release gate requires acceptance governance disposition |
| [Change Control](./07-change-control.md) | Scope changes that invalidate acceptance criteria require criteria baseline update |
| [Health & Audit Overview](./10-health-audit.md) | Governance discipline checklist is applied during governance-audit reviews |
