<!-- markdownlint-disable-file -->
# Advisory Remediation Plan (R3 + REC-005)

## Plan Metadata

| Field | Value |
|---|---|
| Vision ID | `VIS-20260403-001` |
| Plan ID | `PLAN-20260403-001` |
| Status | `Completed` |
| Owner Lane | `Planning` |
| Source Recommendation A | `R3` from [20260403-comprehensive-workspace-health-audit.md](./../changes/governance-audits/20260403-comprehensive-workspace-health-audit.md) |
| Source Recommendation B | `REC-005` from [20260403-audit.md](./../changes/customization-reviews/20260403-audit.md) |
| Primary Decision | `DEC-01` |
| Recommended Execution Route | `orchestrator` -> `task-execution` -> `validate-customization` + `skill-review` |

## Objective Grid

| Objective ID | Recommendation | Goal | Baseline | Target |
|---|---|---|---|---|
| `OBJ-01` | `R3` | Reduce advisory backlog through phased maintenance with evidence after each pass. | Skill advisories: 37; Customization advisories: 5 (post-remediation rerun). | Complete Phase 1 and produce rerun artifacts with reduced advisory counts and explicit deferred list. |
| `OBJ-02` | `REC-005` | Add missing `## Preferred Companion Skills` sections to four agent files. | 4 targeted agent files missing required section. | 4/4 files updated and validated by `validate-customization` rerun with no MUST failures. |

## Scope

| In Scope | Out of Scope |
|---|---|
| Add companion-skills sections to `architecture-designer`, `benchmark-researcher`, `performance-assessor`, and `security-researcher` agent files. | Structural redesign of all agent templates. |
| Prioritize and remediate a first tranche of advisory debt from skill and customization review outputs. | Full elimination of all 42 advisories in one pass. |
| Run formal reruns and capture updated review artifacts. | Introducing new governance standards or changing review criteria. |

## Parallel Workstreams

| Workstream ID | Lane Owner | Focus | Inputs | Outputs | Dependencies | Parallel Group |
|---|---|---|---|---|---|---|
| `WS-01` | Execution | Implement `REC-005` in 4 agent files. | [20260403-audit.md](./../changes/customization-reviews/20260403-audit.md) and per-agent review notes. | Updated `.github/agents/*.agent.md` files. | None | `P1` |
| `WS-02` | Execution | Build R3 advisory backlog matrix and phase ordering. | Skill/customization aggregate reviews and per-asset review files. | Prioritized advisory matrix in `.docs/changes/` with Phase 1 candidate set. | None | `P1` |
| `WS-03` | Review | Execute reruns and collect evidence. | Outputs from `WS-01` and `WS-02`. | Fresh `validate-customization` + `skill-review` artifacts and delta metrics table. | `WS-01`, `WS-02` | `P2` |
| `WS-04` | Planning/Review | Update governance audit disposition and residual backlog roadmap. | `WS-03` rerun artifacts. | Updated comprehensive governance audit and next-pass plan. | `WS-03` | `P3` |

## Phase Plan

| Phase | Workstreams | Deliverables | Exit Criteria |
|---|---|---|---|
| Phase 1: Close REC-005 | `WS-01` | Four agent files updated with `## Preferred Companion Skills`. | `validate-customization` rerun keeps MUST failures at 0 and records REC-005 complete. |
| Phase 2: First Advisory Pass | `WS-02` | Prioritized advisory matrix and completed fixes for highest-value advisory set. | At least one documented advisory reduction pass completed with traceable file changes. |
| Phase 3: Evidence and Reconciliation | `WS-03`, `WS-04` | New review artifacts + updated governance audit metrics/disposition. | Audit file reflects rerun-backed numbers and clear residual backlog decisions. |

## Task Checklist

### Task 1: REC-005 Agent Updates

**Files:**
- Modify: [architecture-designer.agent.md](./../../.github/agents/architecture-designer.agent.md)
- Modify: [benchmark-researcher.agent.md](./../../.github/agents/benchmark-researcher.agent.md)
- Modify: [performance-assessor.agent.md](./../../.github/agents/performance-assessor.agent.md)
- Modify: [security-researcher.agent.md](./../../.github/agents/security-researcher.agent.md)

- [x] Add `## Preferred Companion Skills` section in each target agent file.
- [x] Keep skill names aligned with [README.md](./../../.github/skills/README.md) canonical IDs.
- [x] Preserve singular purpose and avoid adding cross-lane operational ambiguity.

### Task 2: R3 Advisory Matrix and Prioritization

