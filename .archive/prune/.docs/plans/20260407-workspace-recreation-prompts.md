# Workspace Recreation Prompt Pack (Dependency-Accurate)

## Objective
Recreate this customization-first workspace with strict dependency ordering and one explicit implementation prompt per customization artifact.

## Run Protocol
1. Execute prompts strictly by sequence number.
2. One prompt per run. No batching unless the prompt explicitly says a catalog synchronization step is included.
3. If a dependency is missing, stop and complete the missing dependency first.
4. After each prompt, validate file existence and cross-links before moving forward.
5. Whenever a customization asset is added or renamed, update the relevant catalog/index file in the same change.

## Dependency Baseline

| Layer | Why It Must Exist First | Artifacts |
|---|---|---|
| L0 | Folder topology and repo identity | root README.md, .github/*, .docs/* |
| L1 | Naming and lifecycle rules drive all later assets | naming-conventions.instructions.md, lifecycle-governance.instructions.md |
| L2 | Core instruction policy stack constrains authorship | remaining instruction files |
| L3 | Agent catalog depends on lane policy and naming policy | .github/agents/*.agent.md + README |
| L4 | Skill library depends on naming, lanes, and agent intent boundaries | .github/skills/**/SKILL.md + README |
| L5 | Prompt templates depend on instructions/skills/agents and routing model | .github/prompts/*.prompt.md + README |
| L6 | Canonical operating model depends on all catalogs | .github/copilot-instructions.md |
| L7 | Governance references depend on catalogs and operating model | .docs/reference/*, .docs/agent-routing-guide.md |
| L8 | Root overview and traceability depend on all above | README.md, .docs/adr/README.md, .docs/changes/README.md |
| L9 | Validation depends on complete asset graph | .docs/changes/* validation report |

## L0 - Bootstrap Prompts

### P-0001 Bootstrap Folder Structure
Prompt:
```text
Create the baseline workspace structure for a customization-first Lean .NET repository.

Create these folders:
- .github/instructions
- .github/agents
- .github/skills
- .github/prompts
- .github/scripts/powershell
- .docs/adr
- .docs/plans
- .docs/research
- .docs/changes
- .docs/reference

Acceptance:
- All folders exist exactly as listed.
- No product app folders or *.csproj files are created.
```

### P-0002 Seed Root README
Depends on: P-0001

Prompt:
```text
Create root README.md for this customization-only repository.

Include:
- Scope statement: customization and skills compendium, not a product app host.
- Lifecycle lanes: Planning, Execution, Review.
- Canonical docs paths: .docs/plans, .docs/research, .docs/changes, .docs/adr.
- Syrx-only data access standard as authoritative for generated target repos.

Acceptance:
- README exists and clearly communicates scope boundaries and lane model.
```

## L1-L2 - Instruction Customizations (One Prompt Per Instruction)

### Instruction Prompt Pattern
Use this exact template for each instruction prompt below.

```text
Create .github/instructions/<file-name> with valid frontmatter keys only:
- name
- description
- applyTo

Then write narrowly scoped policy content aligned to this instruction purpose only.
Do not duplicate policy ownership already covered by other instruction files.
Preserve explicit, enforceable rules.
```

| Seq | Prompt ID | Customization | Depends On | Agent Prompt |
|---|---|---|---|---|
| 1 | P-1001 | naming-conventions.instructions.md | P-0002 | Create .github/instructions/naming-conventions.instructions.md using the Instruction Prompt Pattern. Focus only on naming standards for agents, instructions, skills, prompts, and related governance assets. |
| 2 | P-1002 | lifecycle-governance.instructions.md | P-1001 | Create .github/instructions/lifecycle-governance.instructions.md using the Instruction Prompt Pattern. Define mandatory Planning/Execution/Review classification and handoff rules. |
| 3 | P-1003 | architecture.instructions.md | P-1002 | Create .github/instructions/architecture.instructions.md using the Instruction Prompt Pattern. Scope to DDD, SOLID, and architecture boundaries for .NET work. |
| 4 | P-1004 | prd.instructions.md | P-1002 | Create .github/instructions/prd.instructions.md using the Instruction Prompt Pattern. Scope to spec/PRD traceability and quality standards. |
| 5 | P-1005 | technical-docs.instructions.md | P-1002 | Create .github/instructions/technical-docs.instructions.md using the Instruction Prompt Pattern. Scope to durable technical docs generation standards. |
| 6 | P-1006 | async-programming.instructions.md | P-1003 | Create .github/instructions/async-programming.instructions.md using the Instruction Prompt Pattern. Scope to async/await and ValueTask guidance. |
| 7 | P-1007 | csharp.instructions.md | P-1003 | Create .github/instructions/csharp.instructions.md using the Instruction Prompt Pattern. Scope to C# style and engineering standards. |
| 8 | P-1008 | namespace-and-assembly-boundaries.instructions.md | P-1003 | Create .github/instructions/namespace-and-assembly-boundaries.instructions.md using the Instruction Prompt Pattern. Scope to layered boundaries and coupling control. |
| 9 | P-1009 | syrx.instructions.md | P-1007 | Create .github/instructions/syrx.instructions.md using the Instruction Prompt Pattern. Scope to Syrx 2.4.1 repository and SQL Server usage standards. |
| 10 | P-1010 | ci-cd.instructions.md | P-1002 | Create .github/instructions/ci-cd.instructions.md using the Instruction Prompt Pattern. Scope to secure GitHub Actions CI/CD governance. |
| 11 | P-1011 | sql-dba.instructions.md | P-1002 | Create .github/instructions/sql-dba.instructions.md using the Instruction Prompt Pattern. Scope to parameterized SQL safety and DBA standards. |
| 12 | P-1012 | powershell.instructions.md | P-1002 | Create .github/instructions/powershell.instructions.md using the Instruction Prompt Pattern. Scope to idiomatic, safe PowerShell scripting conventions. |
| 13 | P-1013 | task-implementation.instructions.md | P-1002 | Create .github/instructions/task-implementation.instructions.md using the Instruction Prompt Pattern. Scope to plan execution traceability and change artifact policy. |
| 14 | P-1014 | testing-strategy.instructions.md | P-1007 | Create .github/instructions/testing-strategy.instructions.md using the Instruction Prompt Pattern. Scope to xUnit/Moq strategy and test architecture. |
| 15 | P-1015 | validation-and-guards.instructions.md | P-1007 | Create .github/instructions/validation-and-guards.instructions.md using the Instruction Prompt Pattern. Scope to boundary validation and guard semantics. |
| 16 | P-1016 | security-and-secure-coding.instructions.md | P-1007 | Create .github/instructions/security-and-secure-coding.instructions.md using the Instruction Prompt Pattern. Scope to secure coding defaults and OWASP-aligned controls. |
| 17 | P-1017 | .github/instructions/instruction-lifecycle-catalog.md | P-1016 | Create .github/instructions/instruction-lifecycle-catalog.md as a lifecycle catalog with columns: Instruction File, Primary Lane, Secondary Lane, Rationale. Include all 16 instruction files exactly once. |

## L3 - Agent Customizations (One Prompt Per Agent)

### Agent Prompt Pattern
```text
Create .github/agents/<agent-name>.agent.md.
Keep this agent hyper-specialized for one narrowly bounded responsibility.
Align responsibilities to lifecycle lanes and avoid role bleed.
```

| Seq | Prompt ID | Customization | Depends On | Agent Prompt |
|---|---|---|---|---|
| 1 | P-2001 | orchestrator.agent.md | P-1017 | Create .github/agents/orchestrator.agent.md using the Agent Prompt Pattern. Scope to routing and phase decomposition only. |
| 2 | P-2002 | learning-agent.agent.md | P-2001 | Create .github/agents/learning-agent.agent.md. Scope to depth-calibrated topic decomposition and source-backed learning workflows. |
| 3 | P-2003 | plan-researcher.agent.md | P-2001 | Create .github/agents/plan-researcher.agent.md. Scope to research and executable planning artifacts. |
| 4 | P-2004 | architecture-designer.agent.md | P-2003 | Create .github/agents/architecture-designer.agent.md. Scope to architecture and ADR guidance only. |
| 5 | P-2005 | csharp-engineer.agent.md | P-1017 | Create .github/agents/csharp-engineer.agent.md. Scope to C# implementation work. |
| 6 | P-2006 | defect-debugger.agent.md | P-2005 | Create .github/agents/defect-debugger.agent.md. Scope to bug reproduction and minimal verified fixes. |
| 7 | P-2007 | sql-dba.agent.md | P-1011 | Create .github/agents/sql-dba.agent.md. Scope to operational SQL Server work only. |
| 8 | P-2008 | workspace-scaffolder.agent.md | P-1001 | Create .github/agents/workspace-scaffolder.agent.md. Scope to scaffold tasks and workspace initialization. |
| 9 | P-2009 | powershell-reviewer.agent.md | P-1012 | Create .github/agents/powershell-reviewer.agent.md. Scope to review-only PowerShell assessment. |
| 10 | P-2010 | governance-briefer.agent.md | P-1002 | Create .github/agents/governance-briefer.agent.md. Scope to concise governance briefing synthesis. |
| 11 | P-2011 | manual-code-reviewer.agent.md | P-1002 | Create .github/agents/manual-code-reviewer.agent.md. Scope to capture-only review findings without auto-remediation. |
| 12 | P-2012 | code-reviewer.agent.md | P-1002 | Create .github/agents/code-reviewer.agent.md. Scope to standards/plan conformance review. |
| 13 | P-2013 | security-researcher.agent.md | P-1016 | Create .github/agents/security-researcher.agent.md. Scope to report-first security assessment without implementation. |
| 14 | P-2014 | performance-assessor.agent.md | P-1014 | Create .github/agents/performance-assessor.agent.md. Scope to research-only performance analysis without implementation. |
| 15 | P-2015 | benchmark-researcher.agent.md | P-2014 | Create .github/agents/benchmark-researcher.agent.md. Scope to BenchmarkDotNet method/report guidance. |
| 16 | P-2016 | .github/agents/agent-lifecycle-catalog.md | P-2015 | Create .github/agents/agent-lifecycle-catalog.md with columns: Agent, Primary Lane, Secondary Lane, Rationale. Include all 15 agents exactly once. |

## L4 - Skill Customizations (One Prompt Per Skill)

### Skill Prompt Pattern
```text
Create .github/skills/<skill-name>/SKILL.md.
Keep frontmatter minimal and valid.
Do not use unsupported frontmatter keys.
Describe one narrowly bounded workflow.
```

| Seq | Prompt ID | Skill | Depends On | Agent Prompt |
|---|---|---|---|---|
| 1 | P-3001 | adr-generator | P-2004 | Create .github/skills/adr-generator/SKILL.md using the Skill Prompt Pattern. Scope to ADR authoring in .docs/adr. |
| 2 | P-3002 | api-design | P-2003 | Create .github/skills/api-design/SKILL.md using the Skill Prompt Pattern. Scope to external API client and boundary design. |
| 3 | P-3003 | audit-governance | P-2010 | Create .github/skills/audit-governance/SKILL.md. Scope to governance-layer auditing and remediation ranking. |
| 4 | P-3004 | governance-health-overview | P-3003 | Create .github/skills/governance-health-overview/SKILL.md. Scope to reconciled governance disposition synthesis. |
| 5 | P-3005 | remediate-review | P-2012 | Create .github/skills/remediate-review/SKILL.md. Scope to validated remediation of review feedback. |
| 6 | P-3006 | audit-powershell | P-2009 | Create .github/skills/audit-powershell/SKILL.md. Scope to PowerShell safety and maintainability audits. |
| 7 | P-3007 | build-maui-apps | P-2005 | Create .github/skills/build-maui-apps/SKILL.md. Scope to .NET MAUI architecture-to-release workflow. |
| 8 | P-3008 | branch-completion | P-2005 | Create .github/skills/branch-completion/SKILL.md. Scope to implementation completion and merge/PR options. |
| 9 | P-3009 | critical-thinking | P-2003 | Create .github/skills/critical-thinking/SKILL.md. Scope to assumption testing and trade-off pressure checks. |
| 10 | P-3010 | condense-skill | P-3003 | Create .github/skills/condense-skill/SKILL.md. Scope to reducing verbosity without losing intent. |
| 11 | P-3011 | learn-topics | P-2002 | Create .github/skills/learn-topics/SKILL.md. Scope to source-traceable topic learning plans. |
| 12 | P-3012 | mobile-ui-prototyping | P-2002 | Create .github/skills/mobile-ui-prototyping/SKILL.md. Scope to low-to-high fidelity mobile prototype flow. |
| 13 | P-3013 | curating-copilot-instructions | P-1017 | Create .github/skills/curating-copilot-instructions/SKILL.md. Scope to syncing imported assets into copilot-instructions.md. |
| 14 | P-3014 | current-test-coverage | P-1014 | Create .github/skills/current-test-coverage/SKILL.md. Scope to obtaining fresh in-session coverage metrics. |
| 15 | P-3015 | customization-authoring | P-1001 | Create .github/skills/customization-authoring/SKILL.md. Scope to authoring .instructions.md/.agent.md assets correctly. |
| 16 | P-3016 | delivery-status-grid | P-1002 | Create .github/skills/delivery-status-grid/SKILL.md. Scope to table-first delivery progress reporting. |
| 17 | P-3017 | design-mobile-ux | P-2002 | Create .github/skills/design-mobile-ux/SKILL.md. Scope to mobile UX research-to-handoff workflow. |
| 18 | P-3018 | docker-dotnet | P-2005 | Create .github/skills/docker-dotnet/SKILL.md. Scope to secure containerization of .NET applications. |
| 19 | P-3019 | dotnet-refactor | P-2005 | Create .github/skills/dotnet-refactor/SKILL.md. Scope to behavior-preserving modernization. |
| 20 | P-3020 | dotnet-resilience | P-2005 | Create .github/skills/dotnet-resilience/SKILL.md. Scope to resilience strategy composition using modern .NET patterns. |
| 21 | P-3021 | executing-plans | P-2003 | Create .github/skills/executing-plans/SKILL.md. Scope to separate-session plan execution. |
| 22 | P-3022 | summarize-governance | P-3003 | Create .github/skills/summarize-governance/SKILL.md. Scope to one-page governance summaries. |
| 23 | P-3023 | perf-benchmark | P-2015 | Create .github/skills/perf-benchmark/SKILL.md. Scope to BenchmarkDotNet workflow design/review. |
| 24 | P-3024 | performance-research | P-2014 | Create .github/skills/performance-research/SKILL.md. Scope to report-only performance assessment workflows. |
| 25 | P-3025 | prd-generator | P-1004 | Create .github/skills/prd-generator/SKILL.md. Scope to comprehensive PRD generation. |
| 26 | P-3026 | prune-doc-artifacts | P-1005 | Create .github/skills/prune-doc-artifacts/SKILL.md. Scope to stale doc artifact triage. |
| 27 | P-3027 | powershell-script-library | P-1012 | Create .github/skills/powershell-script-library/SKILL.md. Scope to reusable script catalog-first maintenance. |
| 28 | P-3028 | refine-ideas | P-3009 | Create .github/skills/refine-ideas/SKILL.md. Scope to iterative idea refinement loops. |
| 29 | P-3029 | request-code-review | P-2012 | Create .github/skills/request-code-review/SKILL.md. Scope to review request workflow at implementation milestones. |
| 30 | P-3030 | route-customization | P-2001 | Create .github/skills/route-customization/SKILL.md. Scope to routing behavior to agent vs instruction vs skill. |
| 31 | P-3031 | scaffold-dotnet | P-2008 | Create .github/skills/scaffold-dotnet/SKILL.md. Scope to new .NET workspace skeleton setup. |
| 32 | P-3032 | security-research | P-2013 | Create .github/skills/security-research/SKILL.md. Scope to report-only security research workflows. |
| 33 | P-3033 | skill-review | P-3003 | Create .github/skills/skill-review/SKILL.md. Scope to skill quality evaluation and remediation output. |
| 34 | P-3034 | skills-authoring | P-3015 | Create .github/skills/skills-authoring/SKILL.md. Scope to authoring and validating new skills. |
| 35 | P-3035 | sync-editorconfig | P-2005 | Create .github/skills/sync-editorconfig/SKILL.md. Scope to .editorconfig normalization and C# validation. |
| 36 | P-3036 | sync-customizations | P-3015 | Create .github/skills/sync-customizations/SKILL.md. Scope to maintaining instruction/agent alignment over time. |
| 37 | P-3037 | sync-skills | P-3034 | Create .github/skills/sync-skills/SKILL.md. Scope to long-term skill freshness and adoption checks. |
| 38 | P-3038 | syrx-data-access | P-1009 | Create .github/skills/syrx-data-access/SKILL.md. Scope to Syrx repository implementation patterns. |
| 39 | P-3039 | task-execution | P-3021 | Create .github/skills/task-execution/SKILL.md. Scope to same-session execution of planned tasks. |
| 40 | P-3040 | task-research | P-2003 | Create .github/skills/task-research/SKILL.md. Scope to deep evidence gathering before planning/implementation. |
| 41 | P-3041 | test-driven-development | P-1014 | Create .github/skills/test-driven-development/SKILL.md. Scope to test-first implementation workflow. |
| 42 | P-3042 | usability-testing-scripts | P-3017 | Create .github/skills/usability-testing-scripts/SKILL.md. Scope to mobile usability script and rubric generation. |
| 43 | P-3043 | validate-customization | P-3003 | Create .github/skills/validate-customization/SKILL.md. Scope to conflict/quality validation for customizations. |
| 44 | P-3044 | write-technical-docs | P-1005 | Create .github/skills/write-technical-docs/SKILL.md. Scope to code-verified technical docs generation. |
| 45 | P-3045 | writing-plans | P-1002 | Create .github/skills/writing-plans/SKILL.md. Scope to implementation plan authoring before code changes. |
| 46 | P-3046 | .github/skills/skill-discovery-index.md | P-3045 | Create .github/skills/skill-discovery-index.md with columns: Skill, Primary Lane, Secondary Lane, When to Use, Skill File. Include all 45 skills exactly once. |

## L5 - Prompt Template Customizations (One Prompt Per Prompt File)

### Prompt File Pattern
```text
Create .github/prompts/<name>.prompt.md.
Keep it lightweight and task-specific.
Do not duplicate full instruction or skill content.
Align it to one primary lane.
```

| Seq | Prompt ID | Customization | Depends On | Agent Prompt |
|---|---|---|---|---|
| 1 | P-4001 | workspace-scaffolder.prompt.md | P-2008 | Create .github/prompts/workspace-scaffolder.prompt.md using the Prompt File Pattern. Scope to scaffolding workspace setup tasks. |
| 2 | P-4002 | write-component-docs.prompt.md | P-3044 | Create .github/prompts/write-component-docs.prompt.md. Scope to component docs production workflow. |
| 3 | P-4003 | curate-copilot.prompt.md | P-3013 | Create .github/prompts/curate-copilot.prompt.md. Scope to curated updates to copilot-instructions and catalogs. |
| 4 | P-4004 | generate-readme.prompt.md | P-1005 | Create .github/prompts/generate-readme.prompt.md. Scope to structured README generation. |
| 5 | P-4005 | syrx-validation.prompt.md | P-3038 | Create .github/prompts/syrx-validation.prompt.md. Scope to Syrx validation pattern generation. |
| 6 | P-4006 | testing-xunit.prompt.md | P-3041 | Create .github/prompts/testing-xunit.prompt.md. Scope to xUnit-centric test task prompts. |
| 7 | P-4007 | review-technical-docs.prompt.md | P-3044 | Create .github/prompts/review-technical-docs.prompt.md. Scope to technical docs review/remediation. |
| 8 | P-4008 | execute-manual-review.prompt.md | P-2011 | Create .github/prompts/execute-manual-review.prompt.md. Scope to applying manual review findings. |
| 9 | P-4009 | project-checkpoint.prompt.md | P-1002 | Create .github/prompts/project-checkpoint.prompt.md. Scope to checkpoint gating and plan conformance checks. |
| 10 | P-4010 | resume-execution.prompt.md | P-3039 | Create .github/prompts/resume-execution.prompt.md. Scope to resumable execution continuity prompts. |
| 11 | P-4011 | skill-audit.prompt.md | P-3033 | Create .github/prompts/skill-audit.prompt.md. Scope to skill quality audit runs. |
| 12 | P-4012 | instructions-audit.prompt.md | P-1017 | Create .github/prompts/instructions-audit.prompt.md. Scope to instruction conflict and overlap audits. |
| 13 | P-4013 | governance-cadence.prompt.md | P-3004 | Create .github/prompts/governance-cadence.prompt.md. Scope to recurring governance health checks. |
| 14 | P-4014 | condense-skill.prompt.md | P-3010 | Create .github/prompts/condense-skill.prompt.md. Scope to concise rewrite recommendations for skills. |
| 15 | P-4015 | security-research.prompt.md | P-3032 | Create .github/prompts/security-research.prompt.md. Scope to report-only security investigations. |
| 16 | P-4016 | performance-research.prompt.md | P-3024 | Create .github/prompts/performance-research.prompt.md. Scope to report-only performance investigations. |
| 17 | P-4017 | .github/prompts/prompt-lifecycle-catalog.md | P-4016 | Create .github/prompts/prompt-lifecycle-catalog.md with columns: Prompt File, Primary Lane, Secondary Lane, Rationale. Include all 16 prompts exactly once. |

## L6 - Canonical Operating Model Customization

### P-5001 Create .github/copilot-instructions.md
Depends on: P-1017, P-2016, P-3046, P-4017

Prompt:
```text
Create .github/copilot-instructions.md as the canonical workspace operating model.

Include all required sections:
- Repository Intent
- Canonical Standards
- Lifecycle Lanes
- Preferred Agents
- Preferred Skills
- Imported Superpowers Assets
- Workspace Design Rules

Requirements:
- Ensure naming and lane taxonomy align to catalogs.
- Include canonical links to agents/instructions/prompts/skills READMEs.
- Keep specialization strict and avoid role bleed.

Acceptance:
- Section structure is complete and navigable.
- Links resolve and inventory matches catalogs.
```

## L7 - Governance Reference Customizations

| Seq | Prompt ID | Customization | Depends On | Agent Prompt |
|---|---|---|---|---|
| 1 | P-6001 | .docs/reference/planning-execution-review-governance.md | P-5001 | Create this governance doc with lane definitions, traceability IDs, planning packet grids, execution contract, review contract, and routing rules. |
| 2 | P-6002 | .docs/agent-routing-guide.md | P-2016 | Create this routing guide with role boundaries, use/do-not-use criteria, and handoff rules by agent and skill. |
| 3 | P-6003 | .docs/reference/customization-taxonomy-v1.md | P-6001 | Create taxonomy v1 with ASSET/LANE/FAMILY/TYPE/ROLE model and cross-check snapshot against catalogs. |
| 4 | P-6004 | .docs/reference/index.md | P-6003 | Create an index document that links governance references and explains precedence. |

## L8 - Root and Traceability Customizations

| Seq | Prompt ID | Customization | Depends On | Agent Prompt |
|---|---|---|---|---|
| 1 | P-7001 | Root README.md reconciliation | P-6004 | Update README.md with workspace-at-a-glance tables, lifecycle routing matrix, contract tables, and links to all catalogs/reference docs. |
| 2 | P-7002 | .docs/adr/README.md | P-6001 | Create ADR index/usage guidance with decision format and traceability expectations. |
| 3 | P-7003 | .docs/changes/README.md | P-6001 | Create changes index/usage guidance with severity/disposition recording conventions. |
| 4 | P-7004 | Bootstrap completion plan in .docs/plans | P-7003 | Create a plan artifact documenting workspace bootstrap completion and unresolved follow-ups. |

## L9 - Validation and Drift Correction

### P-9001 Full Consistency Validation and Remediation
Depends on: P-7004

Prompt:
```text
Run a full workspace consistency validation and remediate all discovered drift in the same execution wave.

Validation checks:
- Every listed instruction, agent, skill, and prompt file exists.
- Every catalog README reflects current filesystem state.
- naming-conventions policy is respected by all customization filenames.
- lifecycle-governance policy is reflected in lane mappings.
- No duplicate policy ownership exists across instruction files.
- Agent and skill responsibilities remain hyper-specialized.
- Reusable script automation is captured in reusable assets rather than ad hoc commands.

Create a concise report in .docs/changes that includes:
- Findings
- Fixes applied
- Remaining accepted risks (if any)

Acceptance:
- Workspace reaches internally consistent day-1-ready state.
```

## Optional Strict Single-Run Master Prompt

```text
Recreate this customization-first Lean .NET workspace from scratch with strict dependency ordering and one prompt-driven step per customization artifact.

Execution contract:
1. Complete L0 bootstrap.
2. Complete L1-L2 instruction prompts in the defined order and build instructions catalog.
3. Complete L3 agent prompts in the defined order and build agents catalog.
4. Complete L4 skill prompts in the defined order and build skills index.
5. Complete L5 prompt template prompts in the defined order and build prompts catalog.
6. Build canonical operating model in .github/copilot-instructions.md.
7. Build governance references in .docs/reference and routing guide.
8. Reconcile root README and create traceability READMEs.
9. Run full validation and produce .docs/changes report.

Hard constraints:
- Lanes are only Planning, Execution, Review.
- Hyper-specialization is mandatory.
- Naming conventions are mandatory.
- Catalog updates are mandatory in the same change as asset changes.
- Unsupported frontmatter keys are forbidden.
```

