# Agent Plugin Capability Bundling Plan

## Plan Metadata

| Field | Value |
|---|---|
| Plan ID | PLAN-20260528-APCB-001 |
| Vision ID | VIS-20260528-APCB-001 |
| Status | Revised Draft - Replan Pending Approval |
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
| Approval Status | Superseded - New approval required |
| Approval Timestamp | 2026-05-30 (superseded by feedback-driven replan) |
| Approval Source | Prior approval replaced by explicit packaging and marketplace corrections. |
| Execution Mode | Paused pending approval of this revised plan. |

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
| OBJ-005 | Define non-static plugin lifecycle policy for maintenance, versioning, and integrity verification. | Every plugin bundle has update policy, semver rules, provenance metadata, and artifact integrity evidence. |

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

## Plugin Lifecycle and Maintenance Model

| Lifecycle Stage | Required Activities | Required Evidence |
|---|---|---|
| Design Baseline | Define plugin scope, dependencies, and manifest schema. | Approved contract file and dependency table. |
| Build and Package | Produce plugin bundle with manifest and artifact inventory. | Bundle manifest with per-asset metadata and checksums. |
| Promotion | Apply review and release-readiness gates before publish/distribution. | Review disposition, gate checklist, rollback reference. |
| Maintenance Update | Re-evaluate included assets for drift, retirements, and replacements. | Change artifact linked to plan and affected plugin contract updates. |
| Security Refresh | Recompute integrity metadata and revalidate security-sensitive assets. | New integrity report and comparison to previous release metadata. |
| Deprecation | Mark deprecated plugins/versions and define migration path. | Deprecation notice, replacement guidance, and timeline. |

## Semantic Versioning Policy

| Change Type | Version Increment | Rule |
|---|---|---|
| Breaking capability boundary change | Major | Increment major when plugin scope, required dependencies, or public behavior contract changes incompatibly. |
| Backward-compatible capability expansion | Minor | Increment minor when assets are added without breaking existing usage contracts. |
| Metadata-only, documentation-only, or integrity refresh with no behavior change | Patch | Increment patch for non-breaking maintenance and verification updates. |

## Manifest Provenance and Integrity Policy

| Field | Required | Purpose |
|---|---|---|
| pluginId | Yes | Unique plugin identifier used for dependency resolution. |
| pluginVersion | Yes | Semver value used as the primary version contract. |
| sourceCommit | Yes | Git commit hash establishing source provenance for this plugin build. |
| generatedAtUtc | Yes | Build timestamp for audit traceability. |
| artifactEntries | Yes | List of included assets with path, type, and per-file digest. |
| aggregateDigest | Yes | Digest of canonicalized per-file digest set to detect bundle tampering. |
| digestAlgorithm | Yes | Hash algorithm identifier used for all digests. |

| Integrity Rule ID | Rule | Decision |
|---|---|---|
| INT-001 | Commit hash inclusion | Include sourceCommit in manifest as provenance evidence; do not treat it as replacement for semver. |
| INT-002 | Per-file digest | Compute digest for each artifact in plugin bundle manifest. |
| INT-003 | Aggregate digest | Compute digest over sorted canonical list of per-file digests and include in manifest and README. |
| INT-004 | Algorithm strength | Use SHA-256; do not use MD5 due collision weaknesses and integrity risk. |
| INT-005 | Verification guidance | Publish reproducible verification steps so users can independently validate plugin integrity. |

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

## Publication Targets and Promotion Path

| Rule ID | Rule |
|---|---|
| PUB-001 | Every plugin must have an explicit publication target before first release candidate is produced. |
| PUB-002 | Default first promotion is internal channel; public publication requires explicit opt-in approval. |
| PUB-003 | Channel changes (for example private to public) are treated as release-scope changes and require fresh approvals. |
| PUB-004 | Release notes must include publication channel, audience scope, rollback reference, and evidence links. |
| PUB-005 | Every plugin release must stage artifacts to a deterministic local disk path before any GitHub publication step. |
| PUB-006 | Plugin binary bundles are not committed to git; only manifests, checksums, and release metadata are tracked in repository history. |
| PUB-007 | Plugin package names and artifact folders must use pluginName; do not prefix package names with plan plugin IDs (for example `PLG-01`). |
| PUB-008 | Plugin package layout must follow plugin authoring standards; synthetic wrapper folders (for example `content/`) are disallowed unless explicitly approved. |
| PUB-009 | Every generated plugin version must include a detailed `README.md` with asset inventory, purpose, semantic version, author, source commit, per-asset SHA-256, and bundle SHA-256. |
| PUB-010 | `.artifacts/agent-plugins/` must mirror marketplace structure and include `marketplace.json` plus marketplace `README.md`. |

