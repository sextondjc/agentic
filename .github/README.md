# .github Customization Index

This file catalogs the active customization assets under `.github` and summarizes the purpose of each one. Canonical lane mappings remain in the category catalogs under `agents`, `instructions`, `prompts`, and `skills`.

## Inventory Summary

| Category | Count | Purpose | Canonical Catalog |
|---|---:|---|---|
| Workspace hub | 1 | Defines workspace-wide behavior, routing preferences, and preferred assets. | [copilot-instructions.md](./copilot-instructions.md) |
| Agents | 15 | Specialist agent modes invoked explicitly for narrow responsibilities. | [agent-lifecycle-catalog.md](./agent-lifecycle-catalog.md) |
| Skills | 51 | Reusable workflows and domain playbooks used before or during implementation. | [skill-discovery-index.md](./skills/skill-discovery-index.md) |
| Instructions | 16 | Always-on policy files applied by `applyTo` scope. | [instruction-lifecycle-catalog.md](./instructions/instruction-lifecycle-catalog.md) |
| Prompts | 17 | Reusable prompt templates for repeatable governance and delivery workflows. | [prompt-lifecycle-catalog.md](./prompts/prompt-lifecycle-catalog.md) |
| PowerShell scripts | 5 | Reusable automation helpers for governance validation and inventory checks. | [README.md](./scripts/powershell/README.md) |
| GitHub workflows | 1 | Scheduled or on-demand automation that enforces governance checks. | [governance-cadence.yml](./workflows/governance-cadence.yml) |

## Workspace Hub

| Asset | Purpose |
|---|---|
| [copilot-instructions.md](./copilot-instructions.md) | Defines repository intent, canonical engineering standards, lifecycle lane model, preferred agents and skills, imported assets, and workspace design rules. |

## Agents

Agents are explicit specialist entry points. Lane ownership and rationale are maintained in [agent-lifecycle-catalog.md](./agent-lifecycle-catalog.md).

| Asset | Purpose |
|---|---|
| [architecture-designer.agent.md](./agents/architecture-designer.agent.md) | Architectural specialist for boundaries, ADRs, and blueprint-level design decisions. |
| [benchmark-researcher.agent.md](./agents/benchmark-researcher.agent.md) | BenchmarkDotNet-focused research specialist for benchmark design and analysis without production implementation. |
| [code-reviewer.agent.md](./agents/code-reviewer.agent.md) | Reviews completed work against plans, requirements, and active workspace standards. |
| [csharp-engineer.agent.md](./agents/csharp-engineer.agent.md) | Default .NET implementation specialist for writing and modifying C# code and tests. |
| [defect-debugger.agent.md](./agents/defect-debugger.agent.md) | Reproduces, isolates, and fixes concrete defects with verification. |
| [governance-briefer.agent.md](./agents/governance-briefer.agent.md) | Produces concise governance briefings from existing governance artifacts. |
| [topic-learner.agent.md](./agents/topic-learner.agent.md) | Builds source-backed learning maps and decomposes topics by depth. |
| [manual-code-reviewer.agent.md](./agents/manual-code-reviewer.agent.md) | Records manual code review observations into structured review artifacts during live inspection. |
| [orchestrator.agent.md](./agents/orchestrator.agent.md) | Routes mixed or ambiguous work to the correct specialist and preserves lifecycle boundaries. |
| [performance-assessor.agent.md](./agents/performance-assessor.agent.md) | Performs research-only performance assessment and remediation reporting. |
| [plan-researcher.agent.md](./agents/plan-researcher.agent.md) | Produces research notes, implementation plans, and executable checklists before build work starts. |
| [powershell-reviewer.agent.md](./agents/powershell-reviewer.agent.md) | Reviews PowerShell for safety, automation readiness, and maintainability. |
| [security-researcher.agent.md](./agents/security-researcher.agent.md) | Performs report-first security assessment without implementing fixes. |
| [sql-dba.agent.md](./agents/sql-dba.agent.md) | Handles operational SQL Server administration, schema inspection, and database changes. |
| [workspace-scaffolder.agent.md](./agents/workspace-scaffolder.agent.md) | Scaffolds new workspaces and establishes baseline configuration and customization assets. |

## Skills

Skills are reusable workflows. Lane ownership and deeper usage guidance are maintained in [skill-discovery-index.md](./skills/skill-discovery-index.md).

