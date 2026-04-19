# PDL Matrix Adoption Plan

> **For agentic workers:** REQUIRED WORKFLOW: Use `orchestrator` to route tasks to appropriate specialists. Skills: `task-execution`, `skills-authoring`, `instructions-authoring`, `agent-authoring`. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Introduce the Phase / Discipline / Lane coverage map as a durable governance artifact, build the governance assets required to keep it accurate and automatically-detectable, and create the highest-priority missing customisations identified by the matrix.

**Architecture:** Four workstreams in dependency order. Governance infrastructure first, then customisation assets, then catalog integration, then monitoring automation. Each workstream produces independently testable outputs.

**Tech Stack:** Markdown governance artifacts, PowerShell scripts for monitoring, `.github` customisation assets (skills, instructions, agents).

**ADR:** [adr-0001-phase-discipline-lane-model-adoption.md](../../../adr/governance/adr-0001-phase-discipline-lane-model-adoption.md)

---

## Plan Metadata

| Field | Value |
|---|---|
| Plan ID | `PLAN-20260417-001` |
| Vision ID | `VIS-20260417-001` |
| Status | `Approved` |
| Owner Lane | `Planning → Execution` |
| Origin | Approved decisions from PDL model evaluation session, 2026-04-17 |

---

## Parallel Workstreams

| WS ID | Name | Lane | Owner Agent/Skill | Outputs | Dependencies | Group |
|---|---|---|---|---|---|---|
| WS-01 | Governance infrastructure | Execution | `instructions-authoring`, `adr-generator` | `governance-release.instructions.md`, updated ADR index, matrix ADR link fix | None | P1 |
| WS-02 | Priority customisation assets | Execution | `skills-authoring` | N01, N02, N04, N06, N07 skills | WS-01 done | P2 |
| WS-03 | Catalog integration | Execution | `instructions-authoring`, `index-docs` | Matrix in `skill-discovery-index.md`, bundle codes in `agent-lifecycle-catalog.md`, Discipline-change protocol in `governance-lifecycle.instructions.md` | WS-01 done | P2 |
| WS-04 | High-signal monitoring | Execution | `powershell-script-library` | `Invoke-MatrixCoverageCheck.ps1` script, monitoring documentation section in matrix | WS-02, WS-03 done | P3 |

---

## File Map

| File | Action | WS | Responsibility |
|---|---|---|---|
| `.github/instructions/governance-release.instructions.md` | Create | WS-01 | Mandatory release artifact rules, evidence shape, approvals, rollback documentation (N10) |
| `.docs/adr/governance/adr-0001-phase-discipline-lane-model-adoption.md` | Already created | WS-01 | Decision record — update ADR index only |
| `.docs/adr/INDEX.md` | Modify | WS-01 | Add adr-0001 to the ADR index |
| `.github/skills/analysis-execution/SKILL.md` | Create | WS-02 | Structured discovery, synthesis, contradiction logging, requirement hardening (N01) |
| `.github/skills/release-readiness/SKILL.md` | Create | WS-02 | Release gate, rollback, smoke, evidence, sign-off workflow (N02) |
| `.github/skills/test-design-review/SKILL.md` | Create | WS-02 | Test strategy, traceability, coverage quality, exit-criteria review (N04) |
| `.github/skills/governance-delivery/SKILL.md` | Create | WS-02 | Dependency, milestone, RAID, delivery coordination workflow (N06) |
| `.github/skills/operability-design/SKILL.md` | Create | WS-02 | Supportability, observability, runbook, on-call readiness (N07) |
| `.github/skills/skill-discovery-index.md` | Modify | WS-03 | Add N01, N02, N04, N06, N07 entries; add note about PDL matrix coverage |
| `.github/agent-lifecycle-catalog.md` | Modify | WS-03 | Add PDL bundle metadata note; reference matrix for routing context |
| `.github/instructions/governance-lifecycle.instructions.md` | Modify | WS-03 | Add DEC-PDL-07 Discipline-change protocol as a mandatory rule |
| `.github/skills/powershell-script-library/references/scripts/` | Create | WS-04 | `Invoke-MatrixCoverageCheck.ps1` — detects bundle drift and stale matrix |

