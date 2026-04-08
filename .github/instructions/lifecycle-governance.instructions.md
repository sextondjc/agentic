---
name: lifecycle-governance
description: 'Defines mandatory Planning, Execution, and Review lane classification and traceable handoff requirements for customization artifacts.'
applyTo: '**/*.md'
---
# Planning, Execution, Review Governance

## Lane Taxonomy

- Use exactly three lifecycle lanes: `Planning`, `Execution`, `Review`.
- Assign every agent, instruction, prompt, and skill to one `Primary Lane`.
- Optionally assign one `Secondary Lane` when cross-lane support is intentional.
- Resolve lane conflicts explicitly through phase split; do not leave mixed ownership implicit.

## Catalog Integrity

- Keep lane mappings current in:
  - [agent-lifecycle-catalog.md](./../agents/agent-lifecycle-catalog.md)
  - [instruction-lifecycle-catalog.md](./instruction-lifecycle-catalog.md)
  - [prompt-lifecycle-catalog.md](./../prompts/prompt-lifecycle-catalog.md)
  - [skill-discovery-index.md](./../skills/skill-discovery-index.md)
- Update the relevant catalog row in the same change when creating, deleting, or renaming any agent, instruction, prompt, or skill.
- Include a one-line rationale for lane assignment in each catalog entry.

## Mandatory Intake Policy

- Every workspace request MUST route through `orchestrator` first.
- `orchestrator` MUST perform intake classification before any specialist or skill execution begins.
- Direct specialist-first execution is prohibited, including obvious single-lane requests.
- `orchestrator` MAY immediately hand off after intake when the destination specialist is clear.

## Determinism Policy

- Determinism is mandatory by default for all requests.
- `orchestrator` MUST produce explicit intake fields before execution: objective, scope boundaries, primary lane, owner, and required outputs.
- Specialists and skills MUST execute only the approved scope and required outputs; no silent additions or omissions are allowed.
- Any scope change MUST be recorded as an explicit decision before implementation divergence.
- Rare bounded exploration is allowed only when novelty, ambiguity, or conflicting constraints make deterministic execution likely suboptimal.

## Bounded Exploration Requirements

- Exploration runs MUST include a stated hypothesis, strict scope boundary, and time-box.
- Exploration runs MUST define measurable success criteria before execution begins.
- Exploration runs MUST remain governed by the same Planning, Execution, and Review lane controls.
- Exploration runs MUST end with an explicit closure decision: adopt, discard, or convert to deterministic policy/workflow.
- Exploration usage SHOULD remain rare and reviewed for policy drift.

## Planning Output Requirements

- Planning lane outputs must be markdown and grid-first.
- Planning artifacts must include durable handoff context sufficient to resume in a later session.
- Planning artifacts must include explicit IDs for plans, workstreams, and decisions.
- Planning artifacts must define workstream boundaries so execution can proceed in parallel.

## Execution Output Requirements

- Execution outputs must reference the originating plan and workstream IDs.
- Execution must produce concrete artifacts, not planning-only narrative.
- Execution scope changes must be recorded as explicit decisions before implementation divergence.
- Execution outputs must satisfy all requested deliverables with explicit completion status and no omitted mandatory items.

## Execution Route Matrix

Route matrix policy authority is defined in this instruction. The `orchestrator` agent must operationalize these rules without redefining lane ownership semantics.

| Situation | Preferred Skill | Lane Rationale |
|---|---|---|
| No approved implementation plan exists | `writing-plans` | Planning produces executable, traceable work items before execution starts |
| Approved plan exists and execution stays in current session | `task-execution` | Execution lane favors same-session, task-level orchestration |
| Approved plan exists and execution occurs in a separate or dedicated session | `executing-plans` | Execution lane favors explicit handoff and checkpointed progress |
| Mixed request includes planning and implementation | `orchestrator` split into phases | Preserve lane boundaries and deterministic ownership |

## Review Output Requirements

- Review outputs must evaluate artifacts against active instruction files and acceptance criteria.
- Review outputs must include severity-tagged findings and explicit dispositions.
- Review completion must identify unresolved findings and required follow-up actions.
- Review outputs must verify determinism controls: intake completeness, scope fidelity, and bounded exploration closure where used.
- Review outputs SHOULD use the standard checklist in `.github/skills/validate-customization/references/determinism-review-scorecard.md` for consistent evidence capture.

## Traceability and Governance

- Maintain traceability across lanes from vision to plan to execution to review.
- Prefer deterministic routing and explicit handoffs over ad-hoc mode switching.
- Preserve high-throughput parallel work by keeping lane boundaries explicit and documented.
- Treat this instruction as normative policy; treat agent routing tables as operational examples that must remain consistent with this file.


