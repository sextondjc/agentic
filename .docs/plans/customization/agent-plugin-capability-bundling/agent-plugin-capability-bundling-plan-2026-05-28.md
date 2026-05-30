# Agent Plugin Capability Bundling Plan

## Plan Metadata

| Field | Value |
|---|---|
| Plan ID | PLAN-20260528-APCB-001 |
| Vision ID | VIS-20260528-APCB-001 |
| Status | Revised Draft - Clarification Loop Active |
| Primary Lane | Planning |
| Secondary Lane | Review |
| Requested By | Workspace stakeholder |
| Owner | Orchestrator-routed planning workflow |
| Date | 2026-05-30 |
| Execution Policy | No implementation, packaging, or migration work may begin until explicit user approval is recorded. |
| Primary Artifact | .docs/plans/customization/agent-plugin-capability-bundling/agent-plugin-capability-bundling-plan-2026-05-28.md |
| Refinement Method | critical-thinking and refine-ideas structured challenge pass |

## Approval Record

| Field | Value |
|---|---|
| Approval Status | Approved to proceed |
| Approval Timestamp | 2026-05-30 |
| Approval Source | Direct stakeholder instruction: proceed autonomously and make good decisions. |
| Execution Mode | Deterministic defaults when clarifications are unavailable in-session. |

## Clarification Intake (2026-05-30)

| Field | Value |
|---|---|
| Trigger | User direction to proceed and explicitly leverage critical-thinking and refine-ideas. |
| Intake Route | orchestrator classification then planning refinement loop. |
| Output Intent | Decision-ready refinements, explicit assumptions, and focused clarification questions. |
| Stop Rule | Proceed when no High-severity contradiction remains for sequencing, overlap model, and packaging approach. |

## Objective Grid

| ID | Objective | Outcome Measure |
|---|---|---|
| OBJ-001 | Group customization assets into narrow, capability-scoped plugin bundles. | Every proposed plugin has a single primary capability statement and explicit boundary. |
| OBJ-002 | Provide a full plugin-by-plugin asset manifest for agents, instructions, prompts, and skills. | Every plugin has explicit asset lists with no implicit inclusion rules. |
| OBJ-003 | Allow controlled overlap across plugins for composability. | Shared assets are intentional, documented, and justified. |
| OBJ-004 | Create a step-by-step, approval-gated delivery sequence for later execution. | Steps include owners, status, dependencies, deliverables, and go or no-go gates. |

## Scope Grid

| Scope | Included | Excluded |
|---|---|---|
| Planning | Capability taxonomy, plugin definitions, asset manifests, sequencing, standards, and approval gates. | Any file moves, plugin manifests, packaging, publishing, or runtime validation. |
| Assets | Existing `.github/agents`, `.github/instructions`, `.github/prompts`, `.github/skills`. | New code behavior, CI changes, or release execution. |
| Governance | Lane traceability, standards alignment, status reporting, and handoff readiness. | Execution-lane changes before approval. |

## Standards Alignment Grid

| Standard ID | Source | Application In This Plan |
|---|---|---|
| STD-001 | governance-lifecycle.instructions.md | Uses Planning lane ownership, explicit status fields, workstream IDs, and traceable handoff structure. |
| STD-002 | technical-docs.instructions.md | Stores this artifact in granular `.docs/plans/customization/...` hierarchy and uses table-first format. |
| STD-003 | request-economy.instructions.md | Uses bounded discovery and catalog-driven evidence rather than repeated deep scans. |
| STD-004 | secure-coding.instructions.md | Keeps security policy assets as first-class plugin dependencies for execution-capable bundles. |
| STD-005 | governance-release.instructions.md | Includes explicit approval and no-execution gate before any promotion or packaging activity. |

## Capability Slicing Rules

| Rule ID | Rule | Rationale |
|---|---|---|
| CAP-001 | One plugin = one primary capability statement. | Prevents broad catch-all bundles and keeps discoverability high. |
| CAP-002 | Overlap is allowed only for cross-cutting governance or orchestrator entrypoints. | Supports composition without hiding shared dependencies. |
| CAP-003 | Domain-specific skills stay in domain plugin unless they are governance-wide utilities. | Preserves narrow focus and reduces accidental coupling. |
| CAP-004 | Each plugin must declare composition dependencies explicitly. | Enables deterministic multi-plugin install/compose behavior. |
| CAP-005 | Prompt assets are included only when they operationalize the plugin capability. | Avoids prompt sprawl and keeps plugin intent clear. |