---

## Acceptance Criteria

| AC ID | Requirement |
|---|---|
| AC-001 | `governance-release.instructions.md` exists and contains mandatory release evidence, approval, rollback, and artifact rules. |
| AC-002 | ADR-0001 is linked from the ADR index. |
| AC-003 | All five P0/P1 skills (N01, N02, N04, N06, N07) exist with valid frontmatter, trigger conditions, and output contracts. |
| AC-004 | `skill-discovery-index.md` has rows for all five new skills with correct primary and secondary lane assignments. |
| AC-005 | `governance-lifecycle.instructions.md` contains DEC-PDL-07 as an explicit mandatory rule. |
| AC-006 | `Invoke-MatrixCoverageCheck.ps1` detects at least three of the five signal types: asset drift, stale matrix, promotion without evidence, discipline change, cell gap. |
| AC-007 | All internal links in the matrix document and ADR resolve to existing files. |
| AC-008 | No existing asset names in the matrix legend reference stale tokens. |

---

## Task Breakdown

### Task 1 — Create `governance-release.instructions.md` (WS-01)

**Files:**
- Create: `.github/instructions/governance-release.instructions.md`

- [ ] Write frontmatter with `applyTo: **` and description scoped to release artifact governance.
- [ ] Add mandatory rules: evidence artifacts required before promotion; rollback procedure documented; approval chain identified; release notes format mandated.
- [ ] Add rule: `release-readiness` skill (N02) is the recommended workflow for satisfying these requirements.
- [ ] Verify no overlap with `ci-cd.instructions.md`.
- [ ] Link from `instruction-lifecycle-catalog.md`.

### Task 2 — Update ADR index (WS-01)

**Files:**
- Modify: `.docs/adr/INDEX.md`

- [ ] Add `adr-0001-phase-discipline-lane-model-adoption.md` to the index with title, status, and one-line summary.
- [ ] Verify relative link resolves.

### Task 3 — Create `analysis-execution` skill (WS-02)

**Files:**
- Create: `.github/skills/analysis-execution/SKILL.md`

- [ ] Write skill specialised for: structured discovery execution, assumption ledger, contradiction logging, synthesis into requirement candidates, and hardening pass.
- [ ] Include trigger conditions: when discovery work must produce traceable requirements, not just notes.
- [ ] Include output contract: assumption log, requirement candidate list, open questions list, recommendation note.
- [ ] Assign primary lane: Execution; secondary: Planning.
- [ ] Add to `skill-discovery-index.md`.

### Task 4 — Create `release-readiness` skill (WS-02)

**Files:**
- Create: `.github/skills/release-readiness/SKILL.md`

- [ ] Write skill specialised for: promotion gate checklist, rollback plan validation, smoke test coordination, release evidence collation, and go/no-go sign-off workflow.
- [ ] Include trigger conditions: before any promotion from one environment to the next.
- [ ] Include output contract: gate checklist result, evidence bundle, rollback confirmation, sign-off record.
- [ ] Assign primary lane: Execution; secondary: Review.
- [ ] Add to `skill-discovery-index.md`.

### Task 5 — Create `test-design-review` skill (WS-02)

**Files:**
- Create: `.github/skills/test-design-review/SKILL.md`

- [ ] Write skill specialised for: test strategy evaluation, coverage rationale, traceability matrix review, exit criteria definition, and multi-discipline test pass coordination.
- [ ] Include trigger conditions: when entering the TEST phase or when test plans require review.
- [ ] Include output contract: strategy review finding log, traceability verdict, exit-criteria statement, coverage gap list.
- [ ] Assign primary lane: Review; secondary: Planning.
- [ ] Add to `skill-discovery-index.md`.

### Task 6 — Create `governance-delivery` skill (WS-02)

**Files:**
- Create: `.github/skills/governance-delivery/SKILL.md`