| Publication Decision ID | Decision | Default Chosen (Autonomous) | Rationale |
|---|---|---|---|
| PD-001 | Local disk staging location | In-workspace path `.artifacts/agent-plugins/<plugin-id>/<plugin-version>/` | Keeps build outputs discoverable and repeatable for maintainers while preserving per-plugin version isolation. |
| PD-002 | Workspace boundary | Yes, stage inside this workspace by default | Enables deterministic relative paths and avoids machine-specific absolute path drift. |
| PD-003 | Artifact tracking in git | Do not commit packaged binaries | Prevents repository bloat and keeps release artifacts managed by release channels. |
| PD-004 | GitHub distribution mechanism | GitHub Release assets in this repository | Lowest operational complexity for internal-first distribution and supports signed release evidence. |
| PD-005 | Custom marketplace surface | Versioned catalog JSON plus linked GitHub Releases | Provides a machine-readable index for wider distribution while preserving release-level provenance. |
| PD-006 | Package naming convention | Use pluginName only (for example `core-intake-governance`) | Keeps published package names clean and user-facing without planning ID prefixes. |
| PD-007 | Package folder structure | Flat plugin root; no extra `content/` wrapper | Aligns generated bundle structure with plugin authoring conventions and install expectations. |
| PD-008 | Marketplace artifact model | Use `.artifacts/agent-plugins/marketplace.json` and `.artifacts/agent-plugins/README.md` | Makes local staging mirror the intended GitHub marketplace structure. |

| Publication Mechanics | Path/Location | Owner | Notes |
|---|---|---|---|
| Local bundle staging root | `.artifacts/agent-plugins/` | Execution owner | Created during packaging stage if missing. |
| Plugin version folder | `.artifacts/agent-plugins/<plugin-name>/<plugin-version>/` | Execution owner | Contains plugin-standard root files and directories with no synthetic wrapper folder. |
| Integrity manifest output | `.artifacts/agent-plugins/<plugin-name>/<plugin-version>/manifest.json` | Execution owner | Uses SHA-256 per-file and aggregate digest policy. |
| Plugin README | `.artifacts/agent-plugins/<plugin-name>/<plugin-version>/README.md` | Execution + Review owners | Must include purpose, asset table, per-asset SHA-256, semver, author, source commit, and bundle SHA-256. |
| Marketplace catalog source | `.artifacts/agent-plugins/marketplace.json` | Planning + Review owners | Marketplace mirror index tracks plugin name, version, purpose, bundle SHA-256, and release metadata. |
| Marketplace README | `.artifacts/agent-plugins/README.md` | Planning + Review owners | Human-readable marketplace overview with per-plugin description, semver, and SHA-256. |
| Release publication target | GitHub Releases for this repository | Delivery owner | Release asset names include plugin id and version for deterministic retrieval. |

| Stage | Action | Output |
|---|---|---|
| STG-01 Local Package | Build plugin bundle and manifest into local staging path using pluginName-based folder names. | Bundle archive plus `manifest.json`, `README.md`, and checksum files under `.artifacts/agent-plugins/...`. |
| STG-02 Validation | Run integrity verification and standards gate checks. | Verification evidence linked to plan/change artifacts. |
| STG-03 Internal Publish | Create GitHub Release entry and upload staged bundle assets. | Internal release with immutable artifact URLs. |
| STG-04 Catalog Update | Update marketplace JSON and marketplace README to reference release asset URLs and digests. | Versioned marketplace mirror update committed to repository. |
| STG-05 Wider Distribution | Promote selected plugin versions to wider audience per approval policy. | Public or broader channel release entry with approval traceability. |