## Plugin Portfolio Grid

| Plugin ID | Proposed Plugin Name | Primary Capability | Scope Boundary | Composition Dependencies | Status |
|---|---|---|---|---|---|
| PLG-01 | core-intake-governance | Deterministic intake, lifecycle governance, and cross-plugin control plane. | Request intake/routing and global policy only; no domain implementation logic. | None (foundational) | Proposed |
| PLG-02 | planning-strategy-design | Planning, shaping, and strategy artifacts for multi-phase delivery. | Planning and design only; excludes implementation and runtime audits. | PLG-01 | Proposed |
| PLG-03 | governance-review-audit | Review, audit, optimization, and acceptance governance workflows. | Review lane assets only; excludes implementation specialists. | PLG-01 | Proposed |
| PLG-04 | plugin-authoring-lifecycle | End-to-end authoring and publishing of agent plugins. | Plugin authoring workflows only; excludes product-domain engineering. | PLG-01, PLG-03 | Proposed |
| PLG-05 | compendium-sync-docs | Compendium synchronization, technical docs, and curation workflows. | Sync and documentation operations only. | PLG-01, PLG-03 | Proposed |
| PLG-06 | dotnet-csharp-engineering | .NET/C# implementation, architecture, data access, and testing. | C# domain only; excludes SQL Server estate ops and frontend stacks. | PLG-01, PLG-03 | Proposed |
| PLG-07 | sql-server-dba | SQL Server operations, tuning, automation, and security. | SQL Server capability only. | PLG-01, PLG-03 | Proposed |
| PLG-08 | mcp-server-engineering | MCP server design, implementation, hardening, and release quality gates. | MCP contracts and transports only. | PLG-01, PLG-03 | Proposed |
| PLG-09 | web-frontend-ux | Web frontend implementation plus UX quality and design checks. | Web UX and web frontend only. | PLG-01, PLG-03 | Proposed |
| PLG-10 | mobile-maui-ux | Mobile MAUI capability with UX, resilience, and release readiness. | MAUI-first mobile domain only. | PLG-01, PLG-03 | Proposed |
| PLG-11 | capacitor-mobile | Capacitor cross-platform mobile specialization. | Capacitor domain only. | PLG-01, PLG-03 | Proposed |
| PLG-12 | sveltekit-engineering | SvelteKit implementation and platform operations. | SvelteKit domain only. | PLG-01, PLG-03 | Proposed |
| PLG-13 | shadcn-tailwind-system | shadcn and Tailwind setup, component patterns, and quality gates. | Design-system and utility CSS capability only. | PLG-01, PLG-03, PLG-09 | Proposed |
| PLG-14 | jquery-engineering | jQuery implementation, migration, security, and testing. | jQuery domain only. | PLG-01, PLG-03, PLG-09 | Proposed |
| PLG-15 | kendo-engineering | Kendo UI implementation, performance, and governance gates. | Kendo domain only. | PLG-01, PLG-03, PLG-09 | Proposed |
| PLG-16 | performance-security-research | Research-only performance and security assessment bundles. | Assessment/reporting only; excludes implementation execution. | PLG-01, PLG-03 | Proposed |

## Detailed Plugin Asset Manifests

### PLG-01 core-intake-governance

| Asset Type | Assets |
|---|---|
| Agents | orchestrator.agent.md |
| Instructions | governance-lifecycle.instructions.md, request-economy.instructions.md, secure-coding.instructions.md, governance-release.instructions.md, governance-naming-conventions.instructions.md |
| Prompts | run-delivery-pattern.prompt.md, execute-delivery.prompt.md, review-project.prompt.md |
| Skills | work-intake-governance, route-customization, compose-skills, writing-plans, task-research, task-execution, plans, scope-change-control, taxonomy-tag-registry |
| Rationale | Establishes mandatory intake and deterministic boundaries before any specialist composition. All other plugins depend on this control plane. |

### PLG-02 planning-strategy-design

