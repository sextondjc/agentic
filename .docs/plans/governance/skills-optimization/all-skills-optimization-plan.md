# All-Skills Optimization Plan

> **For agentic workers:** REQUIRED WORKFLOW: Use the `orchestrator` agent for intake, then execute each phase using the skills identified below. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Apply `optimize-customizations` and `audit-skill` checks to all 84 workspace skills under `.github/skills/`, deliver a consolidated OPR + SKR findings grid, and produce a ranked remediation artifact.

**Architecture:** Multi-phase, compose-skills–orchestrated review. Phase 1 validates scope assumptions via `critical-thinking`. Phase 2 inventories all target SKILL.md files. Phase 3 applies OPR-M*/S* and SKR-M*/S* checks in batches. Phase 4 collapses findings into a consolidated grid and ranked remediation artifact.

**Tech Stack:** Markdown audit templates, `optimize-customizations` OPR check set, `audit-skill` SKR check set, `audit-skill-report-template.md`, `optimization-factor-template.md`

---

## Compose-Skills Contract

### Objective

Apply optimization and audit quality checks across all 84 workspace skills and deliver evidence-backed, ranked remediation.

### Scope Boundaries

| Boundary | Items |
|---|---|
| In-scope | All 84 `SKILL.md` files under `.github/skills/` |
| Out-of-scope | `.agent.md`, `.instructions.md`, `.prompt.md` files; code implementation; test execution |

### Phase-Output Ownership Matrix

| Required Output | Owning Phase | Done Criteria |
|---|---|---|
| Scope validation and risk summary | Phase 1 | Assumptions ledger produced; open blockers named |
| Complete skill inventory (84 skills) | Phase 2 | All skill names and paths confirmed |
| Per-skill OPR + SKR findings (all 84) | Phase 3 | Every skill has ≥1 row in findings grid |
| Consolidated aggregate grid | Phase 4 | Single table, one row per skill, outcome column populated |
| Ranked remediation grid | Phase 4 | Priority-ordered, concrete edits, target files explicit |
| Optimization review artifact | Phase 4 | Saved to `.docs/changes/customization/reviews/skills-optimization-2026-04-19.md` |

### Rejected Candidate Table

| Candidate | Reason Code | Notes |
|---|---|---|
| `test-driven-development` | OUT_OF_SCOPE | No production code is being authored |
| `request-code-review` | OUT_OF_SCOPE | No code changes to review |
| `branch-completion` | OUT_OF_SCOPE | No branch integration work |
| `skills-authoring` | DEFERRED | Applies when authoring NEW skills; review-only pass here |
| `task-execution` | ADAPTED | Loop structure adapted inline; subagent-per-skill overhead unjustified for review at 84-skill scale |

### Phase Handoff Criteria

| From Phase | To Phase | Gate |
|---|---|---|
| Phase 1 → Phase 2 | Phase 2 | Scope assumptions validated; no unresolvable blockers |
| Phase 2 → Phase 3 | Phase 3 | All 84 skill paths confirmed; deny-list from prior reviews loaded |
| Phase 3 → Phase 4 | Phase 4 | Every skill has findings row; MUST failures enumerated |

---

## Task Structure

### Task 1: Critical Thinking — Scope Validation

**Skills:** `critical-thinking`

**Files:**
- Read: `.github/skills/skill-discovery-index.md`
- Read: Prior review history under `.docs/changes/skill/reviews/`

**Steps:**
- [ ] Enumerate assumptions about scope, feasibility, and output fidelity at 84-skill scale
- [ ] Surface risks: session context budget, partial evaluation drift, stale history under old names
- [ ] Confirm: consolidate per-skill artifacts into a SINGLE aggregate grid with individual rows; produce individual review.md only for MUST failures
- [ ] Record any open blockers that prevent safe continuation
- [ ] Produce scope validation summary (inline in plan or as a note in the output artifact)

**Acceptance Criteria:**
- Assumptions explicitly listed
- One clear recommendation confirmed: proceed vs. adjust scope
- No unresolvable blockers

