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
- Use `__DOCS_ROOT__/plans`, `__DOCS_ROOT__/research`, `__DOCS_ROOT__/changes`, and `__DOCS_ROOT__/adr` as canonical documentation locations.
- Keep mandatory policy guidance in concise instruction files under `.github/instructions` and move procedural depth into skills.

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
| `topic-learner` | Building deep topic mastery maps with depth control, specialist decomposition, and source-backed learning plans. |
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
| `ux-designer` | UX research, wireframes, prototype definition, usability validation, and engineering handoff across web and mobile surfaces. |
| `web-frontend-engineer` | Implementing and reviewing web frontend code: HTML, CSS, TypeScript, component architecture, accessibility, Core Web Vitals, and frontend security. |
| `mobile-frontend-engineer` | Cross-platform mobile frontend engineering using MAUI or React Native: architecture, navigation, offline data, security, testing, and release readiness. |

## Skills Discovery

Use [skill-discovery-index.md](./skills/skill-discovery-index.md) as the single source of truth for the full skill inventory and lane mapping.

When requests route through `orchestrator`, discover and select relevant skills from the index instead of maintaining a duplicated skills list here.

## Preferred Skills

Use these skills as the default PM and delivery bundle when work needs agent-usable planning, execution control, and release-ready handoffs across projects.

- `delivery-orchestration` - Umbrella lifecycle intake for work that spans request intake, planning, execution control, forecasting, release, change control, and post-ship learning.
- `delivery-operating-system` - Default intake for project management and delivery operating model work spanning discovery, planning, execution flow, release control, and learning loops.
- `opportunity-mapping` - Turn goals, requests, and discovery inputs into explicit opportunity trees, solution hypotheses, and assumption-test plans.
- `backlog-structuring` - Define backlog hierarchy, item schema, ready-state rules, and deferral discipline for portable execution planning.
- `acceptance-criteria` - Convert slices and work items into testable done gates, scenario boundaries, and agent-usable completion rules.
- `flow-metrics` - Establish workflow states, WIP policy, flow metrics, and escalation rules for measurable delivery control.

Use adjacent existing skills with this bundle when the project needs them:

- `work-intake-governance` for pre-backlog admission control across requests, incidents, and stakeholder asks.
- `delivery-forecasting` for confidence-based scope and date forecasting from flow evidence.
- `outcome-review` for expected-versus-actual post-ship decision making.
- `product-scope-slicing` for release candidate decomposition and prioritised slices.
- `governance-delivery` for RAID management, dependency mapping, and milestone tracking.
- `release-readiness` for promotion evidence, rollback confirmation, and go/no-go sign-off.
- `scope-change-control` for mid-flight scope additions, descopes, swaps, and exception handling when delivery is under change pressure.

Use this SQL Server bundle when requests target T-SQL, DBA operations, performance investigation, or SQL security across projects:

- `orchestrate-sql-server` for one SQL intake that spans multiple capability areas.
- `sql-server-standards` for safe, parameterized, version-aware SQL authoring and review.
- `sql-server-diagnostics` for evidence-first SQL Server bottleneck and health triage.
- `sql-server-query-tuning` for execution-plan and Query Store driven performance improvement.
- `sql-server-security` for permissions, auditing, encryption, and SQL surface-area hardening.
- `sql-server-automation` for repeatable operational workflows using DBA-safe automation patterns.

Use this C# delivery bundle when requests span language quality, async behavior, architectural integrity, and cross-phase orchestration across projects:

- `orchestrate-csharp` for one C# intake that spans multiple capability areas with deterministic ownership.
- `csharp-language-quality-gate` for evidence-first language and API-contract quality decisions.
- `csharp-async-quality-gate` for evidence-first async and concurrency quality decisions.
- `csharp-architecture-quality-gate` for evidence-first boundary, repository, and validation quality decisions.
- `csharp-testing-quality-gate` for evidence-first testing quality decisions across coverage intent, failure paths, and deterministic assertions.
- `csharp-data-access-quality-gate` for evidence-first repository, SQL safety, and immutable contract quality decisions.
- `csharp-release-quality-gate` for one consolidated go/no-go decision across language, async, architecture, testing, and data-access evidence.

Use this xUnit testing bundle when requests span xUnit source curation, test design, fixture lifecycle, async test behavior, Moq collaboration patterns, and expert-level test quality decisions across projects:

