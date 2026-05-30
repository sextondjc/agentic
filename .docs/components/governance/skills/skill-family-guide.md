# Skill Family Guide

## Purpose

This document groups the workspace skill library into practical skill families so contributors can choose the right capability faster and keep future additions consistent.

## Source and Scope

- Source of truth for included skills: `.github/catalogs/skills-discovery-index.md`.
- Scope: local workspace skills under `.github/skills/`.
- Classification style: functional families (what outcome a skill drives), not lane-only grouping.
- Snapshot date: 2026-04-30.

## Family Taxonomy

| Family | Primary Goal | Naming Signals | Included Skill Sets |
|---|---|---|---|
| Intake and Orchestration | Classify a request, define ownership, and route execution deterministically. | `*-orchestrator`, `compose-*`, `work-intake-*`, `delivery-orchestration` | `compose-skills`, `work-intake-governance`, `delivery-orchestration`, `csharp-orchestrator`, `mobile-orchestrator`, `mcp-servers-orchestrator`, `sql-server-orchestrator`, `benchmark-orchestrator`, `xunit-orchestrator`, `web-ux-quality-gate` |
| Planning and Product Shaping | Turn goals or ambiguous requests into testable plans, slices, and acceptance boundaries. | `*-planning`, `*-mapping`, `*-structuring`, `*-criteria` | `writing-plans`, `task-research`, `critical-thinking`, `refine-ideas`, `opportunity-mapping`, `backlog-structuring`, `product-scope-slicing`, `acceptance-criteria`, `experiment-design`, `delivery-forecasting`, `delivery-operating-system`, `delivery-status-grid` |
| Governance and Audit | Assess policy adherence, quality posture, and review findings across assets. | `audit-*`, `governance-*`, `acceptance-governance` | `governance-audit`, `governance-health-overview`, `governance-summarize`, `execute-customization-audit`, `audit-customization-types`, `audit-skill`, `audit-agent`, `audit-instructions`, `audit-prompts`, `acceptance-governance`, `request-code-review`, `remediate-review` |
| Documentation and Knowledge Curation | Author, organize, and keep documentation discoverable and link-valid. | `*-docs`, `librarian`, `index-*`, `prd-*`, `adr-*` | `write-technical-docs`, `librarian`, `index-docs`, `prd-generator`, `adr-generator`, `prune-doc-artifacts`, `governance-delivery`, `support-runbook-generator` |
| Customization Authoring and Lifecycle | Create and maintain agents, skills, prompts, and instruction assets. | `*-authoring`, `sync-*`, `route-*`, `taxonomy-*` | `agent-authoring`, `instructions-authoring`, `skills-authoring`, `route-customization`, `sync-customizations`, `sync-skills`, `sync-compendium`, `curate-copilot-instructions`, `optimize-customizations`, `asset-naming-taxonomy`, `taxonomy-tag-registry`, `matrix-skill-mapping`, `prune-sync-assets` |
| .NET Engineering and Architecture | Implement and improve .NET code, architecture, and delivery-ready engineering patterns. | `build-*`, `dotnet-*`, `domain-*`, `layer-*`, `syrx-*`, `ci-cd-*` | `build-blazor-web-apps`, `dotnet-refactor`, `dotnet-resilience`, `domain-design`, `api-design`, `layer-boundaries`, `async-programming`, `ci-cd-workflows`, `scaffold-dotnet`, `branch-completion`, `syrx-data-access`, `syrx-validation` |
| Testing and Verification | Design tests, execute multi-discipline test workflows, and gate release confidence. | `test-*`, `xunit-*`, `*-quality-gate`, `current-test-coverage` | `test-driven-development`, `test-design-review`, `test-orchestration`, `current-test-coverage`, all `xunit-*` skills, all `csharp-*-quality-gate` skills |
| Performance and Benchmarking | Measure, diagnose, and govern performance with repeatable evidence. | `benchmark-*`, `perf-*`, `performance-*` | `perf-benchmark`, `performance-research`, `benchmark-source-curation`, `benchmark-experiment-design`, `benchmark-statistical-analysis`, `benchmark-profiler-integration`, `benchmark-baseline-management`, `benchmark-ci-integration`, `benchmark-quality-gate` |
| Security, Reliability, and Operations | Strengthen security posture, reliability design, release controls, and support readiness. | `security-*`, `release-*`, `operability-*`, `sre-*`, `support-*` | `security-research`, `sre-practices`, `operability-design`, `release-readiness`, `release-simulation`, `post-release-retrospective`, `support-triage`, `support-runbook-generator`, `scope-change-control`, `flow-metrics`, `outcome-review` |
| SQL Server and Data | Design, secure, automate, and tune data platforms and T-SQL workloads. | `sql-server-*`, `data-*` | `data-design`, `sql-server-automation`, `sql-server-diagnostics`, `sql-server-query-tuning`, `sql-server-security`, `sql-server-standards` |
| MCP Platform Engineering | Build and harden Model Context Protocol servers and release gates. | `mcp-*`, `write-mcp-*`, `refine-mcp-*` | `write-mcp-servers`, `refine-mcp-servers`, `mcp-source-curation`, `mcp-sdk-selection-csharp-typescript`, `mcp-contract-versioning`, `mcp-transport-architecture`, `mcp-inspector-ci-observability`, `mcp-regression-test-design`, `mcp-authn-authz-hardening`, `mcp-server-quality-gate`, `mcp-release-readiness-gate` |
| UX and Frontend Experience | Define, prototype, implement, and quality-gate web/mobile user experience outcomes. | `design-*ux`, `prototype-*`, `build-web-*`, `build-mobile-*`, `web-ux-*`, `mobile-*` | `design-web-ux`, `design-mobile-ux`, `prototype-mobile-ui`, `build-web-frontend`, `build-mobile-apps`, `build-maui-apps`, `generate-web-icons`, all `web-ux-*` skills, `mobile-accessibility-quality-gate`, `mobile-offline-resilience`, `mobile-performance-quality-gate`, `mobile-release-readiness`, `usability-test-scripts` |

