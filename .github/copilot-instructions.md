# Lean .NET Workspace

This workspace is optimized for lean .NET application development.

## Repository Intent

- This repository is a customization and skills compendium.
- It is not a host for product .NET applications.
- Product C# project rules in this file apply to generated or target repositories where these customizations are applied.

## Canonical Standards

- Use Syrx only for .NET data access. Do not introduce EF Core or alternate ORMs.
- Data access code must use the repository pattern; no direct data access outside repositories.
- Repository interfaces and concrete repository types must be in `.Repositories` namespaces and `.Repositories` assemblies.
- Each concrete repository type must implement a repository interface, and interface + implementation must be in the same namespace.
- DTO/domain model types passed into or returned from repositories must be immutable (get-only members, no public setters) and validated at instantiation using `Syrx.Validation.Contract` guards.
- Use the latest stable C# version supported by the target framework. Do not raise `LangVersion` beyond TFM support.
- Use xUnit and Moq for tests. FluentAssertions is banned.
- Use `.docs/plans`, `.docs/research`, `.docs/changes`, and `.docs/adr` as canonical documentation locations.
- Keep mandatory policy guidance in concise instruction files under `.github/instructions` and move procedural depth into skills.

## Lifecycle Lanes

Use a three-lane operating model for all customization artifacts:

- Planning: intent analysis, constraints, decision records, and grid-first handoff plans.
- Execution: implementation of documentation, code, scripts, workflows, and configuration.
- Review: evaluation of outputs, findings, and remediation disposition.

Canonical governance and classification references:

- [planning-execution-review-governance.md](./skills/audit-governance/references/planning-execution-review-governance.md)
- [agent-lifecycle-catalog.md](./agents/agent-lifecycle-catalog.md)
- [instruction-lifecycle-catalog.md](./instructions/instruction-lifecycle-catalog.md)
- [naming-conventions.instructions.md](./instructions/naming-conventions.instructions.md) ← Mandatory: review before creating new assets
- [prompt-lifecycle-catalog.md](./prompts/prompt-lifecycle-catalog.md)
- [skill-discovery-index.md](./skills/skill-discovery-index.md)

## Preferred Agents

Each agent is specialized for one narrowly bounded responsibility.

## Mandatory Request Intake

- Every request MUST be routed through `orchestrator` first.
- `orchestrator` MUST classify scope, determine lane ownership, and choose the specialist handoff.
- No direct specialist execution is allowed before `orchestrator` routing, including single-lane tasks.
- If the assigned specialist is already obvious, `orchestrator` still performs intake and immediate handoff.

| Agent | Use when... |
|---|---|
| `csharp-engineer` | **Default for C# work.** Writing, modifying, or reviewing .NET code. |
| `orchestrator` | Mandatory first-hop for every request. Classifies scope and routes to the correct specialist. |
| `learning-agent` | Building deep topic mastery maps with depth control, specialist decomposition, and source-backed learning plans. |
| `plan-researcher` | Researching options, producing research notes, or writing implementation plans. |
| `architecture-designer` | Evaluating aggregate boundaries, producing blueprints, or identifying anti-patterns. |
| `defect-debugger` | Reproducing, isolating, and fixing a specific defect. |
| `benchmark-researcher` | BenchmarkDotNet-focused benchmark design and analysis with report-first guidance (no implementation). |
| `security-researcher` | Security vulnerability assessment; produces a report, does not implement fixes. |
| `performance-assessor` | Performance bottleneck assessment; produces a report, does not implement fixes. |
| `code-reviewer` | Reviewing a completed implementation step against the plan and workspace standards. |
| `powershell-reviewer` | Reviewing PowerShell scripts for safety, automation readiness, and maintainability with remediation guidance. |
| `governance-briefer` | Producing concise, single-page governance briefings from existing governance artifacts. |
| `manual-code-reviewer` | Recording manual code review findings into structured review artifacts during source inspection. |
| `sql-dba` | Live SQL Server administration, schema inspection, or operational DBA work. |
| `workspace-scaffolder` | Scaffolding a new project's workspace configuration and copilot instructions. |

## Skills Discovery

Use [skill-discovery-index.md](./skills/skill-discovery-index.md) as the single source of truth for the full skill inventory and lane mapping.

When requests route through `orchestrator`, discover and select relevant skills from the index instead of maintaining a duplicated skills list here.

## Imported Superpowers Assets

- `skills-authoring` (imported from Superpowers `writing-skills` and renamed)
- `execute-test-driven-development` (supporting workflow dependency)
- `writing-plans` (plan authoring workflow adapted to `.docs/plans`)
- `code-reviewer` (review specialist agent)
- `execute-plans` (plan execution workflow)
- `task-execution` (same-session per-task implementation workflow)
- `request-code-review` and `remediate-review` (review loop workflow)
- `branch-completion` (completion and branch integration workflow)

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