| Asset Type | Assets |
|---|---|
| Agents | plan-researcher.agent.md, architecture-designer.agent.md, topic-learner.agent.md, ux-designer.agent.md |
| Instructions | technical-docs.instructions.md, prd.instructions.md, ux-design.instructions.md |
| Prompts | review-technical-docs.prompt.md |
| Skills | critical-thinking, analysis-execution, backlog-structuring, product-scope-slicing, opportunity-mapping, delivery-operating-system, delivery-orchestration, delivery-forecasting, probabilistic-forecasting, flow-metrics, experiment-design, acceptance-criteria, adr-generator, prd-generator, learn-topics, governance-delivery, refine-ideas |
| Rationale | Concentrates planning and decision support assets into a narrow pre-execution capability. Separates design intent from implementation mechanics. |

### PLG-03 governance-review-audit

| Asset Type | Assets |
|---|---|
| Agents | code-reviewer.agent.md, manual-code-reviewer.agent.md, governance-briefer.agent.md, powershell-reviewer.agent.md |
| Instructions | governance-lifecycle.instructions.md, technical-docs.instructions.md, task-implementation.instructions.md |
| Prompts | execute-customization-audit.prompt.md, governance-audit-types.prompt.md, governance-item-audit.prompt.md, audit-customization-types.prompt.md, audit-agent.prompt.md, optimize-customizations.prompt.md, execute-artifact-condense.prompt.md, execute-manual-review.prompt.md |
| Skills | governance-audit, execute-customization-audit, audit-executor, audit-customization-types, audit-agent, audit-instructions, audit-prompts, audit-skill, audit-powershell, acceptance-governance, optimize-customizations, governance-health-overview, governance-summarize, matrix-skill-mapping, delivery-status-grid, remediate-review, request-code-review, test-design-review, test-orchestration, release-readiness, release-simulation, post-release-retrospective |
| Rationale | Creates a dedicated review-lane plugin for compliance, findings, and release-quality decisions with explicit severity-based governance controls. |

### PLG-04 plugin-authoring-lifecycle

| Asset Type | Assets |
|---|---|
| Agents | workspace-scaffolder.agent.md |
| Instructions | governance-naming-conventions.instructions.md, secure-coding.instructions.md, request-economy.instructions.md |
| Prompts | workspace-scaffolder.prompt.md |
| Skills | agent-plugin-setup, agent-plugin-design, agent-plugin-implementation-markdown, agent-plugin-implementation-extension, agent-plugin-tools-integration, agent-plugin-security-hardening, agent-plugin-publishing, agent-authoring, instructions-authoring, skills-authoring, route-customization |
| Rationale | Keeps agent-plugin authoring lifecycle self-contained and reusable for building plugin assets themselves. |

### PLG-05 compendium-sync-docs

| Asset Type | Assets |
|---|---|
| Agents | workspace-scaffolder.agent.md, governance-briefer.agent.md |
| Instructions | technical-docs.instructions.md, governance-lifecycle.instructions.md |
| Prompts | curate-copilot.prompt.md, sync-compendium.prompt.md, generate-readme.prompt.md, librarian.prompt.md, write-component-docs.prompt.md |
| Skills | curate-copilot-instructions, index-docs, librarian, write-technical-docs, sync-compendium, sync-customizations, sync-skills, sync-editorconfig, powershell-script-library, prune-sync-assets, prune-doc-artifacts |
| Rationale | Isolates synchronization and documentation capabilities so they can evolve independently from domain implementation plugins. |

### PLG-06 dotnet-csharp-engineering

| Asset Type | Assets |
|---|---|
| Agents | csharp-engineer.agent.md, defect-debugger.agent.md, architecture-designer.agent.md, code-reviewer.agent.md |
| Instructions | architecture.instructions.md, async-programming.instructions.md, csharp.instructions.md, namespace-boundaries.instructions.md, syrx.instructions.md, validation.instructions.md, testing-strategy.instructions.md, secure-coding.instructions.md |
| Prompts | execute-testing-xunit.prompt.md |
| Skills | csharp-orchestrator, build-blazor-web-apps, build-maui-apps, dotnet-refactor, dotnet-resilience, domain-design, layer-boundaries, async-programming, syrx-data-access, syrx-validation, data-design, api-design, scaffold-dotnet, csharp-architecture-quality-gate, csharp-async-quality-gate, csharp-data-access-quality-gate, csharp-language-quality-gate, csharp-testing-quality-gate, csharp-release-quality-gate, test-driven-development, current-test-coverage, xunit-async-testing, xunit-ci-observability, xunit-fixture-lifecycle, xunit-moq-collaboration, xunit-orchestrator, xunit-quality-gate, xunit-runner-platforms, xunit-source-curation, xunit-test-design, xunit-theory-data-stability, xunit-traits-and-selection, xunit-v2-v3-migration, branch-completion |
| Rationale | Provides a strongly focused .NET delivery capability with full implementation, test, and architecture lifecycle in one domain-scoped plugin. |

