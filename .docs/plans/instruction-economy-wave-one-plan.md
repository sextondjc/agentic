<!-- markdownlint-disable-file -->
# Instruction Economy Wave One Implementation Plan

> **For agentic workers:** REQUIRED WORKFLOW: Use the `plan-researcher` agent for planning handoff, then use `csharp-engineer` or `defect-debugger` to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Reduce always-loaded instruction overhead by converting the five heaviest instruction files into concise policy shims backed by on-demand skills, while preserving discoverability and resumability.

**Architecture:** Use seven workstreams with explicit traceability. First create durable governance artifacts, then shrink instruction files, move detailed guidance into the correct skill layer, and finally update discovery/hub assets so future sessions follow the same routing model.

**Tech Stack:** Markdown governance artifacts, Copilot customization files under `.github/`, skill discovery metadata, one validation terminal run.

---

## Required Grid A: Intent and Scope

| Plan ID | Vision ID | Goal | In Scope | Out of Scope | Assumptions | Constraints |
|---|---|---|---|---|---|---|
| PLAN-20260409-IE-W1 | VIS-20260409-IE | Implement the approved first wave of instruction-economy remediation | Five largest instruction files, one new supporting skill, touched destination skills, discovery metadata, governance artifacts, validation metrics | Remaining instruction files outside Wave 1, full skill-library concision cleanup, second-wave migrations | Existing repo conventions remain authoritative | No unrelated cleanup or reversions of current dirty worktree |

## Required Grid B: Parallel Workstreams

| Workstream ID | Lane Owner | Agent/Skill/Prompt | Inputs | Outputs | Dependencies | Parallel Group |
|---|---|---|---|---|---|---|
| WS-01 | Review | validate-customization patterns | Existing audit findings | Review artifact at `.docs/changes/governance/audits/instruction-economy-review.md` | None | P1 |
| WS-02 | Planning | writing-plans | Approved review output | This plan | WS-01 | P1 |
| WS-03 | Execution | task-execution | [architecture.instructions.md](./../../.github/instructions/architecture.instructions.md) | Concise architecture shim + new `domain-design` skill | WS-02 | P2 |
| WS-04 | Execution | task-execution | [syrx.instructions.md](./../../.github/instructions/syrx.instructions.md), [syrx-data-access/SKILL.md](./../../.github/skills/syrx-data-access/SKILL.md) | Concise Syrx shim + on-demand guidance path | WS-02 | P2 |
| WS-05 | Execution | task-execution | [csharp.instructions.md](./../../.github/instructions/csharp.instructions.md), [dotnet-refactor/SKILL.md](./../../.github/skills/dotnet-refactor/SKILL.md) | Concise C# shim + deep-workflow routing | WS-02 | P2 |
| WS-06 | Execution | task-execution | [naming-conventions.instructions.md](./../../.github/instructions/naming-conventions.instructions.md), [librarian/SKILL.md](./../../.github/skills/librarian/SKILL.md), [instructions-authoring/SKILL.md](./../../.github/skills/instructions-authoring/SKILL.md) | Concise naming shim + routing to authoring/librarian skills | WS-02 | P2 |
| WS-07 | Execution | task-execution | [powershell.instructions.md](./../../.github/instructions/powershell.instructions.md), [powershell-script-library/SKILL.md](./../../.github/skills/powershell-script-library/SKILL.md), [copilot-instructions.md](./../../.github/copilot-instructions.md), [skill-discovery-index.md](./../../.github/skills/skill-discovery-index.md) | Concise PowerShell shim, repaired skill links, hub/discovery sync, final validation | WS-02, WS-03..WS-06 | P3 |

## Required Grid C: Acceptance and Governance

| Workstream ID | Acceptance Criteria IDs | Security Checks | Test/Validation Evidence | Review Gate | Exit Decision ID |
|---|---|---|---|---|---|
| WS-01 | AC-001 | Audit remains read-only | Review artifact saved | Required | DEC-IE-003 |
| WS-02 | AC-002 | Plan records scope and resumability | Plan saved with workstream IDs and handoff grid | Required | DEC-IE-004 |
| WS-03 | AC-003 | No mandatory architecture policy is lost | Instruction shrinks substantially and skill captures deep guidance | Required | DEC-IE-005 |
| WS-04 | AC-004 | Syrx remains mandatory for .NET data access | Shim keeps hard rules; detailed patterns reachable on demand | Required | DEC-IE-006 |
| WS-05 | AC-005 | Core C# policies remain mandatory | Shim keeps hard rules; workflows/examples routed to skills | Required | DEC-IE-007 |
| WS-06 | AC-006 | Naming policy remains deterministic | Shim keeps naming rules; procedural guidance routed to skills | Required | DEC-IE-008 |
| WS-07 | AC-007 | PowerShell safety remains mandatory and new skill is discoverable | Validation run passes or reports only known unrelated issues | Required | DEC-IE-009 |

## Required Grid D: Session Survival Handoff