**Files:**
- Create: [20260403-r3-advisory-backlog-matrix.md](./../changes/20260403-r3-advisory-backlog-matrix.md)
- Review: [20260403-full-skill-review-grid.md](./../changes/skill-reviews/20260403-full-skill-review-grid.md)
- Review: [20260403-audit.md](./../changes/customization-reviews/20260403-audit.md)

- [x] Build a single matrix of open advisories across both review systems.
- [x] Rank by risk and recurrence (High, Medium, Low) with rationale.
- [x] Define Phase 1 remediation set sized for one execution session.

### Task 3: Execute Phase 1 Advisory Fixes

**Files:**
- Modify: Target files identified by Task 2 matrix.
- Modify: [20260403-r3-advisory-backlog-matrix.md](./../changes/20260403-r3-advisory-backlog-matrix.md)

- [ ] Implement Phase 1 advisory fixes.
- [ ] Mark each fixed advisory with file evidence and date.
- [ ] Record unresolved advisories as explicit deferred items.
- [x] Implement Phase 1 advisory fixes.
- [x] Mark each fixed advisory with file evidence and date.
- [x] Record unresolved advisories as explicit deferred items.

### Task 4: Formal Reruns and Evidence Capture

**Files:**
- Modify: [20260403-audit.md](./../changes/customization-reviews/20260403-audit.md) (if rerun output writes in-place)
- Modify: [20260403-full-skill-review-grid.md](./../changes/skill-reviews/20260403-full-skill-review-grid.md) (if rerun output writes in-place)
- Modify: [20260403-comprehensive-workspace-health-audit.md](./../changes/governance-audits/20260403-comprehensive-workspace-health-audit.md)

- [ ] Run `validate-customization` and capture updated totals.
- [ ] Run `skill-review` and capture updated totals.
- [ ] Update governance audit recommendation status and metric deltas from rerun outputs.
- [x] Run `validate-customization` and capture updated totals.
- [x] Run `skill-review` and capture updated totals.
- [x] Update governance audit recommendation status and metric deltas from rerun outputs.

## Acceptance Criteria

| AC ID | Requirement |
|---|---|
| `AC-001` | All four `REC-005` target agent files include `## Preferred Companion Skills` with valid skill IDs. |
| `AC-002` | `validate-customization` reports 0 MUST failures after updates. |
| `AC-003` | A consolidated advisory matrix exists and identifies phase order for remaining advisory debt. |
| `AC-004` | At least one documented R3 remediation pass is completed and evidenced in changed files. |
| `AC-005` | Governance audit metrics and recommendation text are updated from rerun artifacts, not baseline assumptions. |

## Risks and Controls

| Risk ID | Risk | Impact | Mitigation |
|---|---|---|---|
| `RISK-01` | Advisory scope expands faster than a single maintenance pass can close. | Medium | Use phased backlog slices and explicit defer list per pass. |
| `RISK-02` | Companion skill entries drift from canonical skill IDs. | Medium | Validate against [README.md](./../../.github/skills/README.md) before rerun. |
| `RISK-03` | Rerun artifacts are not captured, causing stale governance reporting. | High | Make rerun capture a hard gate before audit disposition changes. |

## Session Survival Handoff

| Workstream | Current State | Next Action | Evidence Anchor |
|---|---|---|---|
| `WS-01` | Completed (pending rerun confirmation) | Run formal customization rerun to confirm REC-005 closure in review artifacts. | [20260403-audit.md](./../changes/customization-reviews/20260403-audit.md) |
| `WS-02` | Completed | Use matrix as active backlog source for Phase 2+ reductions. | [20260403-r3-advisory-backlog-matrix.md](./../changes/20260403-r3-advisory-backlog-matrix.md) |
| `WS-03` | Completed | Capture rerun outputs and deltas in review artifacts. | [20260403-audit.md](./../changes/customization-reviews/20260403-audit.md), [20260403-full-skill-review-grid.md](./../changes/skill-reviews/20260403-full-skill-review-grid.md) |
| `WS-04` | Completed | Reconcile comprehensive governance audit metrics and recommendation status. | [20260403-comprehensive-workspace-health-audit.md](./../changes/governance-audits/20260403-comprehensive-workspace-health-audit.md) |

## Decisions Needed

| Decision ID | Question | Default Recommendation |
|---|---|---|
| `DEC-01` | Should this plan execute as one combined pass or split into separate PRs (`REC-005` first, then R3)? | Split into two commits in one session for cleaner evidence and rollback safety. |
| `DEC-02` | What advisory reduction target should be required for Phase 1 closure? | Minimum 20% reduction across open advisories or explicit blocker rationale. |