---

### Task 2: Inventory — Confirm All 84 Skills and Load History Deny-Lists

**Skills:** `audit-skill`

**Files:**
- Read: `.github/skills/` directory listing
- Read: Existing review files under `.docs/changes/skill/reviews/`

**Steps:**
- [ ] List all 84 skill folder names
- [ ] Map renamed skills to their current names (asset-naming-taxonomy, curate-copilot-instructions, prototype-mobile-ui, usability-test-scripts, optimize-customizations, sync-customizations)
- [ ] For each skill with a prior review, load the history deny-list (recommendations marked Rejected/Removed/Illegitimate)
- [ ] Flag skills with stale review names (old folder names) — note that prior history counts even under old names
- [ ] Confirm source catalog freshness in `.github/skills/audit-skill/references/source-catalog.md`

**Acceptance Criteria:**
- Complete 84-skill inventory table produced
- Deny-list entries loaded per skill where history exists
- Stale name mappings explicit

---

### Task 3: Evaluation Batch A — Skills 1–30 (acceptance-governance → governance-delivery)

**Skills:** `audit-skill`, `optimize-customizations`

**Files:**
- Read: Each skill's `SKILL.md` in batch

**Checks per skill:**
- SKR-M1: Scope purity (hyper-specialized, one objective)
- SKR-M2: Valid format (YAML frontmatter + markdown structure)
- SKR-M3: Triggers (clear discovery conditions)
- SKR-M4: No cross-skill references / invocations
- OPR-M1: Scope purity (role bleed)
- OPR-M2: Deterministic wording (testable directives)
- OPR-M3: Non-contradiction with governance instructions
- OPR-M4: No cross-skill delegation in workflow steps
- SKR-S1: Assets advisory
- SKR-S3: Link integrity advisory
- SKR-S5: Brevity advisory
- OPR-S1: Brevity advisory
- OPR-S2: Reuse advisory
- OPR-S3: Output clarity advisory

**Steps:**
- [ ] Read SKILL.md for each skill in batch
- [ ] Apply all checks, record evidence
- [ ] Populate findings table rows for batch

**Acceptance Criteria:**
- All 30 skills have findings rows
- Each MUST failure has evidence text

---

### Task 4: Evaluation Batch B — Skills 31–60 (governance-health-overview → release-simulation)

**Skills:** `audit-skill`, `optimize-customizations`

**Steps:**
- [ ] Same as Task 3 for this batch
- [ ] Accumulate findings table rows

**Acceptance Criteria:**
- All 30 skills have findings rows

---

### Task 5: Evaluation Batch C — Skills 61–84 (remediate-review → writing-plans)

**Skills:** `audit-skill`, `optimize-customizations`

**Steps:**
- [ ] Same as Task 3 for this batch
- [ ] Accumulate findings table rows

**Acceptance Criteria:**
- All 24 skills have findings rows

---

### Task 6: Reporting — Consolidated Grid + Ranked Remediation + Artifact

**Skills:** `optimize-customizations`, `audit-skill`

**Files:**
- Create: `.docs/changes/customization/reviews/skills-optimization-2026-04-19.md`
- Update: `.docs/changes/skill/reviews/<skill-name>/review.md` for each MUST failure skill

**Steps:**
- [ ] Collapse all batch findings into one consolidated aggregate grid (84 rows)
- [ ] Produce summary metrics (Pass, Pass With Advisories, Fail, Blocked counts)
- [ ] Produce ranked remediation grid (priority-ordered, concrete edits, exact target files)
- [ ] Write optimization review artifact using `optimization-factor-template.md` structure
- [ ] Write/update individual review.md for any skill with ≥1 MUST failure
- [ ] Confirm every required output from the Phase-Output Ownership Matrix is present

**Acceptance Criteria:**
- Artifact exists at `.docs/changes/customization/reviews/skills-optimization-2026-04-19.md`
- Every skill has ≥1 row in consolidated grid
- Ranked remediation ordered by Priority (High first)
- MUST failures have individual review artifacts
