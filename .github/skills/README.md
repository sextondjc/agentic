# Skills Discovery Index

This index helps you quickly find the right workspace skill before implementation.

## How to Use

1. Scan the When to Use column for your current task.
2. Open the linked SKILL file.
3. Follow that skill before writing or modifying artifacts.

## Available Skills

| Skill | Primary Lane | Secondary Lane | When to Use | Skill File |
|---|---|---|---|---|
| adr-generator | Planning | Review | Use when documenting architectural decisions in .docs/adr with explicit rationale, alternatives, and consequences. | [.github/skills/adr-generator/SKILL.md](./adr-generator/SKILL.md) |
| api-design | Planning | Execution | Use when designing external API integrations with resilient client patterns, DTO contracts, and clear integration boundaries. | [.github/skills/api-design/SKILL.md](./api-design/SKILL.md) |
| apply-review | Review | Execution | Use when receiving code review feedback, before implementing suggestions, especially if feedback seems unclear or technically questionable - requires technical rigor and verification, not performative agreement or blind implementation | [.github/skills/apply-review/SKILL.md](./apply-review/SKILL.md) |
| audit-powershell | Review | Execution | Use when auditing PowerShell scripts for safety, reliability, and style issues, and when you need actionable correction recommendations. | [.github/skills/audit-powershell/SKILL.md](./audit-powershell/SKILL.md) |
| complete-branch | Execution | Review | Use when implementation is complete, all tests pass, and you need to decide how to integrate the work - guides completion of development work by presenting structured options for merge, PR, or cleanup | [.github/skills/complete-branch/SKILL.md](./complete-branch/SKILL.md) |
| critical-thinking | Planning | Review | Use when pressure-testing assumptions, clarifying requirements, and evaluating trade-offs before implementation. | [.github/skills/critical-thinking/SKILL.md](./critical-thinking/SKILL.md) |
| curating-copilot-instructions | Execution | Planning | Use when importing skills, agents, or instructions from a catalogue and updating copilot-instructions.md to leverage them. | [.github/skills/curating-copilot-instructions/SKILL.md](./curating-copilot-instructions/SKILL.md) |
| customization-authoring | Execution | Review | Use when creating or editing .instructions.md or .agent.md files, fixing frontmatter, configuring applyTo patterns, or defining tool restrictions and agent boundaries. | [.github/skills/customization-authoring/SKILL.md](./customization-authoring/SKILL.md) |
| delivery-status-grid | Review | Planning | Use when a user asks for delivery status, progress, completion state, or remaining scope and expects table-first reporting with explicit X of Y measures. | [.github/skills/delivery-status-grid/SKILL.md](./delivery-status-grid/SKILL.md) |
| docker-dotnet | Execution | Review | Use when containerizing .NET applications, authoring or reviewing Dockerfiles and docker-compose files, optimizing image builds, or applying container security practices in .NET solutions. | [.github/skills/docker-dotnet/SKILL.md](./docker-dotnet/SKILL.md) |
| dotnet-refactor | Execution | Review | Use when modernizing .NET code with safe, behavior-preserving improvements such as nullable adoption and obsolete API cleanup. | [.github/skills/dotnet-refactor/SKILL.md](./dotnet-refactor/SKILL.md) |
| executing-plans | Execution | Review | Use when you have a written implementation plan to execute in a separate session with review checkpoints | [.github/skills/executing-plans/SKILL.md](./executing-plans/SKILL.md) |
| perf-benchmark | Review | Planning | Use when designing, running, or reviewing BenchmarkDotNet performance tests in .NET solutions and workspaces. | [.github/skills/perf-benchmark/SKILL.md](./perf-benchmark/SKILL.md) |
| performance-research | Review | Planning | Use when performing research-only .NET and C# performance assessments with evidence-backed remediation reporting. | [.github/skills/performance-research/SKILL.md](./performance-research/SKILL.md) |
| prd-generator | Planning | Review | Use when creating comprehensive, traceable PRDs for features, products, or epics before implementation begins. | [.github/skills/prd-generator/SKILL.md](./prd-generator/SKILL.md) |
| request-review | Review | Execution | Use when completing tasks, implementing major features, or before merging to verify work meets requirements | [.github/skills/request-review/SKILL.md](./request-review/SKILL.md) |
| route-customization | Planning | Review | Use when deciding whether a behavior should be implemented as a custom agent, an instruction file, or a reusable skill. | [.github/skills/route-customization/SKILL.md](./route-customization/SKILL.md) |
| security-research | Review | Planning | Use when performing research-only .NET and C# security assessments with evidence-backed remediation reporting. | [.github/skills/security-research/SKILL.md](./security-research/SKILL.md) |
| skill-review | Review | Planning | Use when evaluating one or more workspace skills against mandatory quality standards, tracking review history, and producing remediation recommendations. | [.github/skills/skill-review/SKILL.md](./skill-review/SKILL.md) |
| skills-authoring | Execution | Review | Use when creating new skills, editing existing skills, or verifying skills work before deployment | [.github/skills/skills-authoring/SKILL.md](./skills-authoring/SKILL.md) |
| sync-customizations | Review | Planning | Use when maintaining .instructions.md and .agent.md files over time and evaluating whether their content remains aligned with current workspace standards and external guidance. | [.github/skills/sync-customizations/SKILL.md](./sync-customizations/SKILL.md) |
| sync-skills | Review | Planning | Use when maintaining a skill library over time and you need to evaluate source freshness, relevance, and adoption before updating skill content. | [.github/skills/sync-skills/SKILL.md](./sync-skills/SKILL.md) |
| syrx-data-access | Execution | Review | Use when implementing or reviewing .NET repository data access that must use Syrx ICommander, explicit parameterized SQL, and project-approved command configuration patterns. | [.github/skills/syrx-data-access/SKILL.md](./syrx-data-access/SKILL.md) |
| task-execution | Execution | Planning | Use when executing implementation plans with independent tasks in the current session | [.github/skills/task-execution/SKILL.md](./task-execution/SKILL.md) |
| task-research | Planning | Review | Use when comprehensive project research is needed before planning or implementation decisions. | [.github/skills/task-research/SKILL.md](./task-research/SKILL.md) |
| test-driven-development | Execution | Planning | Use when implementing any feature or bugfix, before writing implementation code | [.github/skills/test-driven-development/SKILL.md](./test-driven-development/SKILL.md) |
| validate-customization | Review | Planning | Use when evaluating .instructions.md or .agent.md files against quality standards, detecting duplicate/conflicting guidance, and checking alignment with active agent and skill boundaries. | [.github/skills/validate-customization/SKILL.md](./validate-customization/SKILL.md) |
| write-technical-docs | Execution | Review | Use when generating or refreshing technical reference documentation with code-verified content and link integrity checks. | [.github/skills/write-technical-docs/SKILL.md](./write-technical-docs/SKILL.md) |
| writing-plans | Planning | Execution | Use when you have a spec or requirements for a multi-step task, before touching code | [.github/skills/writing-plans/SKILL.md](./writing-plans/SKILL.md) |

## Notes

- This index includes local workspace skills under .github/skills.
- If a skill is added, removed, or renamed, update this file in the same change.
- Maintain `Primary Lane` and `Secondary Lane` values using the taxonomy in `.docs/reference/planning-execution-review-governance.md`.