- [ ] Write skill specialised for: dependency mapping, milestone tracking, RAID log management, delivery cadence design, and cross-team coordination.
- [ ] Include trigger conditions: when a delivery initiative spans multiple disciplines or teams.
- [ ] Include output contract: RAID log, dependency map, milestone list, status update template.
- [ ] Assign primary lane: Planning; secondary: Review.
- [ ] Add to `skill-discovery-index.md`.

### Task 7 — Create `operability-design` skill (WS-02)

**Files:**
- Create: `.github/skills/operability-design/SKILL.md`

- [ ] Write skill specialised for: operability requirements gathering, runbook design, observability hook specification, on-call readiness checklist, and support handoff artifact creation.
- [ ] Include trigger conditions: during DESIGN or IMPLEMENTATION when support readiness must be designed in.
- [ ] Include output contract: operability requirements list, runbook outline, alert matrix, support handoff packet.
- [ ] Assign primary lane: Execution; secondary: Planning.
- [ ] Add to `skill-discovery-index.md`.

### Task 8 — Catalog integration (WS-03)

**Files:**
- Modify: `.github/skills/skill-discovery-index.md`
- Modify: `.github/instructions/governance-lifecycle.instructions.md`
- Modify: `.github/agent-lifecycle-catalog.md`

- [ ] Add rows for all five new skills to `skill-discovery-index.md` with lanes, when-to-use, and skill file link.
- [ ] Add DEC-PDL-07 (Discipline-change triggers matrix revisit) to `governance-lifecycle.instructions.md` under the Lane Taxonomy section.
- [ ] Add a note to `agent-lifecycle-catalog.md` referencing the PDL matrix as the coverage map for agent routing context.

### Task 9 — Matrix coverage check script (WS-04)

**Files:**
- Create: `.github/skills/powershell-script-library/references/scripts/Invoke-MatrixCoverageCheck.ps1`

- [ ] Write a script that reads `skill-discovery-index.md` and compares listed skills against the bundle legend in the matrix document.
- [ ] Detect: any bundle member that no longer exists as a skill or agent file (asset drift signal).
- [ ] Detect: matrix document older than the last modification of `skill-discovery-index.md` (stale matrix signal).
- [ ] Detect: any skill file with no matrix bundle code reference in its description (promotion without evidence signal).
- [ ] Output: a coverage report table showing signal type, asset name, and recommended action.
- [ ] Test: run against the workspace and verify it produces output without errors.
- [ ] Add to `powershell-script-library` catalog entry.

### Task 10 — Final validation (WS-04)

**Files:**
- Review: all created and modified files

- [ ] Verify all internal links in the matrix document resolve.
- [ ] Verify ADR-0001 is linked from the ADR index.
- [ ] Verify `skill-discovery-index.md` has rows for all five new skills.
- [ ] Verify `governance-lifecycle.instructions.md` contains DEC-PDL-07.
- [ ] Verify `governance-release.instructions.md` exists and is linked from `instruction-lifecycle-catalog.md`.
- [ ] Run `Invoke-MatrixCoverageCheck.ps1` and confirm no critical signals remain unresolved.
- [ ] Record completion in a `.docs/changes` artifact.

---

## Risk Register

| Risk ID | Risk | Impact | Mitigation |
|---|---|---|---|
| R-01 | New skills drift from the bundle codes they are meant to serve | Medium | Each skill SKILL.md must cite the N-code and the cells it serves in its description |
| R-02 | `governance-lifecycle.instructions.md` becomes a blocker if DEC-PDL-07 is misapplied | Medium | Keep the rule narrow: it gates *adoption* of a discipline change, not every discussion |
| R-03 | `Invoke-MatrixCoverageCheck.ps1` false-positives on renamed assets | Low | Script compares canonical names from `skill-discovery-index.md` not file paths |
| R-04 | Catalog integration creates duplicate guidance | Low | Check each modification for overlap before writing; use `governance-sync-customizations` to validate |

---

## Recommended Execution Route

| Situation | Route |
|---|---|
| Executing in the current session | `orchestrator` → `task-execution` for each workstream |
| Executing in a later session | `orchestrator` → `plans` skill to resume from this artifact |
| Post-execution review | `governance-audit` + `governance-validate-customization` against AC-001 through AC-008 |