### PLG-07 sql-server-dba

| Asset Type | Assets |
|---|---|
| Agents | sql-dba.agent.md |
| Instructions | sql-dba.instructions.md, secure-coding.instructions.md |
| Prompts | review-project.prompt.md |
| Skills | sql-server-orchestrator, sql-server-automation, sql-server-diagnostics, sql-server-query-tuning, sql-server-security, sql-server-standards |
| Rationale | Keeps SQL Server estate operations and T-SQL standards narrow and composable with C# plugins when needed. |

### PLG-08 mcp-server-engineering

| Asset Type | Assets |
|---|---|
| Agents | workspace-scaffolder.agent.md |
| Instructions | secure-coding.instructions.md, request-economy.instructions.md |
| Prompts | workspace-scaffolder.prompt.md |
| Skills | write-mcp-servers, refine-mcp-servers, mcp-servers-orchestrator, mcp-source-curation, mcp-sdk-selection-csharp-typescript, mcp-transport-architecture, mcp-contract-versioning, mcp-authn-authz-hardening, mcp-regression-test-design, mcp-inspector-ci-observability, mcp-server-quality-gate, mcp-release-readiness-gate |
| Rationale | Concentrates MCP-specific contracts, transport, hardening, testing, and release gates without mixing unrelated frontend/backend domains. |

### PLG-09 web-frontend-ux

| Asset Type | Assets |
|---|---|
| Agents | web-frontend-engineer.agent.md, ux-designer.agent.md |
| Instructions | web-frontend.instructions.md, ux-design.instructions.md, secure-coding.instructions.md |
| Prompts | scaffold-web-ux-quality-gate.prompt.md, review-technical-docs.prompt.md |
| Skills | build-web-frontend, design-web-ux, web-ux-quality-gate, web-ux-accessibility, web-ux-account-identity-flows, web-ux-content-clarity, web-ux-data-dense-interfaces, web-ux-experimentation-evidence, web-ux-feedback-status, web-ux-forms-conversion, web-ux-information-architecture, web-ux-localization, web-ux-motion-animation, web-ux-notification-alerts, web-ux-offline-resilience, web-ux-onboarding-progressive-disclosure, web-ux-performance, web-ux-privacy-consent, web-ux-responsive-design, web-ux-supportability-self-service, web-ux-telemetry-instrumentation, web-ux-trust-risk-signals, web-ux-usability, web-ux-visual-consistency |
| Rationale | Delivers a comprehensive but still domain-coherent web UX capability with implementation plus UX quality dimensions. |

### PLG-10 mobile-maui-ux

| Asset Type | Assets |
|---|---|
| Agents | mobile-frontend-engineer.agent.md, ux-designer.agent.md |
| Instructions | mobile-frontend.instructions.md, ux-design.instructions.md, secure-coding.instructions.md |
| Prompts | execute-delivery.prompt.md |
| Skills | build-mobile-apps, build-maui-apps, mobile-orchestrator, mobile-accessibility-quality-gate, mobile-offline-resilience, mobile-performance-quality-gate, mobile-release-readiness, design-mobile-ux, prototype-mobile-ui, usability-test-scripts |
| Rationale | Focuses on MAUI-centered mobile delivery, including UX and release-hardening as one narrow mobile stack capability. |

### PLG-11 capacitor-mobile

