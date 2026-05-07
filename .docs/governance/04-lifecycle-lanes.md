# 04 · Lifecycle & Lane Governance

**Lane:** Planning  
**Primary Assets:** `governance-lifecycle.instructions.md`, `planning-execution-review-governance.md`, `route-customization/SKILL.md`  
**Back to:** [Executive Summary](./executive-summary.md) · [INDEX](./INDEX.md)

---

## Purpose

Classify every artifact into exactly one primary lane, enforce explicit handoffs between phases, and maintain end-to-end traceability from vision to delivery. This is the most cross-cutting governance type — it directly governs orchestrator behavior, catalog integrity, and every other governance type's output requirements.

---

## The Three Lanes

| Lane | Responsibility | Primary Outputs |
|---|---|---|
| **Planning** | Analyze intent, constraints, dependencies; produce execution-ready work packages | Grid-first markdown plan packets in `.docs/plans/`; research in `.docs/research/`; ADRs in `.docs/adr/` |
| **Execution** | Build approved artifacts from planning packets | Code, tests, docs, scripts, configuration; change entries in `.docs/changes/` |
| **Review** | Validate quality, correctness, security, and standards adherence | Review reports with severity-tagged findings in `.docs/changes/`; disposition records |

**Lane assignment rules:**
- Every agent, instruction, prompt, and skill must have exactly one primary lane
- A secondary lane is permitted when the asset genuinely spans two phases (e.g., a skill that both plans and executes in sequence)
- Lane assignments are authoritative in the four catalog indexes
- Changing a lane assignment requires updating all four catalog files in the **same change**

---

## Catalog Integrity (GOV-M3)

The four catalog index files are the **single source of truth** for all routing decisions:

| Catalog | Content |
|---|---|
| `catalogs/agents-discovery-index.md` | Lane assignments and rationale for all agents |
| `catalogs/skills-discovery-index.md` | Lane assignments, when-to-use, and skill file links for all skills |
| `catalogs/instructions-discovery-index.md` | Lane assignments and rationale for all instructions |
| `catalogs/prompts-discovery-index.md` | Lane assignments, canonical identifiers, and file links for all prompts |

**GOV-M3:** An unregistered skill or orphaned catalog row is an immediate MUST failure with **no grace period**. There is no provisional period, no exception for in-progress work.

**Required for every catalog entry:** One-line rationale for the lane assignment — not just a lane label.

**Catalog update rule:** Any create, rename, or delete of a customization asset requires all four catalog files to be updated in the **same change**. Deferred catalog updates are treated as a MUST failure.

---

## Traceability Model

The governance system uses immutable IDs across the full lifecycle. These IDs connect plan intent to execution artifacts to review evidence.

| ID Type | Pattern | Required In |
|---|---|---|
| Vision ID | `VIS-YYYYMMDD-###` | Vision statement and top-level plan packet |
| Plan ID | `PLAN-YYYYMMDD-###` | Planning packet, execution notes, review report |
| Workstream ID | `WS-##` | Planning rows and execution tasks |
| Decision ID | `DEC-##` | Architecture, routing, or scope decisions |
| Review ID | `REV-YYYYMMDD-###` | Review report and disposition tracking |

Execution artifacts that reference originating plan IDs make every change traceable forward and backward through the lifecycle.

---

## Planning Lane Requirements

Planning outputs must be:
- **Grid-first markdown** — tables before prose; tables are the primary communication medium
- **Durable** — contain enough handoff context to resume in a later session without re-discovery
- **ID-bearing** — explicit IDs for plans, workstreams, and decisions
- **Bounded** — workstream boundaries defined to support parallel execution

**Minimum planning packet content:** Objective, scope (in/out), required outputs, ownership, dependencies, acceptance criteria, risk controls, and handoff data.

---

## Execution Lane Requirements

Execution outputs must:
- Reference originating plan and workstream IDs
- Record scope changes as explicit decisions before diverging from the plan
- Complete all requested deliverables explicitly (no implicit partial completion)
- Produce change entries in `.docs/changes/` as the primary traceability artifact

---

## Review Lane Requirements

Review outputs must:
- Evaluate against the active instruction files current at the time of review
- Evaluate against acceptance criteria defined in planning
- Severity-tag every finding (Critical, Major, Minor, Advisory)
- Include an explicit disposition (Approved / Approved with conditions / Rejected)
- Verify determinism controls using the Determinism Review Scorecard (`.github/skills/governance-audit/references/determinism-review-scorecard.md`)

**Determinism scorecard checks (D1–D4):**
- D1: Scope defined before execution
- D2: Required outputs named before execution
- D3: Acceptance criteria present
- D4: No silent divergence from scope

**Bounded exploration (E1–E4):**
- E1: Hypothesis stated
- E2: Scope boundary defined
- E3: Time-box set
- E4: Closure decision documented

---

## Composition Gate

Multi-phase requests require a composition gate before any phase begins. The gate validates:

1. Every required output maps to exactly one owning phase
2. Every phase has exactly one owner
3. Handoff contract between phases is explicit
4. No shared ownership left implicit

A request that fails the composition gate is returned for re-scoping before work begins.

---

## Route Customization Skill

The `route-customization` skill resolves a specific decision: when new behavior is needed, should it be implemented as an **agent**, an **instruction**, or a **skill**? (Or should no new artifact be created?)

**Decision matrix:**

| Asset Type | When to Choose |
|---|---|
| Agent | New specialist persona with a singular role, hard constraints, and a discovery description |
| Instruction | Always-on policy rule that applies without needing to be invoked |
| Skill | Situational workflow triggered on demand by a specific context |
| No new artifact | The needed behavior already exists; compose or reuse |

This prevents the workspace from accumulating duplicate or misclassified assets.

---

## Phase/Discipline/Lane Matrix

The PDL matrix maps delivery phases to discipline ownership within the three-lane model. The `matrix-skill-mapping` skill maintains this matrix.

**Key policy (DEC-PDL-07):** Adding a discipline to the matrix requires a full matrix revisit and an ADR entry. This prevents the discipline list from growing inconsistently.

---

## Integration Points

| Governance Type | Connection |
|---|---|
| [Request Intake](./01-request-intake.md) | Orchestrator enforces lane classification at intake |
| [Customization Types](./02-customization-types.md) | GOV-M3 catalog integrity directly governs audit skill eligibility |
| [Health & Audit Overview](./10-health-audit.md) | `get-lane-counts.ps1` and `test-catalog-integrity.ps1` run as part of governance-audit |
| [Cadenced Audits](./12-cadenced-audits.md) | Catalog sync drift is a standard monthly audit check |
| All governance types | Planning, execution, and review requirements apply to every governance artifact |
