# Skills Discovery Index

This index helps you quickly find the right workspace skill before implementation.

## How to Use

1. Scan the When to Use column for your current task.
2. Open the linked SKILL file.
3. Follow that skill before writing or modifying artifacts.

## Available Skills

| Skill | Primary Lane | Secondary Lane | When to Use | Skill File |
|---|---|---|---|---|
| adr-generator | Planning | Review | Use when documenting architectural decisions in .docs/adr with explicit rationale, alternatives, and consequences. | [SKILL.md](./adr-generator/SKILL.md) |
| api-design | Planning | Execution | Use when designing external API integrations with resilient client patterns, DTO contracts, and clear integration boundaries. | [SKILL.md](./api-design/SKILL.md) |
| audit-governance | Review | Planning | Use when assessing the workspace governance layer as a whole — describing what governance is in place, identifying weaknesses and risks across instructions, agents, skills, prompts, and catalog integrity, and producing ranked remediation recommendations. | [SKILL.md](./audit-governance/SKILL.md) |
| governance-health-overview | Review | Planning | Use when you need one reconciled governance disposition by synthesizing outputs from audit-governance, skill-review, and validate-customization. | [SKILL.md](./governance-health-overview/SKILL.md) |
| remediate-review | Review | Execution | Use when receiving code review feedback, before implementing suggestions, especially if feedback seems unclear or technically questionable - requires technical rigor and verification, not performative agreement or blind implementation | [SKILL.md](./remediate-review/SKILL.md) |
| audit-powershell | Review | Execution | Use when auditing PowerShell scripts for safety, reliability, and style issues, and when you need actionable correction recommendations. | [SKILL.md](./audit-powershell/SKILL.md) |
| build-maui-apps | Execution | Planning | Use when building or upgrading .NET MAUI mobile apps and you need a repeatable workflow for architecture, navigation, data, security, testing, performance, and release readiness. | [SKILL.md](./build-maui-apps/SKILL.md) |
| branch-completion | Execution | Review | Use when implementation is complete, all tests pass, and you need to decide how to integrate the work - guides completion of development work by presenting structured options for merge, PR, or cleanup | [SKILL.md](./branch-completion/SKILL.md) |
| critical-thinking | Planning | Review | Use when pressure-testing assumptions, clarifying requirements, and evaluating trade-offs before implementation. | [SKILL.md](./critical-thinking/SKILL.md) |
| learn-topics | Planning | Execution | Use when building a specialist learning path that decomposes a topic by depth and produces a source-backed learning map with optional skill/customization generation. | [SKILL.md](./learn-topics/SKILL.md) |
| curating-copilot-instructions | Execution | Planning | Use when importing skills, agents, or instructions from a catalogue and updating copilot-instructions.md to leverage them. | [SKILL.md](./curating-copilot-instructions/SKILL.md) |
| current-test-coverage | Review | Execution | Use when a user asks for the current or latest test coverage and wants fresh coverage metrics from this session instead of previously recorded numbers. | [SKILL.md](./current-test-coverage/SKILL.md) |
| customization-authoring | Execution | Review | Use when creating or editing .instructions.md or .agent.md files, fixing frontmatter, configuring applyTo patterns, or defining tool restrictions and agent boundaries. | [SKILL.md](./customization-authoring/SKILL.md) |
| delivery-status-grid | Review | Planning | Use when a user asks for delivery status, progress, completion state, or remaining scope and expects table-first reporting with explicit X of Y measures. | [SKILL.md](./delivery-status-grid/SKILL.md) |
| design-mobile-ux | Planning | Execution | Use when defining or improving iOS/Android mobile UX and you need a practical flow from research to wireframes, validation, and implementation handoff. | [SKILL.md](./design-mobile-ux/SKILL.md) |
| docker-dotnet | Execution | Review | Use when containerizing .NET applications, authoring or reviewing Dockerfiles and docker-compose files, optimizing image builds, or applying container security practices in .NET solutions. | [SKILL.md](./docker-dotnet/SKILL.md) |
| dotnet-refactor | Execution | Review | Use when modernizing .NET code with safe, behavior-preserving improvements such as nullable adoption and obsolete API cleanup. | [SKILL.md](./dotnet-refactor/SKILL.md) |
| executing-plans | Execution | Review | Use when you have a written implementation plan to execute in a separate session with review checkpoints | [SKILL.md](./executing-plans/SKILL.md) |
| summarize-governance | Review | Planning | Use when you need a concise, single-page governance briefing that aggregates the most salient findings, risks, and actions across governance artifacts. | [SKILL.md](./summarize-governance/SKILL.md) |
| perf-benchmark | Review | Planning | Use when designing, running, or reviewing BenchmarkDotNet performance tests in .NET solutions and workspaces. | [SKILL.md](./perf-benchmark/SKILL.md) |
| performance-research | Review | Planning | Use when performing research-only .NET and C# performance assessments with evidence-backed remediation reporting. | [SKILL.md](./performance-research/SKILL.md) |
| prd-generator | Planning | Review | Use when creating comprehensive, traceable PRDs for features, products, or epics before implementation begins. | [SKILL.md](./prd-generator/SKILL.md) |
| prune-doc-artifacts | Review | Execution | Use when auditing .docs planning and execution artifacts to identify stale, superseded, or generated leftovers and produce safe archive or removal candidates. | [SKILL.md](./prune-doc-artifacts/SKILL.md) |
| powershell-script-library | Execution | Review | Maintain a catalog of reusable PowerShell scripts across automation, governance, and orchestration work with strict deduplication. Work with planning/orchestration so new scripts check the catalog first. | [SKILL.md](./powershell-script-library/SKILL.md) |
| refine-ideas | Planning | Review | Use when capturing raw ideas and iteratively refining them through structured challenge loops and targeted topic learning before committing to implementation. | [SKILL.md](./refine-ideas/SKILL.md) |
| request-code-review | Review | Execution | Use when completing tasks, implementing major features, or before merging to verify work meets requirements | [SKILL.md](./request-code-review/SKILL.md) |
| route-customization | Planning | Review | Use when deciding whether a behavior should be implemented as a custom agent, an instruction file, or a reusable skill. | [SKILL.md](./route-customization/SKILL.md) |
| scaffold-dotnet | Execution | Planning | Use when creating a new .NET workspace or solution skeleton and you need standard folders plus reusable build assets applied consistently. | [SKILL.md](./scaffold-dotnet/SKILL.md) |
| security-research | Review | Planning | Use when performing research-only .NET and C# security assessments with evidence-backed remediation reporting. | [SKILL.md](./security-research/SKILL.md) |
| skill-review | Review | Planning | Use when evaluating one or more workspace skills against mandatory quality standards, tracking review history, and producing remediation recommendations. | [SKILL.md](./skill-review/SKILL.md) |
| skills-authoring | Execution | Review | Use when creating new skills, editing existing skills, or verifying skills work before deployment | [SKILL.md](./skills-authoring/SKILL.md) |
| sync-editorconfig | Execution | Review | Use when creating, normalizing, or updating a workspace .editorconfig and validating C# using/type-file policy compliance on demand. | [SKILL.md](./sync-editorconfig/SKILL.md) |
| sync-customizations | Review | Planning | Use when maintaining .instructions.md and .agent.md files over time and evaluating whether their content remains aligned with current workspace standards and external guidance. | [SKILL.md](./sync-customizations/SKILL.md) |
| sync-skills | Review | Planning | Use when maintaining a skill library over time and you need to evaluate source freshness, relevance, and adoption before updating skill content. | [SKILL.md](./sync-skills/SKILL.md) |
| syrx-data-access | Execution | Review | Use when implementing or reviewing .NET repository data access that must use Syrx ICommander, explicit parameterized SQL, and project-approved command configuration patterns. | [SKILL.md](./syrx-data-access/SKILL.md) |
| task-execution | Execution | Planning | Use when executing implementation plans with independent tasks in the current session | [SKILL.md](./task-execution/SKILL.md) |
| task-research | Planning | Review | Use when comprehensive project research is needed before planning or implementation decisions. | [SKILL.md](./task-research/SKILL.md) |
| test-driven-development | Execution | Planning | Use when implementing any feature or bugfix, before writing implementation code | [SKILL.md](./test-driven-development/SKILL.md) |
| validate-customization | Review | Planning | Use when evaluating .instructions.md or .agent.md files against quality standards, detecting duplicate/conflicting guidance, and checking alignment with active agent and skill boundaries. | [SKILL.md](./validate-customization/SKILL.md) |
| write-technical-docs | Execution | Review | Use when generating or refreshing technical reference documentation with code-verified content and link integrity checks. | [SKILL.md](./write-technical-docs/SKILL.md) |
| writing-plans | Planning | Execution | Use when you have a spec or requirements for a multi-step task, before touching code | [SKILL.md](./writing-plans/SKILL.md) |

## Notes

- This index includes local workspace skills under .github/skills.
- If a skill is added, removed, or renamed, update this file in the same change.
- Maintain `Primary Lane` and `Secondary Lane` values using the taxonomy in [planning-execution-review-governance.md](./../../.docs/reference/planning-execution-review-governance.md).