| Asset Type | Assets |
|---|---|
| Agents | mobile-frontend-engineer.agent.md, web-frontend-engineer.agent.md |
| Instructions | mobile-frontend.instructions.md, secure-coding.instructions.md |
| Prompts | execute-delivery.prompt.md |
| Skills | capacitor-orchestrator, capacitor-setup, capacitor-web-integration, capacitor-native-apis, capacitor-plugin-authoring, capacitor-auth-session, capacitor-deep-linking, capacitor-environment-config, capacitor-push-notifications, capacitor-live-updates, capacitor-accessibility, capacitor-offline-resilience, capacitor-observability, capacitor-security, capacitor-performance-quality-gate, capacitor-testing, capacitor-ci-integration, capacitor-migration-upgrades, capacitor-privacy-compliance, capacitor-release-readiness, capacitor-source-curation |
| Rationale | Keeps Capacitor capability separate from MAUI and web-only plugins while still composable via shared governance foundations. |

### PLG-12 sveltekit-engineering

| Asset Type | Assets |
|---|---|
| Agents | web-frontend-engineer.agent.md |
| Instructions | web-frontend.instructions.md, secure-coding.instructions.md |
| Prompts | execute-delivery.prompt.md |
| Skills | sveltekit-orchestrator, sveltekit-routing, sveltekit-advanced-routing, sveltekit-load, sveltekit-actions, sveltekit-server-endpoints, sveltekit-hooks, sveltekit-errors, sveltekit-state-management, sveltekit-auth, sveltekit-environment, sveltekit-configuration, sveltekit-page-options, sveltekit-adapters, sveltekit-testing, sveltekit-observability, sveltekit-packaging |
| Rationale | Creates a focused framework plugin for SvelteKit workflows without bundling unrelated frontend technologies. |

### PLG-13 shadcn-tailwind-system

| Asset Type | Assets |
|---|---|
| Agents | web-frontend-engineer.agent.md, ux-designer.agent.md |
| Instructions | web-frontend.instructions.md, ux-design.instructions.md |
| Prompts | scaffold-web-ux-quality-gate.prompt.md |
| Skills | shadcn-orchestrator, shadcn-setup, shadcn-component-design, shadcn-forms, shadcn-data-display, shadcn-accessibility, shadcn-animation, shadcn-registry, shadcn-testing, shadcn-source-curation, shadcn-quality-gate, shadcn-design-system, shadcn-migration, shadcn-theming, shadcn-ci-integration, tailwind-orchestrator, tailwind-setup, tailwind-component-design, tailwind-design-system, tailwind-source-curation, tailwind-quality-gate, tailwind-ci-integration, generate-web-icons |
| Rationale | Bundles the declared primary design language stack into one composable design-system capability plugin. |

### PLG-14 jquery-engineering

| Asset Type | Assets |
|---|---|
| Agents | web-frontend-engineer.agent.md |
| Instructions | web-frontend.instructions.md, secure-coding.instructions.md |
| Prompts | execute-delivery.prompt.md |
| Skills | jquery-orchestrator, jquery-source-curation, jquery-core, jquery-events, jquery-ajax, jquery-plugins, jquery-performance, jquery-migration, jquery-security, jquery-testing, jquery-ci-integration, jquery-quality-gate |
| Rationale | Maintains legacy-modernization and jQuery expertise as a narrow domain plugin for targeted engagements. |

### PLG-15 kendo-engineering

| Asset Type | Assets |
|---|---|
| Agents | web-frontend-engineer.agent.md |
| Instructions | web-frontend.instructions.md, secure-coding.instructions.md |
| Prompts | execute-delivery.prompt.md |
| Skills | kendo-orchestrator, kendo-ui-source-curation, kendo-ui-core, kendo-ui-data-binding, kendo-ui-grid-advanced, kendo-ui-charts-dataviz, kendo-ui-export-printing, kendo-ui-localization, kendo-ui-state-persistence, kendo-ui-real-time-updates, kendo-ui-upload-file-workflows, kendo-ui-observability, kendo-ui-theming, kendo-ui-accessibility, kendo-ui-forms, kendo-ui-security, kendo-ui-performance, kendo-ui-migration, kendo-ui-testing, kendo-ui-ci-integration, kendo-ui-quality-gate |
| Rationale | Preserves Kendo-specific depth and avoids diluting plugin intent with generic frontend assets. |

### PLG-16 performance-security-research

| Asset Type | Assets |
|---|---|
| Agents | performance-assessor.agent.md, benchmark-researcher.agent.md, security-researcher.agent.md |
| Instructions | secure-coding.instructions.md, governance-release.instructions.md |
| Prompts | performance-research.prompt.md, security-research.prompt.md |
| Skills | performance-research, security-research, perf-benchmark, benchmark-orchestrator, benchmark-source-curation, benchmark-baseline-management, benchmark-statistical-analysis, benchmark-profiler-integration, benchmark-ci-integration, benchmark-quality-gate, dependency-security-scan |
| Rationale | Explicitly separates research and assessment from implementation plugins to enforce evidence-first analysis and reduce execution risk. |