| Workstream ID | Current State | Next Action | Blockers | Resume Command/Prompt | Artifact Links |
|---|---|---|---|---|---|
| WS-01 | Not Started | Write the governance review artifact | None | Open the saved review and confirm Wave 1 scope before editing | [instruction-economy-review.md](./../changes/governance/audits/instruction-economy-review.md) |
| WS-02 | Not Started | Save this plan and reference it from the changes record | None | Resume from this plan and continue unchecked workstreams in order | [instruction-economy-wave-one-plan.md](./instruction-economy-wave-one-plan.md) |
| WS-03 | Not Started | Create `domain-design` skill and slim architecture instruction | None | Resume with architecture files first because they unblock later routing | [instruction-economy-wave-one-changes.md](./../changes/instruction-economy-wave-one-changes.md) |
| WS-04 | Not Started | Slim Syrx instruction and route to existing skill | None | Resume after WS-03 or in parallel if architecture skill already exists | [instruction-economy-wave-one-changes.md](./../changes/instruction-economy-wave-one-changes.md) |
| WS-05 | Not Started | Slim C# instruction and enrich/refocus destination skill | None | Resume after WS-04 or in parallel if instruction batching is preferred | [instruction-economy-wave-one-changes.md](./../changes/instruction-economy-wave-one-changes.md) |
| WS-06 | Not Started | Slim naming instruction and route to authoring/librarian skills | None | Resume after WS-05 | [instruction-economy-wave-one-changes.md](./../changes/instruction-economy-wave-one-changes.md) |
| WS-07 | Not Started | Slim PowerShell instruction, repair destination skill, update discovery metadata, run validation | None | Resume last so the final metrics reflect the full wave | [instruction-economy-wave-one-changes.md](./../changes/instruction-economy-wave-one-changes.md) |

### Task 1: WS-01 and WS-02 Durable Review and Planning Artifacts

**Files:**
- Create: `.docs/changes/governance/audits/instruction-economy-review.md`
- Create: `.docs/plans/instruction-economy-wave-one-plan.md`
- Create: `.docs/changes/instruction-economy-wave-one-changes.md`

- [ ] Step 1: Save the review artifact with footprint, findings, routing matrix, Wave 1 scope, and risks.
- [ ] Step 2: Save the implementation plan with explicit plan, workstream, acceptance, and handoff grids.
- [ ] Step 3: Create the progressive changes record linked to this plan.

### Task 2: WS-03 Architecture Split

**Files:**
- Create: `.github/skills/domain-design/SKILL.md`
- Modify: `.github/instructions/architecture.instructions.md`

- [ ] Step 1: Add a narrow `domain-design` skill for aggregate discovery, domain events, ACL selection, repository boundary mapping, and ADR-triggered architecture review.
- [ ] Step 2: Replace tutorial and example-heavy content in `architecture.instructions.md` with concise policy bullets and explicit routing to `domain-design`, `adr-generator`, and `api-design`.
- [ ] Step 3: Verify the instruction remains policy-only and materially smaller than before.

### Task 3: WS-04 Syrx Split

**Files:**
- Modify: `.github/instructions/syrx.instructions.md`
- Modify: `.github/skills/syrx-data-access/SKILL.md`

- [ ] Step 1: Reduce `syrx.instructions.md` to mandatory data-access rules only.
- [ ] Step 2: Update `syrx-data-access` so it explicitly absorbs the moved deep-pattern guidance and remains the skill destination for detailed Syrx work.
- [ ] Step 3: Verify no mandatory Syrx policy was lost from the always-on layer.

### Task 4: WS-05 C# Split

**Files:**
- Modify: `.github/instructions/csharp.instructions.md`
- Modify: `.github/skills/dotnet-refactor/SKILL.md`

- [ ] Step 1: Reduce `csharp.instructions.md` to core engineering policy, banned practices, and compact routing guidance.
- [ ] Step 2: Enrich `dotnet-refactor` with the moved modernization/evidence workflow so deep guidance remains available on demand.
- [ ] Step 3: Verify C# policy still points to `syrx.instructions.md`, `async-programming.instructions.md`, and the correct destination skills instead of duplicating them.

### Task 5: WS-06 Naming Split

**Files:**
- Modify: `.github/instructions/naming-conventions.instructions.md`
- Modify: `.github/skills/librarian/SKILL.md`

- [ ] Step 1: Reduce `naming-conventions.instructions.md` to asset naming policy and short routing notes.
- [ ] Step 2: Add or refine `librarian` guidance so documentation naming migration and corpus restructuring detail remain available on demand.
- [ ] Step 3: Verify the instruction no longer carries lengthy migration playbooks or redundant examples.

### Task 6: WS-07 PowerShell Split and Discovery Sync

**Files:**
- Modify: `.github/instructions/powershell.instructions.md`
- Modify: `.github/skills/powershell-script-library/SKILL.md`
- Modify: `.github/copilot-instructions.md`
- Modify: `.github/skills/skill-discovery-index.md`

- [ ] Step 1: Reduce `powershell.instructions.md` to concise safety and authoring policy.
- [ ] Step 2: Repair malformed links and add concise destination guidance in `powershell-script-library` so detailed cmdlet/script patterns remain available on demand.
- [ ] Step 3: Update `copilot-instructions.md` to describe concise instruction shims backed by skills.
- [ ] Step 4: Register the new `domain-design` skill in the skill discovery index and preferred skill list.
- [ ] Step 5: Run one batched validation command to measure post-change instruction footprint and surface file errors.

## Self-Review

| Check | Result | Notes |
|---|---|---|
| Spec coverage | Pass | All approved Wave 1 targets are mapped to workstreams WS-01 through WS-07. |
| Placeholder scan | Pass | No `TODO`, `TBD`, or unresolved workflow placeholders remain. |
| Type consistency | Pass | Plan, workstream, acceptance, and decision IDs are consistent. |

## Execution Handoff

Plan saved to `.docs/plans/instruction-economy-wave-one-plan.md`.

Execution mode selected: Inline execution in current session with progressive updates to `.docs/changes/instruction-economy-wave-one-changes.md`.