| Skill | File | Purpose |
|---|---|---|
| `adr-generator` | [SKILL.md](./skills/adr-generator/SKILL.md) | Documents architectural decisions in `.docs/adr` with rationale, alternatives, and consequences. |
| `api-design` | [SKILL.md](./skills/api-design/SKILL.md) | Designs external API integrations with resilient client patterns, DTO contracts, and clear boundaries. |
| `governance-audit` | [SKILL.md](./skills/governance-audit/SKILL.md) | Assesses the workspace governance layer and produces ranked remediation guidance. |
| `audit-powershell` | [SKILL.md](./skills/audit-powershell/SKILL.md) | Audits PowerShell scripts for safety, reliability, and style issues. |
| `branch-completion` | [SKILL.md](./skills/branch-completion/SKILL.md) | Guides branch completion decisions after implementation and testing are finished. |
| `build-maui-apps` | [SKILL.md](./skills/build-maui-apps/SKILL.md) | Provides a repeatable workflow for building or upgrading .NET MAUI applications. |
| `critical-thinking` | [SKILL.md](./skills/critical-thinking/SKILL.md) | Pressure-tests assumptions, clarifies requirements, and evaluates trade-offs before implementation. |
| `current-test-coverage` | [SKILL.md](./skills/current-test-coverage/SKILL.md) | Collects fresh test coverage metrics for the current session. |
| `curate-copilot-instructions` | [SKILL.md](./skills/curate-copilot-instructions/SKILL.md) | Imports customizations and updates `copilot-instructions.md` to reflect active assets. |
| `agent-authoring` | [SKILL.md](./skills/agent-authoring/SKILL.md) | Creates or edits `.agent.md` files with explicit role boundaries and companion-skill alignment. |
| `instructions-authoring` | [SKILL.md](./skills/instructions-authoring/SKILL.md) | Creates or edits `.instructions.md` files with deterministic policy scope and correct `applyTo` patterns. |
| `delivery-status-grid` | [SKILL.md](./skills/delivery-status-grid/SKILL.md) | Produces grid-first delivery status reporting with explicit completion and remaining scope. |
| `design-mobile-ux` | [SKILL.md](./skills/design-mobile-ux/SKILL.md) | Defines or improves mobile UX from research through implementation handoff. |
| `docker-dotnet` | [SKILL.md](./skills/docker-dotnet/SKILL.md) | Containerizes .NET applications and applies container-focused security and build practices. |
| `dotnet-refactor` | [SKILL.md](./skills/dotnet-refactor/SKILL.md) | Modernizes .NET code with safe, behavior-preserving refactors. |
| `dotnet-resilience` | [SKILL.md](./skills/dotnet-resilience/SKILL.md) | Designs and reviews .NET resiliency using Microsoft.Extensions.Resilience and Polly. |
| `plans` | [SKILL.md](./skills/plans/SKILL.md) | Executes approved implementation plans in a dedicated or later session. |
| `execute-customization-audit` | [SKILL.md](./skills/execute-customization-audit/SKILL.md) | Produces one executive governance report by aggregating all source audit outputs. |
| `governance-delivery` | [SKILL.md](./skills/governance-delivery/SKILL.md) | Coordinates multi-discipline delivery governance, dependencies, milestones, and RAID tracking. |
| `optimize-customizations` | [SKILL.md](./skills/optimize-customizations/SKILL.md) | Runs optimization-factor reviews for agents, instructions, prompts, and skills with ranked remediation guidance. |
| `asset-naming-taxonomy` | [SKILL.md](./skills/asset-naming-taxonomy/SKILL.md) | Defines and enforces naming taxonomy and conventions across governance and customization assets. |
| `learn-topics` | [SKILL.md](./skills/learn-topics/SKILL.md) | Builds source-backed learning paths that decompose topics by depth. |
| `prototype-mobile-ui` | [SKILL.md](./skills/prototype-mobile-ui/SKILL.md) | Evolves low-fidelity mobile concepts into high-fidelity prototypes and handoff assets. |
| `perf-benchmark` | [SKILL.md](./skills/perf-benchmark/SKILL.md) | Designs, runs, or reviews BenchmarkDotNet performance tests. |
| `performance-research` | [SKILL.md](./skills/performance-research/SKILL.md) | Performs research-only .NET and C# performance assessments with evidence-backed reporting. |
| `powershell-script-library` | [SKILL.md](./skills/powershell-script-library/SKILL.md) | Maintains the reusable PowerShell script catalog with deduplication and catalog-first reuse. |
| `prd-generator` | [SKILL.md](./skills/prd-generator/SKILL.md) | Produces comprehensive, traceable PRDs before implementation begins. |
| `prune-doc-artifacts` | [SKILL.md](./skills/prune-doc-artifacts/SKILL.md) | Audits `.docs` artifacts to identify stale, superseded, or removable documentation. |
| `refine-ideas` | [SKILL.md](./skills/refine-ideas/SKILL.md) | Refines raw ideas through structured challenge loops and targeted topic learning. |
| `remediate-review` | [SKILL.md](./skills/remediate-review/SKILL.md) | Evaluates code review feedback critically before implementing remediation. |
| `request-code-review` | [SKILL.md](./skills/request-code-review/SKILL.md) | Requests structured review once implementation work is ready for evaluation. |
| `route-customization` | [SKILL.md](./skills/route-customization/SKILL.md) | Decides whether a behavior belongs in an agent, instruction, or skill. |
| `scaffold-dotnet` | [SKILL.md](./skills/scaffold-dotnet/SKILL.md) | Scaffolds new .NET workspace or solution structures with standard folders and assets. |
| `security-research` | [SKILL.md](./skills/security-research/SKILL.md) | Performs research-only .NET and C# security assessments with remediation reporting. |
| `audit-skill` | [SKILL.md](./skills/audit-skill/SKILL.md) | Evaluates skills against quality standards and records remediation recommendations. |
| `audit-instructions` | [SKILL.md](./skills/audit-instructions/SKILL.md) | Evaluates `.instructions.md` files against instruction-quality standards and records source-aware remediation recommendations. |
| `audit-prompts` | [SKILL.md](./skills/audit-prompts/SKILL.md) | Evaluates `.prompt.md` files against prompt-quality standards and records source-aware remediation recommendations. |
| `audit-customization-types` | [SKILL.md](./skills/audit-customization-types/SKILL.md) | Audits type-level and cross-type interactions across customization domains with deterministic, grid-first governance outcomes. |
| `skills-authoring` | [SKILL.md](./skills/skills-authoring/SKILL.md) | Creates, edits, and verifies reusable skills before deployment. |
| `governance-summarize` | [SKILL.md](./skills/governance-summarize/SKILL.md) | Produces a concise governance briefing from existing governance artifacts. |
| `sync-customizations` | [SKILL.md](./skills/sync-customizations/SKILL.md) | Maintains instruction and agent customizations over time and checks alignment. |
| `sync-editorconfig` | [SKILL.md](./skills/sync-editorconfig/SKILL.md) | Creates or normalizes `.editorconfig` and validates policy compliance. |
| `sync-skills` | [SKILL.md](./skills/sync-skills/SKILL.md) | Maintains the skill library by evaluating source freshness, relevance, and adoption. |
| `syrx-data-access` | [SKILL.md](./skills/syrx-data-access/SKILL.md) | Implements or reviews Syrx-based repository data access with explicit SQL patterns. |
| `syrx-validation` | [SKILL.md](./skills/syrx-validation/SKILL.md) | Applies or reviews Syrx.Validation.Contract guard patterns at public boundaries with deterministic outcomes. |
| `task-execution` | [SKILL.md](./skills/task-execution/SKILL.md) | Executes implementation plans as independent tasks within the current session. |
| `task-research` | [SKILL.md](./skills/task-research/SKILL.md) | Performs comprehensive project research before planning or implementation decisions. |
| `test-driven-development` | [SKILL.md](./skills/test-driven-development/SKILL.md) | Applies a TDD workflow before writing feature or bugfix implementation code. |
| `usability-test-scripts` | [SKILL.md](./skills/usability-test-scripts/SKILL.md) | Prepares usability test scenarios, task scripts, and scoring rubrics for mobile UX validation. |
| `write-technical-docs` | [SKILL.md](./skills/write-technical-docs/SKILL.md) | Generates or refreshes technical reference documentation with code-verified content. |
| `writing-plans` | [SKILL.md](./skills/writing-plans/SKILL.md) | Produces implementation plans from specs or requirements before execution starts. |