## Cross-Plugin Overlap Grid

| Shared Asset | Included In Plugins | Why Overlap Is Intentional |
|---|---|---|
| orchestrator.agent.md | PLG-01 (direct), all others (dependency) | Mandatory intake and deterministic routing across all capabilities. |
| secure-coding.instructions.md | PLG-01, PLG-04, PLG-06, PLG-07, PLG-08, PLG-09, PLG-10, PLG-11, PLG-12, PLG-14, PLG-15, PLG-16 | Cross-cutting security baseline required for any execution-capable or assessment-capable plugin. |
| governance-lifecycle.instructions.md | PLG-01, PLG-03, PLG-05 | Ensures lifecycle lane controls and traceability in planning/review-heavy bundles. |
| web-frontend-engineer.agent.md | PLG-09, PLG-11, PLG-12, PLG-13, PLG-14, PLG-15 | Shared frontend specialist reused across framework-specific capability plugins. |
| workspace-scaffolder.agent.md | PLG-04, PLG-05, PLG-08 | Shared scaffolding capability for plugin and workspace bootstrap workflows. |

## Delivery Workstreams and Steps (Planning Only)

| Step ID | Workstream ID | Step | Owner | Dependencies | Deliverables | Status | Approval Gate |
|---|---|---|---|---|---|---|---|
| STEP-01 | WS-01 | Freeze current catalog inventory for agents, instructions, prompts, and skills as baseline evidence. | Planning owner | None | Baseline inventory snapshot references in plan appendix. | Not Started | Not required |
| STEP-02 | WS-01 | Validate capability slicing rules (CAP-001 to CAP-005) with stakeholders. | Planning owner | STEP-01 | Signed rule confirmation grid. | Not Started | Required |
| STEP-03 | WS-02 | Confirm plugin IDs, names, and primary capability statements in Plugin Portfolio Grid. | Planning owner | STEP-02 | Finalized plugin taxonomy table. | Not Started | Required |
| STEP-04 | WS-02 | Validate each plugin boundary against included assets and remove scope leakage. | Planning owner | STEP-03 | Boundary validation notes per plugin. | Not Started | Required |
| STEP-05 | WS-03 | Review overlap matrix and mark required vs optional shared assets. | Planning + Review owners | STEP-04 | Overlap disposition table with rationale. | Not Started | Required |
| STEP-06 | WS-03 | Define plugin composition order and dependency graph for later execution. | Planning owner | STEP-05 | Installation/composition sequence matrix. | Not Started | Required |
| STEP-07 | WS-04 | Draft plugin packaging template (metadata schema, include rules, exclusion rules, evidence fields). | Planning owner | STEP-06 | Packaging template spec (planning artifact only). | Not Started | Required |
| STEP-08 | WS-04 | Define standards checklist per plugin (security, lifecycle, docs, review). | Review owner | STEP-07 | Plugin standards checklist matrix. | Not Started | Required |
| STEP-09 | WS-05 | Build staged execution backlog from this plan (no execution). | Planning owner | STEP-08 | Backlog table with plugin-by-plugin execution slices. | Not Started | Required |
| STEP-10 | WS-05 | Define review gates and release evidence requirements for future promotion. | Review owner | STEP-09 | Review and release gate matrix aligned to governance-release policy. | Not Started | Required |
| STEP-11 | WS-06 | Conduct formal planning review of this artifact and capture findings/dispositions. | Review owner | STEP-10 | Review findings record with severity tags. | Not Started | Required |
| STEP-12 | WS-06 | Record explicit user approval or rejection decision for execution handoff. | User + Planning owner | STEP-11 | Approved or Rejected decision entry with timestamp and scope notes. | Completed | Mandatory stop/go |

## Status Tracking Grid

