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
| domain-design | Planning | Execution | Use when designing aggregates, domain events, application service boundaries, and anti-corruption layers for DDD-style .NET solutions. | [SKILL.md](./domain-design/SKILL.md) |
| governance-audit | Review | Planning | Use when assessing the workspace governance layer as a whole — describing what governance is in place, identifying weaknesses and risks across instructions, agents, skills, prompts, and catalog integrity, and producing ranked remediation recommendations. | [SKILL.md](./governance-audit/SKILL.md) |
| execute-customization-audit | Review | Planning | Use when you need one executive governance report that aggregates governance, skills, customization, and optimization audits into a single disposition. | [SKILL.md](./execute-customization-audit/SKILL.md) |
| optimize-customizations | Review | Execution | Use when authoring or reviewing agents, instructions, skills, and prompts to apply concise, deterministic optimization checks and produce actionable remediation. | [SKILL.md](./optimize-customizations/SKILL.md) |
| index-docs | Execution | Planning | Use when building or refreshing navigable INDEX.md files across a document corpus so agentic workflows can discover and navigate documents without reading every file. | [SKILL.md](./index-docs/SKILL.md) |
| layer-boundaries | Execution | Review | Use when implementing or reviewing namespace, assembly, and project-reference boundaries for layered .NET solutions. | [SKILL.md](./layer-boundaries/SKILL.md) |
| librarian | Execution | Review | Use when naming, organizing, or curating a workspace document corpus — applying consistent folder hierarchy, naming rules, and deduplication analysis across any workspace. | [SKILL.md](./librarian/SKILL.md) |
| remediate-review | Review | Execution | Use when receiving code review feedback, before implementing suggestions, especially if feedback seems unclear or technically questionable - requires technical rigor and verification, not performative agreement or blind implementation | [SKILL.md](./remediate-review/SKILL.md) |
| audit-powershell | Review | Execution | Use when auditing PowerShell scripts for safety, reliability, and style issues, and when you need actionable correction recommendations. | [SKILL.md](./audit-powershell/SKILL.md) |
| build-blazor-web-apps | Execution | Review | Use when implementing or reviewing Blazor web applications (.NET Client, Server, or MAUI Hybrid) and you need a repeatable workflow for component architecture, performance, accessibility, security, and testing. | [SKILL.md](./build-blazor-web-apps/SKILL.md) |
| build-maui-apps | Execution | Planning | Use when building or upgrading .NET MAUI mobile apps and you need a repeatable workflow for architecture, navigation, data, security, testing, performance, and release readiness. | [SKILL.md](./build-maui-apps/SKILL.md) |
| branch-completion | Execution | Review | Use when implementation is complete, all tests pass, and you need to decide how to integrate the work - guides completion of development work by presenting structured options for merge, PR, or cleanup | [SKILL.md](./branch-completion/SKILL.md) |
| ci-cd-workflows | Execution | Review | Use when authoring or reviewing GitHub Actions workflows for secure, reliable CI/CD delivery. | [SKILL.md](./ci-cd-workflows/SKILL.md) |
| critical-thinking | Planning | Review | Use when pressure-testing assumptions, clarifying requirements, and evaluating trade-offs before implementation. | [SKILL.md](./critical-thinking/SKILL.md) |
| learn-topics | Planning | Execution | Use when building a specialist learning path that decomposes a topic by depth and produces a source-backed learning map with optional skill/customization generation. | [SKILL.md](./learn-topics/SKILL.md) |
| compose-skills | Planning | Execution | Use when a request needs deterministic multi-skill composition through an explicit orchestration contract while preserving skill self-containment. | [SKILL.md](./compose-skills/SKILL.md) |
| prototype-mobile-ui | Planning | Execution | Use when evolving low-fidelity wireframes into high-fidelity interactive prototypes with production-ready visual systems, component tokens, and annotated handoff artifacts. | [SKILL.md](./prototype-mobile-ui/SKILL.md) |
| curate-copilot-instructions | Execution | Planning | Use when importing skills, agents, or instructions from a catalogue and updating copilot-instructions.md to leverage them. | [SKILL.md](./curate-copilot-instructions/SKILL.md) |
| current-test-coverage | Review | Execution | Use when a user asks for the current or latest test coverage and wants fresh coverage metrics from this session instead of previously recorded numbers. | [SKILL.md](./current-test-coverage/SKILL.md) |
| agent-authoring | Execution | Review | Use when creating or editing .agent.md files, including frontmatter fixes, role boundary tightening, and companion-skill alignment. | [SKILL.md](./agent-authoring/SKILL.md) |
| delivery-status-grid | Review | Planning | Use when a user asks for delivery status, progress, completion state, or remaining scope and expects table-first reporting with explicit X of Y measures. | [SKILL.md](./delivery-status-grid/SKILL.md) |
| design-mobile-ux | Planning | Execution | Use when defining or improving iOS/Android mobile UX and you need a practical flow from research to wireframes, validation, and implementation handoff. | [SKILL.md](./design-mobile-ux/SKILL.md) |
| docker-dotnet | Execution | Review | Use when containerizing .NET applications, authoring or reviewing Dockerfiles and docker-compose files, optimizing image builds, or applying container security practices in .NET solutions. | [SKILL.md](./docker-dotnet/SKILL.md) |
| dotnet-refactor | Execution | Review | Use when modernizing .NET code with safe, behavior-preserving improvements such as nullable adoption and obsolete API cleanup. | [SKILL.md](./dotnet-refactor/SKILL.md) |
| async-programming | Execution | Review | Use when implementing or reviewing async/await and concurrency behavior in .NET code, including ValueTask decisions and streaming backpressure. | [SKILL.md](./async-programming/SKILL.md) |
| dotnet-resilience | Execution | Review | Use when designing, implementing, or reviewing .NET distributed-system resiliency with Microsoft.Extensions.Resilience and Polly, including safe strategy composition and failure-mode validation. | [SKILL.md](./dotnet-resilience/SKILL.md) |
| plans | Execution | Review | Use when you have a written implementation plan to execute in a separate session with review checkpoints | [SKILL.md](./plans/SKILL.md) |
| instructions-authoring | Execution | Review | Use when creating or editing .instructions.md files, including policy-domain scoping, applyTo correction, and deterministic rule tightening. | [SKILL.md](./instructions-authoring/SKILL.md) |
| governance-summarize | Review | Planning | Use when you need a concise, single-page governance briefing that aggregates the most salient findings, risks, and actions across governance artifacts. | [SKILL.md](./governance-summarize/SKILL.md) |
| perf-benchmark | Review | Planning | Use when designing, running, or reviewing BenchmarkDotNet performance tests in .NET solutions and workspaces. | [SKILL.md](./perf-benchmark/SKILL.md) |
| performance-research | Review | Planning | Use when performing research-only .NET and C# performance assessments with evidence-backed remediation reporting. | [SKILL.md](./performance-research/SKILL.md) |
| prd-generator | Planning | Review | Use when creating comprehensive, traceable PRDs for features, products, or epics before implementation begins. | [SKILL.md](./prd-generator/SKILL.md) |
| prune-doc-artifacts | Review | Execution | Use when auditing .docs planning and execution artifacts to identify stale, superseded, or generated leftovers and produce safe archive or removal candidates. | [SKILL.md](./prune-doc-artifacts/SKILL.md) |
| prune-sync-assets | Execution | Review | Use when decommissioning sync-managed assets that are no longer present in source manifests, with explicit approval and safe-delete controls. | [SKILL.md](./prune-sync-assets/SKILL.md) |
| powershell-script-library | Execution | Review | Maintain a catalog of reusable PowerShell scripts across automation, governance, and orchestration work with strict deduplication. Work with planning/orchestration so new scripts check the catalog first. | [SKILL.md](./powershell-script-library/SKILL.md) |
| refine-ideas | Planning | Review | Use when capturing raw ideas and iteratively refining them through structured challenge loops and targeted topic learning before committing to implementation. | [SKILL.md](./refine-ideas/SKILL.md) |
| request-code-review | Review | Execution | Use when completing tasks, implementing major features, or before merging to verify work meets requirements | [SKILL.md](./request-code-review/SKILL.md) |
| route-customization | Planning | Review | Use when deciding whether a behavior should be implemented as a custom agent, an instruction file, or a reusable skill. | [SKILL.md](./route-customization/SKILL.md) |
| scaffold-dotnet | Execution | Planning | Use when creating a new .NET workspace or solution skeleton and you need standard folders plus reusable build assets applied consistently. | [SKILL.md](./scaffold-dotnet/SKILL.md) |
| sql-server-standards | Execution | Review | Use when authoring or reviewing T-SQL for SQL Server with safety, parameterization, naming, and compatibility standards. | [SKILL.md](./sql-server-standards/SKILL.md) |
| security-research | Review | Planning | Use when performing research-only .NET and C# security assessments with evidence-backed remediation reporting. | [SKILL.md](./security-research/SKILL.md) |
| audit-skill | Review | Planning | Use when evaluating one or more workspace skills against mandatory quality standards, tracking review history, and producing remediation recommendations. | [SKILL.md](./audit-skill/SKILL.md) |
| audit-agent | Review | Planning | Use when evaluating one or more workspace .agent.md files against mandatory quality standards, tracking review history, and producing platform-currency-aware remediation recommendations. | [SKILL.md](./audit-agent/SKILL.md) |
| skills-authoring | Execution | Review | Use when creating new skills, editing existing skills, or verifying skills work before deployment | [SKILL.md](./skills-authoring/SKILL.md) |
| sync-compendium | Execution | Review | Use when importing or updating this compendium in target repositories with explicit approval gates, source attribution, and bespoke-safe merge handling. | [SKILL.md](./sync-compendium/SKILL.md) |
| sync-editorconfig | Execution | Review | Use when creating, normalizing, or updating a workspace .editorconfig and validating C# using/type-file policy compliance on demand. | [SKILL.md](./sync-editorconfig/SKILL.md) |
| sync-customizations | Review | Planning | Use when maintaining .instructions.md and .agent.md files over time and evaluating whether their content remains aligned with current workspace standards and external guidance. | [SKILL.md](./sync-customizations/SKILL.md) |
| sync-skills | Review | Planning | Use when maintaining a skill library over time and you need to evaluate source freshness, relevance, and adoption before updating skill content. | [SKILL.md](./sync-skills/SKILL.md) |
| asset-naming-taxonomy | Execution | Review | Use when defining or enforcing consistent naming taxonomy and conventions across governance reports, customization assets, documentation, and code artifacts. | [SKILL.md](./asset-naming-taxonomy/SKILL.md) |
| syrx-data-access | Execution | Review | Use when implementing or reviewing .NET repository data access that must use Syrx ICommander, explicit parameterized SQL, and project-approved command configuration patterns. | [SKILL.md](./syrx-data-access/SKILL.md) |
| syrx-validation | Review | Execution | Use when applying or reviewing Syrx.Validation.Contract guard patterns at public boundaries with deterministic validation outcomes. | [SKILL.md](./syrx-validation/SKILL.md) |
| task-execution | Execution | Planning | Use when executing implementation plans with independent tasks in the current session | [SKILL.md](./task-execution/SKILL.md) |
| task-research | Planning | Review | Use when comprehensive project research is needed before planning or implementation decisions. | [SKILL.md](./task-research/SKILL.md) |
| test-driven-development | Execution | Planning | Use when implementing any feature or bugfix, before writing implementation code | [SKILL.md](./test-driven-development/SKILL.md) |
| usability-test-scripts | Planning | Execution | Use when preparing structured usability test scenarios, task scripts, and scoring rubrics for mobile app UX validation with 5+ participants before or after launch. | [SKILL.md](./usability-test-scripts/SKILL.md) |
| audit-instructions | Review | Execution | Use when evaluating one or more workspace .instructions.md files against mandatory quality standards, tracking review history, and producing source-aware remediation recommendations. | [SKILL.md](./audit-instructions/SKILL.md) |
| audit-prompts | Review | Execution | Use when evaluating one or more workspace .prompt.md files against mandatory quality standards, tracking review history, and producing source-aware remediation recommendations. | [SKILL.md](./audit-prompts/SKILL.md) |
| audit-customization-types | Review | Execution | Use when auditing customization types and cross-type interactions across agents, instructions, prompts, and skills with deterministic, grid-first governance outcomes. | [SKILL.md](./audit-customization-types/SKILL.md) |
| write-technical-docs | Execution | Review | Use when generating or refreshing technical reference documentation with code-verified content and link integrity checks. | [SKILL.md](./write-technical-docs/SKILL.md) |
| writing-plans | Planning | Execution | Use when you have a spec or requirements for a multi-step task, before touching code | [SKILL.md](./writing-plans/SKILL.md) |
| design-web-ux | Planning | Execution | Use when defining or improving web application UX and you need a practical flow from user research through component specification and engineering handoff. | [SKILL.md](./design-web-ux/SKILL.md) |
| build-web-frontend | Execution | Review | Use when implementing or reviewing web frontend components, pages, and API integrations and you need a repeatable workflow for architecture, accessibility, performance, security, and testing. | [SKILL.md](./build-web-frontend/SKILL.md) |
| build-mobile-apps | Execution | Review | Use when building or reviewing cross-platform mobile apps (MAUI or React Native) and you need a repeatable workflow for architecture, navigation, offline data, security, testing, and release readiness. | [SKILL.md](./build-mobile-apps/SKILL.md) |
| analysis-execution | Execution | Planning | Use when discovery work must produce traceable requirements — covers assumption ledger, contradiction logging, requirement hardening, and synthesis. | [SKILL.md](./analysis-execution/SKILL.md) |
| release-readiness | Execution | Review | Use before any promotion — covers gate checklist, rollback validation, smoke coordination, evidence collation, and go/no-go sign-off. | [SKILL.md](./release-readiness/SKILL.md) |
| test-design-review | Review | Planning | Use when entering the TEST phase or when a test plan requires review — covers strategy evaluation, traceability, exit criteria, and multi-discipline coverage. | [SKILL.md](./test-design-review/SKILL.md) |
| governance-delivery | Planning | Review | Use when a delivery initiative spans multiple disciplines or teams — covers RAID log, dependency map, milestone tracking, and delivery coordination. | [SKILL.md](./governance-delivery/SKILL.md) |
| operability-design | Execution | Planning | Use during DESIGN or IMPLEMENTATION when support readiness must be designed in — covers runbooks, alert matrix, observability requirements, and support handoff. | [SKILL.md](./operability-design/SKILL.md) |
| matrix-skill-mapping | Review | Planning | Use when maintaining Phase / Discipline / Lane matrix-to-skill ownership mappings and bundle drift checks while keeping individual skills self-contained. | [SKILL.md](./matrix-skill-mapping/SKILL.md) |
| acceptance-governance | Review | Execution | Use when reviewing completed artifacts across any discipline and producing severity-tagged findings with explicit sign-off disposition. | [SKILL.md](./acceptance-governance/SKILL.md) |
| test-orchestration | Execution | Review | Use when coordinating multi-disciplinary test passes and collating evidence from Engineering, Architecture, Security, Performance, UX, and Support into a release-ready verdict. | [SKILL.md](./test-orchestration/SKILL.md) |
| product-scope-slicing | Planning | Execution | Use when converting product intent or outcome statements into prioritised, acceptance-ready delivery slices and release candidates. | [SKILL.md](./product-scope-slicing/SKILL.md) |
| support-triage | Execution | Review | Use when an incident or ticket needs structured intake, severity classification, repro data collection, and routing before investigation begins. | [SKILL.md](./support-triage/SKILL.md) |
| post-release-retrospective | Review | Execution | Use after a production promotion to capture release outcomes, stabilisation findings, lessons, and follow-up actions. | [SKILL.md](./post-release-retrospective/SKILL.md) |
| customer-feedback-synthesis | Planning | Execution | Use when converting support tickets, UX findings, and product signals into prioritised, roadmap-ready insights with source traceability. | [SKILL.md](./customer-feedback-synthesis/SKILL.md) |
| support-runbook-generator | Execution | Review | Use when producing support runbooks, escalation guides, and handoff packets for operational teams. | [SKILL.md](./support-runbook-generator/SKILL.md) |
| taxonomy-tag-registry | Review | Planning | Use when maintaining consistent Phase x Discipline x Lane tags across catalogs and artifacts to detect and correct taxonomy drift. | [SKILL.md](./taxonomy-tag-registry/SKILL.md) |
| experiment-design | Planning | Execution | Use when designing technical spikes, threat experiments, benchmark experiments, or usability tests with hypothesis, success criteria, and time-box before execution. | [SKILL.md](./experiment-design/SKILL.md) |
| release-simulation | Execution | Review | Use when rehearsing a production promotion — rollback drills, promotion rehearsals, and gap assessment for high-risk releases. | [SKILL.md](./release-simulation/SKILL.md) |
| data-design | Execution | Planning | Use when designing the data layer — schema design, migration planning, data governance requirements, and query optimisation strategy. | [SKILL.md](./data-design/SKILL.md) |
| sre-practices | Planning | Execution | Use when defining SLOs, designing error budget policy, or structuring reliability engineering and toil-reduction work. | [SKILL.md](./sre-practices/SKILL.md) |