| Package Structure Decision | Required Layout |
|---|---|
| Plugin root layout | `plugin.json`, `README.md`, `manifest.json`, `asset-inventory.json`, `bundle.sha256.json`, plus asset directories (`agents/`, `instructions/`, `prompts/`, `skills/`) without synthetic `content/` wrapper. |
| Asset hash presentation | `README.md` must contain a table with asset path, purpose, and SHA-256. |
| Bundle hash presentation | `README.md` must include the bundle zip SHA-256 and algorithm declaration. |
| Metadata presentation | `README.md` must include plugin semantic version, author, source commit hash, and generation timestamp. |

| Plugin ID | Initial Publication Target | Audience | Rationale |
|---|---|---|---|
| PLG-01 | Private GitHub Release asset | Internal engineering and governance maintainers | Foundational control-plane asset should stabilize internally before broader exposure. |
| PLG-02 | Private GitHub Release asset | Internal planning and delivery owners | Planning strategy assets are workspace-specific and best controlled internally first. |
| PLG-03 | Private GitHub Release asset | Internal reviewers and governance operators | Review policy bundles often include internal governance workflows. |
| PLG-04 | Private GitHub Release asset | Internal plugin authors | Authoring lifecycle should harden internally before external distribution. |
| PLG-05 | Private GitHub Release asset | Internal compendium maintainers | Sync and doc operations are environment-specific and internal-first. |
| PLG-06 | Private GitHub Release asset | Internal .NET engineering teams | Domain bundle likely contains org-specific standards and constraints. |
| PLG-07 | Private GitHub Release asset | Internal DBA and data platform teams | SQL operations bundle should remain restricted pending security review posture. |
| PLG-08 | Private GitHub Release asset | Internal platform and MCP maintainers | MCP controls and contracts should be validated internally first. |
| PLG-09 | Private GitHub Release asset | Internal frontend teams | UX and frontend quality bundles may include org-specific governance expectations. |
| PLG-10 | Private GitHub Release asset | Internal mobile teams | Mobile release/readiness controls should mature internally first. |
| PLG-11 | Private GitHub Release asset | Internal Capacitor/mobile platform teams | Cross-platform mobile capability has higher integration variability; internal-first is safer. |
| PLG-12 | Private GitHub Release asset | Internal web platform teams | Framework bundle should be verified in-house before broader release. |
| PLG-13 | Private GitHub Release asset | Internal design system and frontend teams | Design-system standards are typically organization-bound initially. |
| PLG-14 | Private GitHub Release asset | Internal legacy modernization teams | Legacy-specific migration guidance often needs internal tuning first. |
| PLG-15 | Private GitHub Release asset | Internal Kendo/UI teams | Kendo bundle should be validated internally for licensing/governance constraints. |
| PLG-16 | Private GitHub Release asset | Internal security and performance reviewers | Research-quality gate bundles should remain controlled due sensitivity and interpretation context. |

| Optional Public Candidate | Promotion Prerequisites |
|---|---|
| PLG-01 | Two internal release cycles with no unresolved High findings; approved public-safe scope review. |
| PLG-04 | Internal adoption baseline met; publishing and integrity automation stable; explicit product owner approval. |
| PLG-03 | Governance content reviewed for external portability and policy sensitivity; explicit security sign-off. |

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
| Skills | agent-plugin-setup, agent-plugin-design, agent-plugin-implementation-markdown, agent-plugin-implementation-extension, agent-plugin-tools-integration, agent-plugin-security-hardening, agent-plugin-publishing, agent-authoring, instructions-authoring, skills-authoring, route-customization, agent-plugin-integrity |
| Rationale | Keeps agent-plugin authoring lifecycle self-contained and reusable for building plugin assets themselves. |

### PLG-05 compendium-sync-docs