| Workstream ID | Workstream Name | Current State | Owner | Next Action | Blockers |
|---|---|---|---|---|---|
| WS-01 | Baseline and Rules | Not Started | Planning owner | Execute STEP-01 and STEP-02 after approval to proceed with planning completion workflow. | Awaiting user confirmation to proceed beyond draft. |
| WS-02 | Portfolio and Boundaries | Not Started | Planning owner | Execute STEP-03 and STEP-04. | WS-01 incomplete. |
| WS-03 | Overlap and Composition | Not Started | Planning + Review owners | Execute STEP-05 and STEP-06. | WS-02 incomplete. |
| WS-04 | Templates and Standards | Not Started | Planning + Review owners | Execute STEP-07 and STEP-08. | WS-03 incomplete. |
| WS-05 | Backlog and Gates | Not Started | Planning + Review owners | Execute STEP-09 and STEP-10. | WS-04 incomplete. |
| WS-06 | Review and Approval | Completed | User + Review owner | Advance to first execution slice kickoff artifact. | None |

## Acceptance Criteria Grid

| AC ID | Acceptance Criterion | Verification Method |
|---|---|---|
| AC-001 | Every proposed plugin has one primary capability statement and explicit boundary. | Review Plugin Portfolio Grid. |
| AC-002 | Every plugin has explicit asset manifests for agents, instructions, prompts, and skills. | Review Detailed Plugin Asset Manifests section. |
| AC-003 | Overlaps are documented with explicit rationale and are not accidental. | Review Cross-Plugin Overlap Grid. |
| AC-004 | Plan includes status fields, step IDs, owners, dependencies, and deliverables. | Review Delivery Workstreams and Status Tracking grids. |
| AC-005 | Plan is approval-gated and blocks execution until explicit user approval. | Verify STEP-12 and Execution Policy fields. |

## Risk and Mitigation Grid

| Risk ID | Risk | Severity | Mitigation |
|---|---|---|---|
| RISK-01 | Plugin scope drifts into broad catch-all behavior. | High | Enforce CAP-001 and CAP-003 during STEP-04 boundary validation. |
| RISK-02 | Asset overlap causes hidden dependency cycles. | High | Maintain explicit overlap and composition dependency grids (STEP-05 and STEP-06). |
| RISK-03 | Missing or stale asset names break later packaging. | Medium | Refresh baseline inventory in STEP-01 before execution handoff. |
| RISK-04 | Governance policies applied inconsistently across plugins. | High | Apply standards checklist per plugin in STEP-08 and review in STEP-11. |
| RISK-05 | Premature execution starts without approval. | High | Mandatory hard gate at STEP-12 with explicit stop/go decision. |

## Critical-Thinking Decision Ledger

| Decision ID | Decision Topic | Option A | Option B | Recommendation | Trade-Off Summary | Blocking Clarification Needed |
|---|---|---|---|---|---|---|
| CT-001 | Initial execution scope | Start PLG-01 only | Start PLG-01 and PLG-04 in parallel | Start PLG-01 only, then PLG-04 after PLG-01 baseline is stable | Sequential start reduces dependency ambiguity and gives one control baseline before authoring lifecycle execution. | Yes |
| CT-002 | Shared asset handling | Central dependency references | Duplicate shared assets per plugin | Prefer central dependency reference model | Centralized shared assets reduce drift and simplify governance updates but require strict dependency declaration discipline. | Yes |
| CT-003 | Manifest production cadence | One plugin at a time | One asset type across all plugins | One plugin at a time | Plugin-centric slices preserve narrow scope and make review gates deterministic. | Yes |
| CT-004 | Plugin portfolio breadth | Keep all 16 plugins | Collapse to fewer larger plugins | Keep 16 narrow plugins for v1 | Maintains capability focus and composability at cost of more packaging/review overhead. | No |
| CT-005 | Review cadence | Review per plugin slice | Review after batch of 3-5 plugins | Review per plugin slice for first 3 plugins, then reassess | Early per-slice review lowers early regression risk and validates packaging template quality quickly. | No |

## Assumptions and Constraints Ledger

| ID | Type | Statement | Confidence | Validation Plan |
|---|---|---|---|---|
| ASM-001 | Assumption | Shared governance assets are intended to be reused across multiple plugins. | High | Confirm overlap policy choice in clarification responses. |
| ASM-002 | Assumption | Narrow plugin boundaries are preferred over minimizing plugin count. | High | Keep 16-plugin model unless user requests consolidation. |
| ASM-003 | Assumption | Initial execution should optimize for control and traceability rather than speed. | Medium | Confirm sequential vs parallel start decision. |
| CON-001 | Constraint | Execution should remain deterministic and traceable to plan/workstream IDs. | High | Enforced through step/workstream grids and per-slice evidence. |
| CON-002 | Constraint | No implicit dependency behavior; composition dependencies must be explicit. | High | Enforced in packaging template and overlap disposition step. |