## Family Notes

### 1. Intake and Orchestration

Use this family first when a request spans multiple domains and ownership is unclear. These skills are responsible for deterministic intake and handoff, not deep implementation detail.

### 2. Planning and Product Shaping

Use this family when requirements are incomplete, priorities are disputed, or acceptance boundaries are missing. The output should be explicit slices, criteria, and hypotheses.

### 3. Governance and Audit

Use this family to assess completed or in-flight work against standards. It is finding-oriented and evidence-oriented, not feature-delivery oriented.

### 4. Documentation and Knowledge Curation

Use this family when readability, discoverability, and corpus integrity are primary outcomes. These skills keep documentation trustworthy and navigable.

### 5. Customization Authoring and Lifecycle

Use this family when changing the compendium itself (skills, prompts, instructions, agents, sync policy). These skills preserve naming consistency and lifecycle traceability.

### 6. .NET Engineering and Architecture

Use this family for implementation detail inside .NET systems. It covers architecture boundaries, resiliency, coding modernization, and framework-specific delivery guidance.

### 7. Testing and Verification

Use this family to design test strategy and produce go/no-go evidence. It includes general test workflow skills plus deep xUnit and C# quality-gate stacks.

### 8. Performance and Benchmarking

Use this family for measurement-driven performance work. It spans benchmark design, interpretation, profiler setup, and CI gating.

### 9. Security, Reliability, and Operations

Use this family for hardening and operational readiness, especially near release. It connects release governance with SRE and support execution.

### 10. SQL Server and Data

Use this family when the center of gravity is schema, query behavior, or DBA automation. It isolates data-plane concerns from general app concerns.

### 11. MCP Platform Engineering

Use this family when building or evolving MCP servers and contracts. It combines authoring, hardening, transport decisions, observability, and release governance.

### 12. UX and Frontend Experience

Use this family when product value depends on interface quality, usability outcomes, and release confidence for web or mobile UX.

## Selection Heuristics

1. If the request is cross-domain or unclear, start with an Intake and Orchestration skill.
2. If the request is still defining scope, prioritize Planning and Product Shaping.
3. If implementation is underway, move to an Engineering family (.NET Engineering, MCP, SQL/Data, UX/Frontend).
4. If evidence is required for merge or promotion, add Testing and Verification and the relevant Quality Gate.
5. If publishing or corpus integrity is part of done, include Documentation and Knowledge Curation.
6. If the request touches release risk, always layer in Security, Reliability, and Operations.

## Unclassified Skills

The following 9 skills from the discovery index are not yet assigned to a family. Each entry notes the most likely candidate family for a future reclassification.

| Skill | Description | Candidate Family |
|---|---|---|
| `analysis-execution` | Turns discovery work into traceable requirements with assumption ledgers and requirement hardening. | Planning and Product Shaping |
| `audit-powershell` | Audits PowerShell scripts for safety, reliability, and style with actionable correction recommendations. | Governance and Audit |
| `customer-feedback-synthesis` | Converts support tickets, UX findings, and product signals into prioritised roadmap insights. | Planning and Product Shaping |
| `docker-dotnet` | Containerizes .NET apps with secure, optimized Dockerfiles and compose files. | .NET Engineering and Architecture |
| `learn-topics` | Builds source-backed specialist learning paths with depth-calibrated subtopics. | Planning and Product Shaping |
| `plans` | Executes a written implementation plan in a session with review checkpoints. | Planning and Product Shaping |
| `powershell-script-library` | Maintains and deduplicates a catalog of reusable PowerShell scripts across automation and governance work. | Customization Authoring and Lifecycle |
| `sync-editorconfig` | Creates, normalizes, or updates a workspace `.editorconfig` with C# using/type-file policy validation. | Customization Authoring and Lifecycle |
| `task-execution` | Executes implementation plans with independent tasks in the current session. | Planning and Product Shaping |

## Coverage Notes

- This family model is intentionally functional and overlaps are expected.
- Several skills are valid in more than one family; they are placed where they add the strongest primary routing value.
- The definitive inventory remains `.github/catalogs/skills-discovery-index.md`.
- Unclassified skills above should be assigned to families in the next governance review pass.