- `orchestrate-xunit` for one xUnit intake that spans multiple capability areas with deterministic ownership.
- `xunit-source-curation` for authoritative source selection, freshness checks, and reusable guidance baselines.
- `xunit-test-design` for expert Fact/Theory shaping, data strategy selection, and boundary-focused coverage design.
- `xunit-fixture-lifecycle` for fixture scope selection, cleanup lifecycle decisions, and parallelization-safe context sharing.
- `xunit-async-testing` for deterministic async, cancellation, and exception-flow test strategy.
- `xunit-moq-collaboration` for Moq seam selection and resilient interaction-verification boundaries.
- `xunit-runner-platforms` for deterministic local/CI runner strategy, adapter compatibility, and results contract decisions.
- `xunit-ci-observability` for CI evidence contracts, flaky classification, ownership routing, and gate-ready reporting.
- `xunit-theory-data-stability` for deterministic theory data identity, ordering, and reproducibility controls.
- `xunit-v2-v3-migration` for phased xUnit v2 to v3 upgrade sequencing with compatibility and rollback gates.
- `xunit-traits-and-selection` for stable trait taxonomy and selective execution slicing across PR, nightly, and release stages.
- `xunit-quality-gate` for evidence-first pass/fail quality decisions with severity-ranked findings and ownership.

Use this mobile app bundle when requests span mobile UX, prototyping, MAUI implementation, accessibility, resilience, performance, or release hardening across projects:

- `orchestrate-mobile` for one mobile intake that spans UX, prototyping, MAUI implementation, accessibility, resilience, performance, and release hardening.
- `design-mobile-ux` for source-backed mobile UX design from research through implementation handoff.
- `prototype-mobile-ui` for high-fidelity prototypes with tokens, states, and annotated handoff assets.
- `build-maui-apps` for .NET MAUI-specific architecture, secure storage, trimming, and release hardening.
- `mobile-accessibility-quality-gate` for deterministic mobile accessibility findings, evidence, and sign-off decisions.
- `mobile-offline-resilience` for degraded-network, stale-data, retry, and interruption recovery validation.
- `mobile-performance-quality-gate` for release-grade startup, rendering, and memory performance validation.
- `mobile-release-readiness` for signing, store readiness, rollback confirmation, and go or no-go evidence.

## Imported Customization Assets

- `skills-authoring` (imported from an upstream skill set and renamed)
- `test-driven-development` (supporting workflow dependency)
- `writing-plans` (plan authoring workflow adapted to `__DOCS_ROOT__/plans`)
- `delivery-operating-system`, `opportunity-mapping`, `backlog-structuring`, `acceptance-criteria`, and `flow-metrics` (portable PM and delivery operating bundle for agent-heavy projects)
- `delivery-orchestration` (umbrella PM lifecycle skill for deterministic end-to-end delivery coordination)
- `work-intake-governance`, `delivery-forecasting`, `outcome-review`, and `scope-change-control` (high-value adjacent PM and delivery controls for intake, forecasting, post-ship review, and change pressure)
- `code-reviewer` (review specialist agent)
- `plans` (plan execution workflow)
- `task-execution` (same-session per-task implementation workflow)
- `request-code-review` and `remediate-review` (review loop workflow)
- `branch-completion` (completion and branch integration workflow)
- `design-web-ux` (web UX flow from research to handoff)
- `build-web-frontend` (web frontend implementation and review workflow)
- `orchestrate-mobile`, `design-mobile-ux`, `prototype-mobile-ui`, `build-maui-apps`, `mobile-accessibility-quality-gate`, `mobile-offline-resilience`, `mobile-performance-quality-gate`, and `mobile-release-readiness` (mobile delivery skill family for orchestrated UX, prototyping, MAUI implementation, accessibility, resilience, performance, and release hardening)
- `orchestrate-sql-server`, `sql-server-standards`, `sql-server-diagnostics`, `sql-server-query-tuning`, `sql-server-security`, and `sql-server-automation` (cross-project SQL Server skill family for intake, safety, diagnostics, tuning, security, and operations)
- `orchestrate-csharp`, `csharp-language-quality-gate`, `csharp-async-quality-gate`, `csharp-architecture-quality-gate`, `csharp-testing-quality-gate`, `csharp-data-access-quality-gate`, and `csharp-release-quality-gate` (cross-project C# skill family for deterministic intake and expert quality gates across language, async, architecture, testing, data access, and release synthesis)
- `orchestrate-xunit`, `xunit-source-curation`, `xunit-test-design`, `xunit-fixture-lifecycle`, `xunit-async-testing`, `xunit-moq-collaboration`, `xunit-runner-platforms`, `xunit-ci-observability`, `xunit-theory-data-stability`, `xunit-v2-v3-migration`, `xunit-traits-and-selection`, and `xunit-quality-gate` (cross-project xUnit skill family for deterministic intake, expert test authoring, fixture and async safety, runner and CI evidence standardization, migration readiness, selection-governance, and evidence-first quality sign-off)

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
- Align all planning and change tracking artifacts to `__DOCS_ROOT__` rather than legacy `.copilot-tracking` paths.