## Notes

- This index includes local workspace skills under .github/skills.
- Keep these two skills separate unless a formal consolidation plan is approved: `taxonomy-tag-registry` owns PDL Phase/Discipline/Lane value consistency, while `asset-naming-taxonomy` owns asset naming classification and vocabulary drift.
- PDL matrix coverage (canonical): [phase-discipline-lane-agentic-delivery-matrix.md](./matrix-skill-mapping/references/phase-discipline-lane-agentic-delivery-matrix.md). Posterity copy: [phase-discipline-lane-agentic-delivery-matrix.md](../.docs/plans/governance/taxonomy-tag-registry/phase-discipline-lane-agentic-delivery-matrix.md).
- If a skill is added, removed, or renamed, update this file in the same change.
- Maintain `Primary Lane` and `Secondary Lane` values using the taxonomy in [planning-execution-review-governance.md](./governance-audit/references/planning-execution-review-governance.md).
- For economical customization generation, use [customization-generation-template.md](./instructions-authoring/references/customization-generation-template.md) as the canonical optional scaffold.
- Deterministic capability mapping and routing benchmarks are maintained in [capability-routing-registry.json](./compose-skills/references/capability-routing-registry.json) and [routing-benchmark-cases.json](./compose-skills/references/routing-benchmark-cases.json).


