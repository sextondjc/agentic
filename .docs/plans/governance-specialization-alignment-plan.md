<!-- markdownlint-disable-file -->
# Governance Specialization Alignment Implementation Plan

> **For agentic workers:** REQUIRED WORKFLOW: Use the `plan-researcher` agent for planning handoff, then use `csharp-engineer` or `defect-debugger` to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Implement and document three governance-alignment changes with cross-session survivability.

**Architecture:** Use three independent workstreams with explicit traceability. WS-01 hardens script execution behavior, WS-02 narrows script ownership guidance to governance routines, and WS-03 introduces specialization terminology in a backward-compatible way.

**Tech Stack:** Markdown governance artifacts, PowerShell script library, workspace skill metadata.

---

## Required Grid A: Intent and Scope

| Plan ID | Vision ID | Goal | In Scope | Out of Scope | Assumptions | Constraints |
|---|---|---|---|---|---|---|
| PLAN-20260407-001 | VIS-20260407-001 | Apply and trace three governance changes | Script behavior, script library docs, specialization terminology transition, dated docs artifacts | Broad workspace-wide wording migration | Existing governance structure remains active | No breaking renames in this pass |

## Required Grid B: Parallel Workstreams

| Workstream ID | Lane Owner | Agent/Skill/Prompt | Inputs | Outputs | Dependencies | Parallel Group |
|---|---|---|---|---|---|---|
| WS-01 | Execution | task-execution | test-frontmatter-validity script | Non-interactive fail-fast behavior | None | P1 |
| WS-02 | Execution | task-execution | script library README | Governance-only hub sync ownership text | WS-01 optional | P1 |
| WS-03 | Execution | task-execution | governance-health-overview skill | Specialization wording | None | P1 |

## Required Grid C: Acceptance and Governance

| Workstream ID | Acceptance Criteria IDs | Security Checks | Test/Validation Evidence | Review Gate | Exit Decision ID |
|---|---|---|---|---|---|
| WS-01 | AC-001 | No interactive prompt path on missing parameter | Script run without parameter returns error and non-zero; run with valid parameter succeeds | Required | DEC-01 |
| WS-02 | AC-002 | Governance ownership is explicit and non-ambiguous | README workflow integration references governance routines for hub sync | Required | DEC-02 |
| WS-03 | AC-003 | Terminology standardization is complete | Source assets use Specialization and hyper-specialized language | Required | DEC-03 |

## Required Grid D: Session Survival Handoff

| Workstream ID | Current State | Next Action | Blockers | Resume Command/Prompt | Artifact Links |
|---|---|---|---|---|---|
| WS-01 | Completed | Re-validate in future governance cadence run | None | Run script with and without -AssetType | [20260407-governance-specialization-alignment-changes.md](./../changes/governance-specialization-alignment-changes.md) |
| WS-02 | Completed | Keep ownership language in sync with governance skills | None | Review script library README integration section | [20260407-governance-specialization-alignment-changes.md](./../changes/governance-specialization-alignment-changes.md) |
| WS-03 | Completed | Reuse transitional wording pattern in future governance terminology rollout if approved | None | Review specialization wording in governance-facing skills during future cleanup | [SKILL.md](./../../.github/skills/governance-health-overview/SKILL.md) |

### Task 1: WS-01 Non-Interactive Script Hardening

**Files:**
- Modify: .github/scripts/powershell/test-frontmatter-validity.ps1
- Test: ad hoc terminal execution

- [x] Step 1: Remove interactive mandatory parameter behavior.
- [x] Step 2: Add explicit missing-parameter guard with non-zero exit.
- [x] Step 3: Validate missing parameter path is non-interactive and fails fast.
- [x] Step 4: Validate normal path with -AssetType instructions succeeds.

### Task 2: WS-02 Governance-Only Script Ownership Guidance

**Files:**
- Modify: .github/scripts/powershell/README.md

- [x] Step 1: Update purpose wording to governance-focused invocation.
- [x] Step 2: Replace orchestrator/planning hub-sync statement with governance-routine ownership.
- [x] Step 3: Verify workflow integration section reflects ownership boundary.

### Task 3: WS-03 Specialization Terminology Transition

**Files:**
- Modify: .github/skills/governance-health-overview/SKILL.md

- [x] Step 1: Change section heading to Specialization.
- [x] Step 2: Add hyper-specialized wording while preserving existing intent.
- [x] Step 3: Verify no workflow semantics changed.

## Self-Review

| Check | Result | Notes |
|---|---|---|
| Spec coverage | Pass | Three requested changes mapped to WS-01..WS-03 |
| Placeholder scan | Pass | No TODO or unresolved placeholders |
| Type consistency | Pass | IDs and file references are internally consistent |

## Execution Handoff

Plan saved to .docs/plans/20260407-governance-specialization-alignment-plan.md.

Execution mode selected: Inline execution in current session with progressive updates to .docs/changes.