| Asset Type | Assets |
|---|---|
| Agents | workspace-scaffolder.agent.md, governance-briefer.agent.md |
| Instructions | technical-docs.instructions.md, governance-lifecycle.instructions.md |
| Prompts | curate-copilot.prompt.md, generate-readme.prompt.md, librarian.prompt.md, write-component-docs.prompt.md |
| Skills | curate-copilot-instructions, index-docs, librarian, write-technical-docs, sync-customizations, sync-skills, sync-editorconfig, powershell-script-library, prune-sync-assets, prune-doc-artifacts |
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
| STEP-13 | WS-07 | Define plugin manifest schema with semver, sourceCommit, per-file digests, and aggregate digest fields. | Planning + Execution owners | STEP-07 | Manifest schema specification and example payload. | Not Started | Required |
| STEP-14 | WS-07 | Define deterministic integrity verification workflow for users and maintainers. | Review + Execution owners | STEP-13 | Verification playbook in plugin README contract section. | Not Started | Required |
| STEP-15 | WS-07 | Define maintenance cadence and update triggers for non-static plugin lifecycle. | Planning + Review owners | STEP-14 | Maintenance policy table with update triggers and SLA targets. | Not Started | Required |
| STEP-16 | WS-08 | Confirm publication target for each plugin and record approval owner per target. | Planning + Product/Delivery owners | STEP-10 | Publication target matrix with owner and approval status. | Not Started | Required |
| STEP-17 | WS-08 | Define channel-specific release templates (private release, public release, rollback). | Execution + Review owners | STEP-16 | Channel templates and checklist references. | Not Started | Required |
| STEP-18 | WS-08 | Define deterministic local disk staging path contract for plugin packaging outputs. | Execution + Review owners | STEP-17 | Path contract table with bundle, manifest, and checksum locations. | Not Started | Required |
| STEP-19 | WS-08 | Define GitHub custom marketplace catalog workflow and release URL mapping rules. | Planning + Execution + Review owners | STEP-18 | Catalog contract and release-linking checklist. | Not Started | Required |
| STEP-20 | WS-08 | Define package naming contract to remove plan plugin-ID prefixes from package names and folders. | Planning + Execution owners | STEP-18 | Naming contract with pluginName-based folder and archive examples. | Not Started | Required |
| STEP-21 | WS-08 | Validate plugin folder structure against plugin authoring standards and prohibit synthetic `content/` wrappers. | Review + Execution owners | STEP-20 | Packaging conformance checklist and pass/fail criteria. | Not Started | Required |
| STEP-22 | WS-08 | Define mandatory plugin README schema for per-asset purpose and SHA-256 evidence. | Planning + Review owners | STEP-21 | README template and validation checklist. | Not Started | Required |
| STEP-23 | WS-08 | Define `.artifacts/agent-plugins` marketplace mirror contract with `marketplace.json` and marketplace `README.md`. | Planning + Review owners | STEP-22 | Marketplace mirror schema and human-readable index template. | Not Started | Required |

## Status Tracking Grid

| Workstream ID | Workstream Name | Current State | Owner | Next Action | Blockers |
|---|---|---|---|---|---|
| WS-01 | Baseline and Rules | Not Started | Planning owner | Execute STEP-01 and STEP-02 after approval to proceed with planning completion workflow. | Awaiting user confirmation to proceed beyond draft. |
| WS-02 | Portfolio and Boundaries | Not Started | Planning owner | Execute STEP-03 and STEP-04. | WS-01 incomplete. |
| WS-03 | Overlap and Composition | Not Started | Planning + Review owners | Execute STEP-05 and STEP-06. | WS-02 incomplete. |
| WS-04 | Templates and Standards | Not Started | Planning + Review owners | Execute STEP-07 and STEP-08. | WS-03 incomplete. |
| WS-05 | Backlog and Gates | Not Started | Planning + Review owners | Execute STEP-09 and STEP-10. | WS-04 incomplete. |
| WS-06 | Review and Approval | Completed | User + Review owner | Advance to first execution slice kickoff artifact. | None |
| WS-07 | Lifecycle, Versioning, and Integrity | Not Started | Planning + Execution + Review owners | Execute STEP-13 through STEP-15 before broad plugin rollout completion. | Requires STEP-07 completion. |
| WS-08 | Publication Channel Strategy | Replanned - Pending Approval | Planning + Execution + Review owners | Execute STEP-16 through STEP-23 before release candidate publication. | Requires fresh user approval of revised packaging contract. |

## Acceptance Criteria Grid