## Instructions

Instruction lane mappings and rationales are maintained in [instruction-lifecycle-catalog.md](./instructions/instruction-lifecycle-catalog.md).

| Asset | Purpose |
|---|---|
| [architecture.instructions.md](./instructions/architecture.instructions.md) | Governs architecture, DDD, SOLID, and domain boundary decisions. |
| [async-programming.instructions.md](./instructions/async-programming.instructions.md) | Governs async, concurrency, and `ValueTask` usage patterns. |
| [ci-cd.instructions.md](./instructions/ci-cd.instructions.md) | Governs secure and efficient GitHub Actions and CI/CD practices. |
| [csharp.instructions.md](./instructions/csharp.instructions.md) | Governs C# style, development practices, and engineering standards. |
| [governance-lifecycle.instructions.md](./instructions/governance-lifecycle.instructions.md) | Governs planning, execution, review lanes and traceable handoffs. |
| [governance-naming-conventions.instructions.md](./instructions/governance-naming-conventions.instructions.md) | Governs naming for agents, skills, instructions, and prompts. |
| [namespace-boundaries.instructions.md](./instructions/namespace-boundaries.instructions.md) | Governs namespace and assembly boundaries to minimize coupling. |
| [powershell.instructions.md](./instructions/powershell.instructions.md) | Governs safe, idiomatic, and maintainable PowerShell scripting. |
| [prd.instructions.md](./instructions/prd.instructions.md) | Governs PRD and specification authoring quality. |
| [secure-coding.instructions.md](./instructions/secure-coding.instructions.md) | Governs secure coding defaults, data handling, and review expectations. |
| [sql-dba.instructions.md](./instructions/sql-dba.instructions.md) | Governs SQL Server standards for T-SQL safety, naming, and compatibility. |
| [syrx.instructions.md](./instructions/syrx.instructions.md) | Governs approved Syrx repository and SQL Server usage. |
| [governance-release.instructions.md](./instructions/governance-release.instructions.md) | Governs release evidence, approvals, rollback documentation, and release notes format. |
| [task-implementation.instructions.md](./instructions/task-implementation.instructions.md) | Governs plan execution boundaries and change traceability artifacts. |
| [technical-docs.instructions.md](./instructions/technical-docs.instructions.md) | Governs README and technical documentation standards. |
| [testing-strategy.instructions.md](./instructions/testing-strategy.instructions.md) | Governs testing strategy, naming, patterns, and tooling. |
| [validation.instructions.md](./instructions/validation.instructions.md) | Governs standardized guard usage and validation rationale. |

