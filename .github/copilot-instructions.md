# Lean .NET Workspace

This workspace is optimized for lean .NET application development.

## Canonical Standards

- Use Syrx only for .NET data access. Do not introduce EF Core or alternate ORMs.
- Data access code must use the repository pattern; no direct data access outside repositories.
- Repository interfaces and concrete repository types must be in `.Repositories` namespaces and `.Repositories` assemblies.
- Each concrete repository type must implement a repository interface, and interface + implementation must be in the same namespace.
- DTO/domain model types passed into or returned from repositories must be immutable (get-only members, no public setters) and validated at instantiation using `Syrx.Validation.Contract` guards.
- Use the latest stable C# version supported by the target framework. Do not raise `LangVersion` beyond TFM support.
- Use xUnit and Moq for tests. FluentAssertions is banned.
- Use `.docs/plans`, `.docs/research`, `.docs/changes`, and `.docs/adr` as canonical documentation locations.
- Keep security, architecture, CI/CD, and PowerShell guidance centralized in the consolidated instruction files under `.github/instructions`.

## Lifecycle Lanes

Use a three-lane operating model for all customization artifacts:

- Planning: intent analysis, constraints, decision records, and grid-first handoff plans.
- Execution: implementation of documentation, code, scripts, workflows, and configuration.
- Review: evaluation of outputs, findings, and remediation disposition.

Canonical governance and classification references:

- `.docs/reference/planning-execution-review-governance.md`
- `.github/agents/README.md`
- `.github/instructions/README.md`
- `.github/instructions/naming-conventions.instructions.md` ← Mandatory: review before creating new assets
- `.github/prompts/README.md`
- `.github/skills/README.md`

## Preferred Agents

Each agent has a singular purpose. Go directly to the specialist for single-lane work. Use `orchestrator` only when work spans multiple phases or disciplines.

| Agent | Use when... |
|---|---|
| `csharp-engineer` | **Default for C# work.** Writing, modifying, or reviewing .NET code. |
| `orchestrator` | Work spans planning + implementation + research, or the right specialist is unclear. |
| `plan-researcher` | Researching options, producing research notes, or writing implementation plans. |
| `architecture-designer` | Evaluating aggregate boundaries, producing blueprints, or identifying anti-patterns. |
| `defect-debugger` | Reproducing, isolating, and fixing a specific defect. |
| `benchmark-researcher` | BenchmarkDotNet-focused benchmark design and analysis with report-first guidance (no implementation). |
| `security-researcher` | Security vulnerability assessment; produces a report, does not implement fixes. |
| `performance-assessor` | Performance bottleneck assessment; produces a report, does not implement fixes. |
| `code-reviewer` | Reviewing a completed implementation step against the plan and workspace standards. |
| `powershell-reviewer` | Reviewing PowerShell scripts for safety, automation readiness, and maintainability with remediation guidance. |
| `sql-dba` | Live SQL Server administration, schema inspection, or operational DBA work. |
| `workspace-scaffolder` | Scaffolding a new project's workspace configuration and copilot instructions. |

## Preferred Skills

Skills discovery index: [.github/skills/README.md](skills/README.md)

- `task-research`
- `prd-generator`
- `critical-thinking`
- `perf-benchmark`
- `api-design`
- `adr-generator`
- `dotnet-refactor`
- `docker-dotnet`
- `syrx-data-access`
- `audit-powershell`
- `audit-governance`
- `security-research`
- `performance-research`
- `delivery-status-grid`
- `sync-skills`
- `skills-authoring`
- `skill-review`
- `route-customization`
- `test-driven-development`
- `writing-plans`
- `executing-plans`
- `task-execution`
- `request-code-review`
- `remediate-review`
- `branch-completion`

## Imported Superpowers Assets

- `skills-authoring` (imported from Superpowers `writing-skills` and renamed)
- `test-driven-development` (supporting workflow dependency)
- `writing-plans` (plan authoring workflow adapted to `.docs/plans`)
- `code-reviewer` (review specialist agent)
- `executing-plans` (plan execution workflow)
- `task-execution` (same-session per-task implementation workflow)
- `request-code-review` and `remediate-review` (review loop workflow)
- `branch-completion` (completion and branch integration workflow)

## Workspace Design Rules

- Prefer skills for narrow, reusable workflows over creating new agents.
- Use `orchestrator` as the default entry point for mixed, ambiguous, or multi-phase work.
- Avoid duplicate prompts that restate instruction or skill content.
- Keep prompts task-specific and lightweight.
- Align all planning and change tracking artifacts to `.docs` rather than legacy `.copilot-tracking` paths.






