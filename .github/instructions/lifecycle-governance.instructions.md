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
  - [README.md](./../agents/README.md)
  - [README.md](./README.md)
  - [README.md](./../prompts/README.md)
  - [README.md](./../skills/README.md)
- Update the relevant catalog row in the same change when creating, deleting, or renaming any agent, instruction, prompt, or skill.
- Include a one-line rationale for lane assignment in each catalog entry.

## Planning Output Requirements

- Planning lane outputs must be markdown and grid-first.
- Planning artifacts must include durable handoff context sufficient to resume in a later session.
- Planning artifacts must include explicit IDs for plans, workstreams, and decisions.
- Planning artifacts must define workstream boundaries so execution can proceed in parallel.

## Execution Output Requirements

- Execution outputs must reference the originating plan and workstream IDs.
- Execution must produce concrete artifacts, not planning-only narrative.
- Execution scope changes must be recorded as explicit decisions before implementation divergence.

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

## Traceability and Governance

- Maintain traceability across lanes from vision to plan to execution to review.
- Prefer deterministic routing and explicit handoffs over ad-hoc mode switching.
- Preserve high-throughput parallel work by keeping lane boundaries explicit and documented.
- Treat this instruction as normative policy; treat agent routing tables as operational examples that must remain consistent with this file.