## Prompts

Prompt lane mappings and rationales are maintained in [prompt-lifecycle-catalog.md](./prompts/prompt-lifecycle-catalog.md).

| Asset | Purpose |
|---|---|
| [execute-artifact-condense.prompt.md](./prompts/execute-artifact-condense.prompt.md) | Returns concise rewrite recommendations for one artifact or a full artifact set without applying edits. |
| [curate-copilot.prompt.md](./prompts/curate-copilot.prompt.md) | Discovers imported customizations and updates the workspace hub file accordingly. |
| [execute-manual-review.prompt.md](./prompts/execute-manual-review.prompt.md) | Applies recorded manual review findings and validates remediation work. |
| [generate-readme.prompt.md](./prompts/generate-readme.prompt.md) | Produces consolidated repository README output. |
| [execute-customization-audit.prompt.md](./prompts/execute-customization-audit.prompt.md) | Canonical executive aggregation governance report for full-workspace disposition. |
| [governance-audit-types.prompt.md](./prompts/governance-audit-types.prompt.md) | Canonical type deep-scan governance report across and between customization types. |
| [governance-item-audit.prompt.md](./prompts/governance-item-audit.prompt.md) | Canonical item deep-scan governance report for one customization item. |
| [optimize-customizations.prompt.md](./prompts/optimize-customizations.prompt.md) | Runs an on-demand optimization-factor review for agents, instructions, skills, and prompts. |
| [performance-research.prompt.md](./prompts/performance-research.prompt.md) | Produces performance assessment output without implementation. |
| [review-project.prompt.md](./prompts/review-project.prompt.md) | Verifies plan alignment, artifact hygiene, and scope integrity before another execution wave. |
| [execute-delivery.prompt.md](./prompts/execute-delivery.prompt.md) | Resumes an active execution slice with traceability-first status and routing checks. |
| [review-technical-docs.prompt.md](./prompts/review-technical-docs.prompt.md) | Evaluates and remediates technical documentation quality and completeness. |
| [security-research.prompt.md](./prompts/security-research.prompt.md) | Produces security assessment output without implementation. |
| [execute-testing-xunit.prompt.md](./prompts/execute-testing-xunit.prompt.md) | Produces xUnit-aligned test artifacts and guidance. |
| [workspace-scaffolder.prompt.md](./prompts/workspace-scaffolder.prompt.md) | Produces workspace scaffolding and setup artifacts. |
| [write-component-docs.prompt.md](./prompts/write-component-docs.prompt.md) | Produces technical component documentation artifacts. |

## PowerShell Scripts

The reusable script catalog and usage guidance are maintained in [README.md](./scripts/powershell/README.md).

| Asset | Purpose |
|---|---|
| [get-lane-counts.ps1](./scripts/powershell/get-lane-counts.ps1) | Counts agents, skills, instructions, or prompts by lifecycle lane. |
| [test-catalog-integrity.ps1](./scripts/powershell/test-catalog-integrity.ps1) | Detects missing or stale entries in customization catalogs. |
| [test-frontmatter-validity.ps1](./scripts/powershell/test-frontmatter-validity.ps1) | Validates frontmatter structure for instructions, agents, and prompts. |
| [test-governance-link-graph.ps1](./scripts/powershell/test-governance-link-graph.ps1) | Validates local markdown links and fragment anchors across governance docs. |
| [test-hub-file-sync.ps1](./scripts/powershell/test-hub-file-sync.ps1) | Verifies that `copilot-instructions.md` preferred lists stay synchronized with actual assets. |

## GitHub Workflows

| Asset | Purpose |
|---|---|
| [governance-cadence.yml](./workflows/governance-cadence.yml) | Runs monthly and on demand to validate frontmatter, catalog integrity, and workspace hub synchronization. |