## Refine-Ideas Challenge Log

| Round | Challenge Question | Current Answer | Exposed Tension | Revision Applied | Confidence Delta |
|---|---|---|---|---|---|
| 1 | Are we optimizing for speed or for deterministic control in early slices? | Control should win early. | Parallel start may accelerate delivery but increases unresolved dependency risk. | Recommended sequential kickoff: PLG-01 then PLG-04. | +0.10 |
| 2 | Should shared assets be duplicated or referenced? | Referenced centrally with explicit dependency declarations. | Duplication improves plugin autonomy but introduces drift and synchronization burden. | Added CT-002 recommendation and explicit clarification requirement. | +0.15 |
| 3 | Is plugin-level slicing preferable to asset-type slicing? | Plugin-level slicing is preferable. | Asset-type slicing can increase throughput but weakens capability coherence in review. | Added CT-003 recommendation: one plugin at a time. | +0.10 |
| 4 | Is 16 plugins too fragmented for first execution wave? | Keep 16 for v1; control sequence with priorities. | Fewer plugins reduce overhead but conflict with narrow scope preference. | Retained 16-plugin model and limited first wave to PLG-01, PLG-04, PLG-03. | +0.05 |

## Refined Idea Statement

| Field | Value |
|---|---|
| Refined Statement | Execute capability bundling as a deterministic, plugin-centric sequence that starts with control-plane and authoring foundations, uses explicit dependency references for shared assets, and passes per-slice review gates before broad rollout. |
| Non-Goals | Broad plugin consolidation, hidden dependency automation, and batch promotion without per-slice evidence. |
| Confidence Score | 0.80 |
| Remaining Risks | Shared-asset reference model and first-wave parallelism preferences require stakeholder confirmation. |
| Next Recommendation | Capture clarifications, then execute PLG-01 as the first implementation slice. |

## Focused Clarification Questions

| Question ID | Question | Why It Matters | Default If No Answer |
|---|---|---|---|
| CQ-001 | Do you want PLG-01 executed strictly first, or PLG-01 and PLG-04 in parallel? | Determines dependency risk and sequencing for first execution wave. | Strictly PLG-01 first |
| CQ-002 | For shared assets, do you prefer central dependency references or intentional duplication with sync governance? | Defines overlap implementation and long-term maintenance model. | Central dependency references |
| CQ-003 | Should we produce plugin manifests one plugin at a time or one asset type at a time across all plugins? | Controls review granularity and execution throughput model. | One plugin at a time |

## Clarification Resolution Log

| Question ID | Resolution | Source | Status |
|---|---|---|---|
| CQ-001 | Strictly PLG-01 first | Autonomous default after no in-session response availability | Resolved |
| CQ-002 | Central dependency references | Autonomous default after no in-session response availability | Resolved |
| CQ-003 | One plugin at a time | Autonomous default after no in-session response availability | Resolved |

## Approval and Handoff Grid

| Field | Value |
|---|---|
| Approval Required | Yes |
| Approval Trigger | Completion of planning review with no unresolved High findings. |
| Approved Execution Route | orchestrator -> appropriate execution specialist per plugin domain. |
| Rejection Route | Keep plan in Draft, capture changes requested, revise this file only. |
| No-Execution Clause | No plugin creation, manifest generation, asset moves, or publishing actions are permitted until approval is explicitly recorded. |

## Recommended First Execution Slice (Post-Approval Only)

| Priority | Plugin | Why First | Expected Benefit |
|---|---|---|---|
| 1 | PLG-01 core-intake-governance | Foundation for deterministic routing and policy coverage. | Enables safe composition of all other plugins. |
| 2 | PLG-04 plugin-authoring-lifecycle | Provides authoring machinery used to package other capability plugins. | Reduces later packaging friction. |
| 3 | PLG-03 governance-review-audit | Establishes review gates before high-volume domain packaging. | Prevents non-compliant bundles from advancing. |