| AC ID | Acceptance Criterion | Verification Method |
|---|---|---|
| AC-001 | Every proposed plugin has one primary capability statement and explicit boundary. | Review Plugin Portfolio Grid. |
| AC-002 | Every plugin has explicit asset manifests for agents, instructions, prompts, and skills. | Review Detailed Plugin Asset Manifests section. |
| AC-003 | Overlaps are documented with explicit rationale and are not accidental. | Review Cross-Plugin Overlap Grid. |
| AC-004 | Plan includes status fields, step IDs, owners, dependencies, and deliverables. | Review Delivery Workstreams and Status Tracking grids. |
| AC-005 | Plan is approval-gated and blocks execution until explicit user approval. | Verify STEP-12 and Execution Policy fields. |
| AC-006 | Plugin lifecycle maintenance/update policy is explicitly defined. | Review Plugin Lifecycle and Maintenance Model section. |
| AC-007 | Semver policy exists with major/minor/patch rules. | Review Semantic Versioning Policy section. |
| AC-008 | Manifest provenance and integrity policy includes sourceCommit and SHA-256 digest requirements. | Review Manifest Provenance and Integrity Policy section. |
| AC-009 | Every plugin has an explicit publication target and promotion path policy. | Review Publication Targets and Promotion Path section. |
| AC-010 | Publication mechanics define deterministic local disk path, workspace boundary, and GitHub release mapping. | Review Publication Mechanics table and staged flow (STG-01 to STG-05). |
| AC-011 | Package and archive naming use pluginName and do not use plan plugin-ID prefixes. | Review naming contract decisions and package examples. |
| AC-012 | Plugin package structure conforms to authoring standards and excludes synthetic `content/` wrappers. | Review Package Structure Decision and WS-08 conformance checklist. |
| AC-013 | Every plugin version includes detailed README with purpose, asset list, per-asset SHA-256, semver, author, source commit, and bundle SHA-256. | Review README schema and sample outputs. |
| AC-014 | `.artifacts/agent-plugins` includes `marketplace.json` and marketplace `README.md` mirroring GitHub marketplace structure. | Review marketplace mirror contract and example index entries. |

## Risk and Mitigation Grid

| Risk ID | Risk | Severity | Mitigation |
|---|---|---|---|
| RISK-01 | Plugin scope drifts into broad catch-all behavior. | High | Enforce CAP-001 and CAP-003 during STEP-04 boundary validation. |
| RISK-02 | Asset overlap causes hidden dependency cycles. | High | Maintain explicit overlap and composition dependency grids (STEP-05 and STEP-06). |
| RISK-03 | Missing or stale asset names break later packaging. | Medium | Refresh baseline inventory in STEP-01 before execution handoff. |
| RISK-04 | Governance policies applied inconsistently across plugins. | High | Apply standards checklist per plugin in STEP-08 and review in STEP-11. |
| RISK-05 | Premature execution starts without approval. | High | Mandatory hard gate at STEP-12 with explicit stop/go decision. |
| RISK-06 | Plugin version drift and unclear upgrade semantics create consumer confusion. | High | Enforce semver policy and maintenance update workflow (STEP-13 to STEP-15). |
| RISK-07 | Weak hashing choice enables integrity bypass by collision attacks. | High | Require SHA-256 digests and prohibit MD5 in integrity policy. |
| RISK-08 | Unspecified publication channel causes accidental exposure or release delays. | High | Enforce publication target matrix and channel-specific release templates (STEP-16 and STEP-17). |
| RISK-09 | Missing local staging path or catalog contract causes non-reproducible publication outcomes. | High | Enforce deterministic path and catalog workflow contracts (STEP-18 and STEP-19). |
| RISK-10 | Plugin naming with plan plugin-ID prefixes creates poor consumer-facing package names. | Medium | Enforce pluginName-only naming contract (STEP-20). |
| RISK-11 | Non-standard package folder layout (for example synthetic wrapper folders) breaks install expectations. | High | Enforce packaging conformance checks and block non-conforming bundles (STEP-21). |
| RISK-12 | Missing plugin README evidence reduces trust and verification usability. | High | Enforce README schema with per-asset SHA-256 and metadata checks (STEP-22). |
| RISK-13 | Marketplace mirror mismatch causes drift between local artifacts and GitHub distribution contract. | High | Enforce `marketplace.json` plus marketplace `README.md` mirror contract (STEP-23). |

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
| ASM-004 | Assumption | Plugin manifests must exclude retired or removed workspace assets. | High | Validate referenced assets exist before each plugin slice contract is drafted. |
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
| CQ-004 | Should packaged plugin artifacts stage on local disk inside this workspace, and what exact root path should be used? | Removes ambiguity about where packaging outputs are produced before publication. | Yes, inside workspace at `.artifacts/agent-plugins/` |
| CQ-005 | Should packaged binary artifacts be committed to git? | Controls repository hygiene and release artifact lifecycle. | No, do not commit binaries to git |
| CQ-006 | Should wider distribution use this repository Releases, a separate distribution repository, or both? | Determines promotion topology and release automation scope. | This repository GitHub Releases first |
| CQ-007 | What serves as the custom marketplace index for consumers? | Ensures discoverability for wider distribution beyond direct release links. | Versioned catalog JSON at `.github/agent-plugins/catalog.json` |
| CQ-008 | What promotion model should govern internal to wider distribution? | Defines control vs speed trade-off and approval ownership. | Manual approval per plugin/version promotion |
| CQ-009 | Should plugin package names include plan plugin-ID prefixes (for example `plg-01-`) or use pluginName only? | Controls consumer-facing package clarity and naming consistency. | Use pluginName only (no plan plugin-ID prefix) |
| CQ-010 | Should generated bundles include a synthetic `content/` wrapper folder or use plugin-standard root layout? | Ensures package structure conforms to plugin authoring expectations. | Use plugin-standard root layout; do not add `content/` wrapper |
| CQ-011 | What minimum content is required in each plugin README? | Defines reproducible verification and user-facing bundle transparency requirements. | Include purpose, full asset list with purpose + SHA-256, semver, author, source commit, bundle SHA-256 |
| CQ-012 | Should local staging mirror the future marketplace structure via `.artifacts/agent-plugins/marketplace.json` and `.artifacts/agent-plugins/README.md`? | Prevents local-to-release structure drift and missing marketplace metadata. | Yes, require marketplace mirror files in `.artifacts/agent-plugins/` |

