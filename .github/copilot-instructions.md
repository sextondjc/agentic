# Lean .NET Workspace

This workspace is optimized for lean .NET application development.

## Repository Intent

- This repository is a customization and skills compendium.
- It is not a host for product .NET applications.
- Product C# project rules in this file apply to generated or target repositories where these customizations are applied.

## Canonical Standards

- For .NET target repositories, apply the canonical C#, Syrx, validation, namespace-boundary, and testing policies under `.github/instructions/*.instructions.md`.
- Use `.docs/plans`, `.docs/research`, `.docs/changes`, and `.docs/adr` as canonical documentation locations.
- Treat `.github/instructions/*.instructions.md` as the normative policy source of truth; skills operationalize and enforce those policies.

## Lifecycle Lanes

Use a three-lane operating model for all customization artifacts:

- Planning: intent analysis, constraints, decision records, and grid-first handoff plans.
- Execution: implementation of documentation, code, scripts, workflows, and configuration.
- Review: evaluation of outputs, findings, and remediation disposition.

Canonical governance and classification references:

- [planning-execution-review-governance.md](./skills/governance-audit/references/planning-execution-review-governance.md)
- [agent-lifecycle-catalog.md](./agent-lifecycle-catalog.md)
- [instruction-lifecycle-catalog.md](./instructions/instruction-lifecycle-catalog.md)
- [governance-naming-conventions.instructions.md](./instructions/governance-naming-conventions.instructions.md) ← Mandatory: review before creating new assets
- [prompt-lifecycle-catalog.md](./prompts/prompt-lifecycle-catalog.md)
- [skill-discovery-index.md](./skills/skill-discovery-index.md)

## Mandatory Request Intake

- Every request MUST be routed through `orchestrator` first.
- `orchestrator` MUST classify scope, determine lane ownership, and choose the specialist handoff.
- No direct specialist execution is allowed before `orchestrator` routing, including single-lane tasks.
- If the assigned specialist is already obvious, `orchestrator` still performs intake and immediate handoff.

Use [agent-lifecycle-catalog.md](./agent-lifecycle-catalog.md) as the canonical source for specialist selection and lane mapping.

## Skills Discovery

Use [skill-discovery-index.md](./skills/skill-discovery-index.md) as the single source of truth for the full skill inventory and lane mapping.

Because all requests route through `orchestrator`, discover and select relevant skills from the index instead of maintaining a duplicated skills list here.

Use the skill index as the canonical source for preferred bundles and specialization guidance; do not duplicate skill inventories in this file.

Leverage the `compose-skill` capability to combine skills into reusable bundles for common request shapes.

## Workspace Design Rules

- Prefer skills for narrow, reusable workflows over creating new agents.
- Prefer concise instruction shims that route to skills for situational or procedural depth.
- Use `orchestrator` as the mandatory entry point for all requests.
- Operate in deterministic-by-default mode: define scope and required outputs before execution and avoid silent scope drift.
- Allow exploration only as a rare bounded exception with explicit hypothesis, time-box, success criteria, and closure decision.
- Batch automatable terminal work into a single non-interactive command whenever feasible.
- Default approval budget is one terminal execution per user request unless a documented blocker requires more.
- Never rely on manual terminal input when required parameters can be provided explicitly.
- Avoid duplicate prompts that restate instruction or skill content.
- Keep prompts task-specific and lightweight.
- Align all planning and change tracking artifacts to `.docs` rather than legacy `.copilot-tracking` paths.
- Always start with a planning artifact for every request. For complex requests, use a decision record or change plan with explicit scope, required outputs, and execution handoff. For simple requests, use a one-pager with the same information. For trivial requests, a documented intake comment with the same information is sufficient.