## Clarification Resolution Log

| Question ID | Resolution | Source | Status |
|---|---|---|---|
| CQ-001 | Strictly PLG-01 first | Autonomous default after no in-session response availability | Resolved |
| CQ-002 | Central dependency references | Autonomous default after no in-session response availability | Resolved |
| CQ-003 | One plugin at a time | Autonomous default after no in-session response availability | Resolved |
| CQ-004 | Stage artifacts inside workspace at `.artifacts/agent-plugins/` with plugin/version subfolders | Autonomous default after no in-session response availability | Resolved |
| CQ-005 | Do not commit packaged binaries to git; track manifests and metadata only | Autonomous default after no in-session response availability | Resolved |
| CQ-006 | Publish internal-first using this repository GitHub Releases | Autonomous default after no in-session response availability | Resolved |
| CQ-007 | Maintain custom marketplace catalog at `.artifacts/agent-plugins/marketplace.json` with companion marketplace `README.md` | Updated per stakeholder feedback | Resolved |
| CQ-008 | Use manual approval gate for each internal-to-wider promotion | Autonomous default after no in-session response availability | Resolved |
| CQ-009 | Use pluginName only; remove plan plugin-ID prefixes from package names and folders | Stakeholder feedback | Resolved |
| CQ-010 | Use plugin-standard root layout and remove synthetic `content/` wrapper | Stakeholder feedback | Resolved |
| CQ-011 | Require detailed plugin README including per-asset purpose and SHA-256 plus bundle metadata | Stakeholder feedback | Resolved |
| CQ-012 | Mirror marketplace structure in `.artifacts/agent-plugins/` with `marketplace.json` and marketplace `README.md` | Stakeholder feedback | Resolved |

## Approval and Handoff Grid

| Field | Value |
|---|---|
| Approval Required | Yes |
| Approval Trigger | Stakeholder approval of revised packaging and marketplace contract updates (CQ-009 through CQ-012) with no unresolved High findings. |
| Approved Execution Route | orchestrator -> appropriate execution specialist per plugin domain. |
| Rejection Route | Keep plan in Draft, capture changes requested, revise this file only. |
| No-Execution Clause | No plugin creation, manifest generation, asset moves, or publishing actions are permitted until approval is explicitly recorded. |

## Recommended First Execution Slice (Post-Approval Only)

| Priority | Plugin | Why First | Expected Benefit |
|---|---|---|---|
| 1 | PLG-01 core-intake-governance | Foundation for deterministic routing and policy coverage. | Enables safe composition of all other plugins. |
| 2 | PLG-04 plugin-authoring-lifecycle | Provides authoring machinery used to package other capability plugins. | Reduces later packaging friction. |
| 3 | PLG-03 governance-review-audit | Establishes review gates before high-volume domain packaging. | Prevents non-compliant bundles from advancing. |
