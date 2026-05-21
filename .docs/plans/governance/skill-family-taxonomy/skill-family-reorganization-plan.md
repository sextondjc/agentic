# Skill Family Reorganization Plan

## Plan Metadata

| Field | Value |
|---|---|
| Plan ID | PLAN-20260516-001 |
| Vision ID | VIS-20260516-001 |
| Status | Draft - Pending Approval |
| Primary Lane | Planning |
| Secondary Lanes | Execution, Review |
| Owner | Orchestrator-routed governance workflow |
| Scope Horizon | Taxonomy definition, migration design, validation design, and execution playbook |

## Overview

This plan defines a full, phased strategy to classify all skills into lifecycle-first families, reorganize storage into family-specific subfolders, provide targeted family entry points, and preserve deterministic discovery for agents. The current workspace uses catalog-driven discovery and hardcoded path conventions, so this plan treats catalog, script, and workflow updates as first-class work rather than incidental cleanup.

## Goals

- G-001: Establish a canonical lifecycle-first family model for all skills.
- G-002: Enable family-based storage and discoverability without ambiguity.
- G-003: Provide targeted family entry points so agents can route quickly to the right capability group.
- G-004: Ensure path migration does not leave orphaned links, stale catalogs, or broken governance checks.
- G-005: Preserve status and resume continuity through durable planning and execution artifacts.
- G-006: Support technology-focused discoverability without introducing a second physical folder hierarchy.

## Personas

- P-001: Workspace Maintainer who curates skills, instructions, and catalogs.
- P-002: Specialist Agent Author who needs stable and predictable skill lookup.
- P-003: Reviewer or Auditor who validates governance and link integrity.
- P-004: Downstream Consumer who syncs compendium assets and expects discoverable skill surfaces.

## Functional Requirements

- REQ-001: Every skill must have exactly one primary family assignment.
- REQ-002: Family storage must follow a deterministic directory model under .github/skills.
- REQ-003: Discovery indexes must resolve to family-qualified skill paths after migration.
- REQ-004: Family-level targeted entry points must exist for high-density families.
- REQ-005: Migration must include script and workflow path updates where assumptions are currently flat.
- REQ-006: The plan must define preflight, migration, and post-migration validation gates.
- REQ-007: All changes must maintain lane traceability and catalog integrity rules.
- REQ-008: Plan and execution status must be persisted to disk for session continuity.
- REQ-009: Each skill must include technology tags for secondary discovery and routing.
- REQ-010: Technology-specific skill indexes must be generated from metadata, not from alternate storage paths.

## Security Requirements

- SEC-001: No secrets, tokens, or credentials are introduced in migration artifacts.
- SEC-002: Generated links and path rewrites must stay workspace-local and deterministic.
- SEC-003: Automation scripts must fail fast on unresolved skill paths.

## Constraints

- CON-001: Discovery is catalog-driven; no reliance on implicit editor filesystem scanning.
- CON-002: Lifecycle lanes remain Planning, Execution, and Review.
- CON-003: Family model is lifecycle-first as directed by stakeholder.
- CON-004: Compatibility posture is non-backward-compatible cutover unless explicitly revised.
- CON-005: Documentation artifacts under .docs/plans require granular folder placement.
- CON-006: Lifecycle family remains the only physical foldering dimension; technology is secondary metadata only.

## Guidance and Patterns

- GUD-001: Keep .github/skills as canonical root and place family folders beneath it.
- GUD-002: Use one primary family plus optional metadata tags for cross-family relevance.
- GUD-003: Keep global discovery index as canonical; add family discovery indexes for targeted entry points.
- GUD-004: Use technology tags and technology indexes for targeted discovery without duplicating skill locations.
- PAT-001: One bounded migration wave with explicit preflight and rollback planning.

## User Stories

- GH-001: As a maintainer, I want each skill mapped to one family so the inventory is predictable.
- GH-002: As an agent author, I want family entry points so I can route quickly without scanning all skills.
- GH-003: As a reviewer, I want automated checks proving that all catalog links resolve.
- GH-004: As a downstream consumer, I want updated indexes so family-based browsing is intuitive.

## Interfaces and Data Contracts

### Family Mapping Contract

| Field | Type | Required | Description |
|---|---|---|---|
| skillName | string | Yes | Canonical skill folder name |
| primaryFamily | enum | Yes | planning, execution, review, test, orchestration, governance, security, standards, synchronization, delivery |
| secondaryTags | array<string> | No | Optional cross-family context tags |
| technologyTags | array<string> | Yes | Secondary discoverability tags, for example csharp, sveltekit, shadcn, sql-server, mcp, web-ux |
| oldPath | string | Yes | Existing flat skill path |
| newPath | string | Yes | Family-qualified target path |
| entryPointGroup | string | No | Family entry-point grouping key |
| migrationWave | string | Yes | Planned rollout wave identifier |

### Discovery Index Contract Additions

| Field | Type | Required | Description |
|---|---|---|---|
| Family | string | Yes | Primary family value for each skill row |
| Technology Tags | array<string> | Yes | Secondary discovery tags used to generate technology views |
| Skill File | markdown link | Yes | Family-qualified path to SKILL.md |
| Entry Point | markdown link | No | Family entry-point skill link when applicable |
| Technology Entry Point | markdown link | No | Technology-focused discovery link when technology index provides one |

## Acceptance Criteria

- AC-001: A complete family classification table exists for all current skills with no unassigned skill.
- AC-002: Target directory model is documented and validated against naming policy.
- AC-003: Discovery design includes both global and family entry surfaces.
- AC-004: Migration checklist includes catalogs, scripts, workflows, and documentation updates.
- AC-005: Validation plan includes preflight integrity, link integrity, and post-cutover route smoke tests.
- AC-006: Rollback procedure is documented with explicit owner and execution steps.
- AC-007: Plan artifact is stored in a durable path and includes status fields for cross-session continuation.
- AC-008: Every skill row includes at least one technology tag from the approved technology taxonomy.
- AC-009: Discovery includes both lifecycle-family and technology-index entry surfaces with zero broken links.

## Metrics

| Metric ID | Metric | Target |
|---|---|---|
| MET-001 | Skills with primary family assignment | 100 percent |
| MET-002 | Discovery links resolving successfully | 100 percent |
| MET-003 | Catalog row to SKILL file parity | 1 to 1 |
| MET-004 | Broken links after migration | 0 |
| MET-005 | Governance script pass rate for path checks | 100 percent |

## Risks

| Risk ID | Description | Severity | Mitigation |
|---|---|---|---|
| RISK-001 | Flat-path assumptions in scripts break after folder nesting | High | Refactor scripts before move and validate in preflight |
| RISK-002 | Catalog links drift during migration | High | Use generated mapping and row-level validation gates |
| RISK-003 | Workflow artifact paths become stale | High | Update and smoke-check workflow path references in same wave |
| RISK-004 | Cross-doc links remain stale | Medium | Run link-graph validation and patch in batch |
| RISK-005 | Family over-fragmentation reduces discoverability | Medium | Cap family count and enforce one primary family |

## Dependencies

- DEP-001: Current skills inventory and discovery catalog.
- DEP-002: Governance lifecycle policy and catalog integrity checks.
- DEP-003: PowerShell validation scripts used in governance cadence.
- DEP-004: Workflow definitions with hardcoded skill artifact paths.

## Phase Plan

## Phase 1 - Governance Baseline and Family Taxonomy Lock

### Objective
Create the authoritative family taxonomy and classification rules before touching any file paths.

### Scope
- Define the final family set.
- Define assignment rules for ambiguous skills.
- Establish one-primary-family policy.

### Tasks
1. Build a master skill inventory extract from current catalog rows.
2. Classify each skill into one primary family and optional secondary tags.
3. Resolve ambiguity decisions and document rationale in a decision grid.
4. Publish the family taxonomy contract in plan-adjacent artifact form.

### Deliverables
- Full classification table.
- Decision ledger for edge cases.
- Approved family enum contract.

### Exit Criteria
- AC-001 satisfied.
- No unresolved classification ambiguity remains.

## Phase 2 - Target Information Architecture and Entry Point Design

### Objective
Design how family structure and targeted entry points will work operationally for agents.

### Scope
- Define target path structure.
- Define family entry-point model.
- Define catalog representation model.
- Define technology taxonomy and technology index model.

### Tasks
1. Specify directory structure as .github/skills/family/skill.
2. Define entry-point criteria: create family entry skill when family has six or more member skills.
3. Define entry-point template: routing intent, sub-skill map, and escalation rules.
4. Define global versus family index interaction.
5. Define approved technology tags and tag assignment rules for all skills.
6. Define technology index and technology entry-point generation rules.

### Deliverables
- Target path architecture specification.
- Family entry-point specification.
- Discovery surface design map.
- Technology taxonomy and technology index specification.

### Exit Criteria
- AC-002 and AC-003 satisfied.
- AC-008 design constraints satisfied.

## Phase 3 - Migration Contract and Tooling Preparation

### Objective
Prepare deterministic migration inputs and automation aids before any move.

### Scope
- Path map generation.
- Rewrite target identification.
- Preflight checks.

### Tasks
1. Generate old-path to new-path mapping artifact.
2. Enumerate all files that reference skill paths.
3. Draft deterministic rewrite sequence by asset class.
4. Implement preflight check for mapping completeness.

### Deliverables
- Migration map artifact.
- Rewrite manifest by file class.
- Preflight validation script or checklist.

### Exit Criteria
- AC-004 partially satisfied for migration readiness.
- Preflight reports zero unmapped skills.

## Phase 4 - Catalog and Discovery Refactor

### Objective
Refactor discovery assets so family-qualified paths become canonical and navigable.

### Scope
- Global skills discovery index update.
- Family discovery index creation.
- Technology discovery index creation.
- Agent-facing routing documentation updates.

### Tasks
1. Update skill file links in global discovery index to family-qualified paths.
2. Add Family column or equivalent family metadata in index rows.
3. Create family-specific index files for targeted browsing.
4. Add Technology Tags metadata to discovery rows.
5. Create technology-specific index files for targeted browsing.
6. Update references in governance and routing docs.

### Deliverables
- Updated global skills discovery index.
- Family index set.
- Technology index set.
- Updated routing references.

### Exit Criteria
- AC-003 and AC-004 satisfied for discovery surfaces.
- AC-009 satisfied for dual discovery surfaces.

## Phase 5 - Physical Reorganization Wave

### Objective
Move skill folders into family subfolders in one bounded cutover wave.

### Scope
- Physical folder relocation.
- Reference folder continuity.
- Artifact path relocation where needed.

### Tasks
1. Execute folder move using migration map.
2. Preserve skill-local references folder paths under new family location.
3. Confirm all SKILL files remain reachable through catalog links.
4. Validate no duplicate or orphan skill folders remain.

### Deliverables
- Family-organized skill directory tree.
- Post-move inventory parity report.

### Exit Criteria
- AC-004 and AC-005 partially satisfied.
- MET-001 and MET-003 at target.

## Phase 6 - Script and Workflow Compatibility Updates

### Objective
Update governance scripts and workflows that currently assume flat skill layout.

### Scope
- PowerShell validators.
- Workflow artifact path references.
- Sync-related manifests dependent on old paths.

### Tasks
1. Refactor skill enumeration scripts to recurse and detect true skill folders.
2. Update workflow files with new family-qualified artifact paths.
3. Regenerate any path-indexed manifests used by sync workflows.
4. Add safeguards that fail on unresolved old paths.

### Deliverables
- Updated script suite.
- Updated workflow definitions.
- Regenerated manifests and parity evidence.

### Exit Criteria
- AC-004 and AC-005 satisfied for operational checks.
- MET-005 at target.

## Phase 7 - Validation, Review, and Release Readiness

### Objective
Prove the migration is complete, coherent, and governance-safe before closure.

### Scope
- Link integrity.
- Catalog integrity.
- Route smoke tests.
- Review findings disposition.

### Tasks
1. Run link-graph validation across docs and catalogs.
2. Run catalog integrity validation for row-to-file parity.
3. Run route smoke tests for orchestrator, selected family entry points, and selected technology entry points.
4. Record findings and dispositions in review artifact.

### Deliverables
- Validation evidence bundle.
- Review report with severity-tagged findings and dispositions.

### Exit Criteria
- AC-005 and AC-006 satisfied.
- AC-009 verification completed.
- MET-002 and MET-004 at target.

## Phase 8 - Documentation Finalization and Handoff

### Objective
Publish durable guidance so future sessions and maintainers can continue safely.

### Scope
- Plan status update.
- Migration summary publication.
- Follow-up backlog capture.

### Tasks
1. Update this plan status from Draft to Approved or In Progress after decision.
2. Publish migration summary with before and after path conventions.
3. Capture deferred improvements as backlog entries.
4. Record final closure decision and owner sign-off.

### Deliverables
- Updated plan with final status and decision log.
- Migration summary document.
- Deferred backlog list.

### Exit Criteria
- AC-007 satisfied.
- Plan and artifacts are session-resumable without verbal context.

## Execution Readiness Checklist

- [ ] Family taxonomy approved.
- [ ] Mapping artifact generated and validated.
- [ ] Catalog rewrite manifest approved.
- [ ] Script compatibility patch set prepared.
- [ ] Workflow path updates prepared.
- [ ] Validation command set prepared.
- [ ] Rollback owner assigned.

## Rollback Procedure

### Trigger Conditions
- More than zero unresolved broken links after cutover.
- Catalog parity failure after migration.
- Governance scripts fail on critical integrity checks.

### Rollback Owner
- Role: Governance Maintainer

### Steps
1. Halt further migration commits.
2. Restore pre-cutover directory structure from migration snapshot.
3. Revert catalog and workflow path changes to previous stable state.
4. Re-run integrity checks to confirm restoration.
5. Record rollback evidence and root cause notes.

## Status Ledger

| Date | Status | Decision | Notes |
|---|---|---|---|
| 2026-05-16 | Draft - Pending Approval | Awaiting stakeholder approval | Full phase plan published to disk |



## Appendix A - Skill Family Definitions

| Skill Family | Purpose |
|---|---|
| planning | Skills that shape intent, requirements, architecture direction, and decision framing before implementation. |
| execution | Skills that implement or evolve assets directly in active delivery workstreams. |
| review | Skills that evaluate completed work, produce findings, and recommend remediation dispositions. |
| test | Skills that design, execute, assess, or gate quality through tests, benchmarks, and evidence checks. |
| orchestration | Skills that coordinate multi-capability work, route to specialist sub-flows, and unify execution contracts. |
| governance | Skills that enforce lifecycle policy, catalog integrity, audits, and governance health outcomes. |
| security | Skills focused on threat reduction, security controls, hardening, and security-specific validation. |
| standards | Skills that establish reusable engineering standards, conventions, setup baselines, and reference practices. |
| synchronization | Skills that synchronize, update, prune, or align shared customization assets across repositories. |
| delivery | Skills for flow management, planning-to-delivery control, forecasting, and release-oriented operational execution. |
## Appendix B - Skill Migration Mapping Grid (Detailed)

This grid is the proposed migration mapping for all currently discoverable skills. Current PDL is derived from the skills catalog lane columns. The new path is the target family-qualified path under .github/skills.

| Skill Name | Current PDL | Assigned Family | New Path |
|---|---|---|---|
| acceptance-criteria | Execution / Planning | execution | .github/skills/execution/acceptance-criteria/SKILL.md |
| acceptance-governance | Review / Execution | governance | .github/skills/governance/acceptance-governance/SKILL.md |
| adr-generator | Planning / Review | planning | .github/skills/planning/adr-generator/SKILL.md |
| agent-authoring | Execution / Review | standards | .github/skills/standards/agent-authoring/SKILL.md |
| agentic-workflow-patterns | Planning / Execution | planning | .github/skills/planning/agentic-workflow-patterns/SKILL.md |
| analysis-execution | Execution / Planning | execution | .github/skills/execution/analysis-execution/SKILL.md |
| api-design | Planning / Execution | planning | .github/skills/planning/api-design/SKILL.md |
| asset-naming-taxonomy | Execution / Review | standards | .github/skills/standards/asset-naming-taxonomy/SKILL.md |
| async-programming | Execution / Review | execution | .github/skills/execution/async-programming/SKILL.md |
| audit-agent | Review / Planning | governance | .github/skills/governance/audit-agent/SKILL.md |
| audit-customization-types | Review / Execution | governance | .github/skills/governance/audit-customization-types/SKILL.md |
| audit-instructions | Review / Execution | governance | .github/skills/governance/audit-instructions/SKILL.md |
| audit-powershell | Review / Execution | governance | .github/skills/governance/audit-powershell/SKILL.md |
| audit-prompts | Review / Execution | governance | .github/skills/governance/audit-prompts/SKILL.md |
| audit-skill | Review / Planning | governance | .github/skills/governance/audit-skill/SKILL.md |
| backlog-structuring | Planning / Execution | delivery | .github/skills/delivery/backlog-structuring/SKILL.md |
| benchmark-baseline-management | Execution / Review | test | .github/skills/test/benchmark-baseline-management/SKILL.md |
| benchmark-ci-integration | Execution / Review | test | .github/skills/test/benchmark-ci-integration/SKILL.md |
| benchmark-profiler-integration | Execution / Review | test | .github/skills/test/benchmark-profiler-integration/SKILL.md |
| benchmark-quality-gate | Review / Execution | test | .github/skills/test/benchmark-quality-gate/SKILL.md |
| benchmark-source-curation | Planning / Execution | test | .github/skills/test/benchmark-source-curation/SKILL.md |
| benchmark-statistical-analysis | Execution / Review | test | .github/skills/test/benchmark-statistical-analysis/SKILL.md |
| branch-completion | Execution / Review | execution | .github/skills/execution/branch-completion/SKILL.md |
| build-blazor-web-apps | Execution / Review | execution | .github/skills/execution/build-blazor-web-apps/SKILL.md |
| build-maui-apps | Execution / Planning | execution | .github/skills/execution/build-maui-apps/SKILL.md |
| build-mobile-apps | Execution / Planning | execution | .github/skills/execution/build-mobile-apps/SKILL.md |
| build-web-frontend | Execution / Review | execution | .github/skills/execution/build-web-frontend/SKILL.md |
| capacitor-accessibility | Execution / Review | execution | .github/skills/execution/capacitor-accessibility/SKILL.md |
| capacitor-auth-session | Execution / Review | execution | .github/skills/execution/capacitor-auth-session/SKILL.md |
| capacitor-ci-integration | Execution / Review | execution | .github/skills/execution/capacitor-ci-integration/SKILL.md |
| capacitor-deep-linking | Execution / Review | execution | .github/skills/execution/capacitor-deep-linking/SKILL.md |
| capacitor-environment-config | Execution / Review | execution | .github/skills/execution/capacitor-environment-config/SKILL.md |
| capacitor-live-updates | Execution / Review | execution | .github/skills/execution/capacitor-live-updates/SKILL.md |
| capacitor-migration-upgrades | Planning / Execution | planning | .github/skills/planning/capacitor-migration-upgrades/SKILL.md |
| capacitor-native-apis | Execution / Review | execution | .github/skills/execution/capacitor-native-apis/SKILL.md |
| capacitor-observability | Execution / Review | execution | .github/skills/execution/capacitor-observability/SKILL.md |
| capacitor-offline-resilience | Execution / Review | execution | .github/skills/execution/capacitor-offline-resilience/SKILL.md |
| capacitor-performance-quality-gate | Review / Execution | test | .github/skills/test/capacitor-performance-quality-gate/SKILL.md |
| capacitor-plugin-authoring | Execution / Review | execution | .github/skills/execution/capacitor-plugin-authoring/SKILL.md |
| capacitor-privacy-compliance | Execution / Review | execution | .github/skills/execution/capacitor-privacy-compliance/SKILL.md |
| capacitor-push-notifications | Execution / Review | execution | .github/skills/execution/capacitor-push-notifications/SKILL.md |
| capacitor-release-readiness | Execution / Review | execution | .github/skills/execution/capacitor-release-readiness/SKILL.md |
| capacitor-security | Execution / Review | security | .github/skills/security/capacitor-security/SKILL.md |
| capacitor-setup | Execution / Planning | standards | .github/skills/standards/capacitor-setup/SKILL.md |
| capacitor-source-curation | Planning / Execution | standards | .github/skills/standards/capacitor-source-curation/SKILL.md |
| capacitor-testing | Execution / Review | test | .github/skills/test/capacitor-testing/SKILL.md |
| capacitor-web-integration | Execution / Review | execution | .github/skills/execution/capacitor-web-integration/SKILL.md |
| ci-cd-workflows | Execution / Review | execution | .github/skills/execution/ci-cd-workflows/SKILL.md |
| compose-skills | Planning / Execution | orchestration | .github/skills/orchestration/compose-skills/SKILL.md |
| critical-thinking | Planning / Review | planning | .github/skills/planning/critical-thinking/SKILL.md |
| csharp-architecture-quality-gate | Review / Execution | test | .github/skills/test/csharp-architecture-quality-gate/SKILL.md |
| csharp-async-quality-gate | Review / Execution | test | .github/skills/test/csharp-async-quality-gate/SKILL.md |
| csharp-data-access-quality-gate | Review / Execution | test | .github/skills/test/csharp-data-access-quality-gate/SKILL.md |
| csharp-language-quality-gate | Review / Execution | test | .github/skills/test/csharp-language-quality-gate/SKILL.md |
| csharp-release-quality-gate | Review / Execution | test | .github/skills/test/csharp-release-quality-gate/SKILL.md |
| csharp-testing-quality-gate | Review / Execution | test | .github/skills/test/csharp-testing-quality-gate/SKILL.md |
| curate-copilot-instructions | Execution / Planning | execution | .github/skills/execution/curate-copilot-instructions/SKILL.md |
| current-test-coverage | Review / Execution | test | .github/skills/test/current-test-coverage/SKILL.md |
| customer-feedback-synthesis | Planning / Execution | planning | .github/skills/planning/customer-feedback-synthesis/SKILL.md |
| data-design | Execution / Planning | execution | .github/skills/execution/data-design/SKILL.md |
| delivery-forecasting | Planning / Review | delivery | .github/skills/delivery/delivery-forecasting/SKILL.md |
| delivery-operating-system | Planning / Execution | delivery | .github/skills/delivery/delivery-operating-system/SKILL.md |
| delivery-orchestration | Planning / Execution | orchestration | .github/skills/orchestration/delivery-orchestration/SKILL.md |
| delivery-status-grid | Review / Planning | delivery | .github/skills/delivery/delivery-status-grid/SKILL.md |
| dependency-security-scan | Execution / Review | security | .github/skills/security/dependency-security-scan/SKILL.md |
| design-mobile-ux | Planning / Execution | planning | .github/skills/planning/design-mobile-ux/SKILL.md |
| design-web-ux | Planning / Execution | planning | .github/skills/planning/design-web-ux/SKILL.md |
| docker-dotnet | Execution / Review | execution | .github/skills/execution/docker-dotnet/SKILL.md |
| domain-design | Planning / Execution | planning | .github/skills/planning/domain-design/SKILL.md |
| dotnet-refactor | Execution / Review | standards | .github/skills/standards/dotnet-refactor/SKILL.md |
| dotnet-resilience | Execution / Review | execution | .github/skills/execution/dotnet-resilience/SKILL.md |
| execute-customization-audit | Review / Planning | governance | .github/skills/governance/execute-customization-audit/SKILL.md |
| experiment-design | Execution / Planning | execution | .github/skills/execution/experiment-design/SKILL.md |
| flow-metrics | Execution / Review | delivery | .github/skills/delivery/flow-metrics/SKILL.md |
| generate-web-icons | Execution / Planning | execution | .github/skills/execution/generate-web-icons/SKILL.md |
| governance-audit | Review / Planning | governance | .github/skills/governance/governance-audit/SKILL.md |
| governance-delivery | Planning / Review | governance | .github/skills/governance/governance-delivery/SKILL.md |
| governance-health-overview | Review / Planning | governance | .github/skills/governance/governance-health-overview/SKILL.md |
| governance-summarize | Review / Planning | governance | .github/skills/governance/governance-summarize/SKILL.md |
| index-docs | Execution / Planning | execution | .github/skills/execution/index-docs/SKILL.md |
| instructions-authoring | Execution / Review | standards | .github/skills/standards/instructions-authoring/SKILL.md |
| jquery-ajax | Execution / Review | execution | .github/skills/execution/jquery-ajax/SKILL.md |
| jquery-ci-integration | Execution / Review | execution | .github/skills/execution/jquery-ci-integration/SKILL.md |
| jquery-core | Execution / Review | execution | .github/skills/execution/jquery-core/SKILL.md |
| jquery-events | Execution / Review | execution | .github/skills/execution/jquery-events/SKILL.md |
| jquery-migration | Planning / Execution | planning | .github/skills/planning/jquery-migration/SKILL.md |
| jquery-performance | Execution / Review | execution | .github/skills/execution/jquery-performance/SKILL.md |
| jquery-plugins | Execution / Review | execution | .github/skills/execution/jquery-plugins/SKILL.md |
| jquery-quality-gate | Review / Execution | test | .github/skills/test/jquery-quality-gate/SKILL.md |
| jquery-security | Review / Execution | security | .github/skills/security/jquery-security/SKILL.md |
| jquery-source-curation | Planning / Execution | standards | .github/skills/standards/jquery-source-curation/SKILL.md |
| jquery-testing | Execution / Review | test | .github/skills/test/jquery-testing/SKILL.md |
| kendo-ui-accessibility | Execution / Review | execution | .github/skills/execution/kendo-ui-accessibility/SKILL.md |
| kendo-ui-charts-dataviz | Execution / Review | execution | .github/skills/execution/kendo-ui-charts-dataviz/SKILL.md |
| kendo-ui-ci-integration | Execution / Review | execution | .github/skills/execution/kendo-ui-ci-integration/SKILL.md |
| kendo-ui-core | Execution / Review | execution | .github/skills/execution/kendo-ui-core/SKILL.md |
| kendo-ui-data-binding | Execution / Review | execution | .github/skills/execution/kendo-ui-data-binding/SKILL.md |
| kendo-ui-export-printing | Execution / Review | execution | .github/skills/execution/kendo-ui-export-printing/SKILL.md |
| kendo-ui-forms | Execution / Review | execution | .github/skills/execution/kendo-ui-forms/SKILL.md |
| kendo-ui-grid-advanced | Execution / Review | execution | .github/skills/execution/kendo-ui-grid-advanced/SKILL.md |
| kendo-ui-localization | Execution / Review | execution | .github/skills/execution/kendo-ui-localization/SKILL.md |
| kendo-ui-migration | Planning / Execution | planning | .github/skills/planning/kendo-ui-migration/SKILL.md |
| kendo-ui-observability | Execution / Review | execution | .github/skills/execution/kendo-ui-observability/SKILL.md |
| kendo-ui-performance | Execution / Review | execution | .github/skills/execution/kendo-ui-performance/SKILL.md |
| kendo-ui-quality-gate | Review / Execution | test | .github/skills/test/kendo-ui-quality-gate/SKILL.md |
| kendo-ui-real-time-updates | Execution / Review | execution | .github/skills/execution/kendo-ui-real-time-updates/SKILL.md |
| kendo-ui-security | Review / Execution | security | .github/skills/security/kendo-ui-security/SKILL.md |
| kendo-ui-source-curation | Planning / Execution | standards | .github/skills/standards/kendo-ui-source-curation/SKILL.md |
| kendo-ui-state-persistence | Execution / Review | execution | .github/skills/execution/kendo-ui-state-persistence/SKILL.md |
| kendo-ui-testing | Execution / Review | test | .github/skills/test/kendo-ui-testing/SKILL.md |
| kendo-ui-theming | Execution / Review | execution | .github/skills/execution/kendo-ui-theming/SKILL.md |
| kendo-ui-upload-file-workflows | Execution / Review | execution | .github/skills/execution/kendo-ui-upload-file-workflows/SKILL.md |
| layer-boundaries | Execution / Review | standards | .github/skills/standards/layer-boundaries/SKILL.md |
| learn-topics | Planning / Execution | planning | .github/skills/planning/learn-topics/SKILL.md |
| librarian | Execution / Review | execution | .github/skills/execution/librarian/SKILL.md |
| matrix-skill-mapping | Review / Planning | governance | .github/skills/governance/matrix-skill-mapping/SKILL.md |
| mcp-authn-authz-hardening | Review / Execution | security | .github/skills/security/mcp-authn-authz-hardening/SKILL.md |
| mcp-contract-versioning | Execution / Review | execution | .github/skills/execution/mcp-contract-versioning/SKILL.md |
| mcp-inspector-ci-observability | Execution / Review | execution | .github/skills/execution/mcp-inspector-ci-observability/SKILL.md |
| mcp-regression-test-design | Execution / Review | execution | .github/skills/execution/mcp-regression-test-design/SKILL.md |
| mcp-release-readiness-gate | Review / Execution | review | .github/skills/review/mcp-release-readiness-gate/SKILL.md |
| mcp-sdk-selection-csharp-typescript | Planning / Execution | planning | .github/skills/planning/mcp-sdk-selection-csharp-typescript/SKILL.md |
| mcp-server-quality-gate | Review / Execution | test | .github/skills/test/mcp-server-quality-gate/SKILL.md |
| mcp-source-curation | Planning / Execution | standards | .github/skills/standards/mcp-source-curation/SKILL.md |
| mcp-transport-architecture | Execution / Review | execution | .github/skills/execution/mcp-transport-architecture/SKILL.md |
| mobile-accessibility-quality-gate | Execution / Review | test | .github/skills/test/mobile-accessibility-quality-gate/SKILL.md |
| mobile-offline-resilience | Execution / Review | execution | .github/skills/execution/mobile-offline-resilience/SKILL.md |
| mobile-performance-quality-gate | Execution / Review | test | .github/skills/test/mobile-performance-quality-gate/SKILL.md |
| mobile-release-readiness | Execution / Review | execution | .github/skills/execution/mobile-release-readiness/SKILL.md |
| operability-design | Execution / Planning | execution | .github/skills/execution/operability-design/SKILL.md |
| opportunity-mapping | Planning / Execution | delivery | .github/skills/delivery/opportunity-mapping/SKILL.md |
| optimize-customizations | Review / Execution | governance | .github/skills/governance/optimize-customizations/SKILL.md |
| orchestrate-benchmark | Planning / Execution | orchestration | .github/skills/orchestration/orchestrate-benchmark/SKILL.md |
| orchestrate-capacitor | Planning / Execution | orchestration | .github/skills/orchestration/orchestrate-capacitor/SKILL.md |
| orchestrate-csharp | Planning / Execution | orchestration | .github/skills/orchestration/orchestrate-csharp/SKILL.md |
| orchestrate-jquery | Planning / Execution | orchestration | .github/skills/orchestration/orchestrate-jquery/SKILL.md |
| orchestrate-kendo | Planning / Execution | orchestration | .github/skills/orchestration/orchestrate-kendo/SKILL.md |
| orchestrate-mcp-servers | Planning / Execution | orchestration | .github/skills/orchestration/orchestrate-mcp-servers/SKILL.md |
| orchestrate-mobile | Planning / Execution | orchestration | .github/skills/orchestration/orchestrate-mobile/SKILL.md |
| orchestrate-shadcn | Planning / Execution | orchestration | .github/skills/orchestration/orchestrate-shadcn/SKILL.md |
| orchestrate-sql-server | Planning / Execution | orchestration | .github/skills/orchestration/orchestrate-sql-server/SKILL.md |
| orchestrate-sveltekit | Planning / Execution | orchestration | .github/skills/orchestration/orchestrate-sveltekit/SKILL.md |
| orchestrate-tailwind | Planning / Execution | orchestration | .github/skills/orchestration/orchestrate-tailwind/SKILL.md |
| orchestrate-xunit | Planning / Execution | orchestration | .github/skills/orchestration/orchestrate-xunit/SKILL.md |
| outcome-review | Review / Planning | delivery | .github/skills/delivery/outcome-review/SKILL.md |
| perf-benchmark | Review / Planning | test | .github/skills/test/perf-benchmark/SKILL.md |
| performance-research | Review / Planning | review | .github/skills/review/performance-research/SKILL.md |
| plans | Execution / Review | execution | .github/skills/execution/plans/SKILL.md |
| post-release-retrospective | Review / Execution | delivery | .github/skills/delivery/post-release-retrospective/SKILL.md |
| powershell-script-library | Execution / Review | standards | .github/skills/standards/powershell-script-library/SKILL.md |
| prd-generator | Planning / Review | planning | .github/skills/planning/prd-generator/SKILL.md |
| probabilistic-forecasting | Planning / Review | delivery | .github/skills/delivery/probabilistic-forecasting/SKILL.md |
| product-scope-slicing | Planning / Execution | delivery | .github/skills/delivery/product-scope-slicing/SKILL.md |
| prototype-mobile-ui | Planning / Execution | planning | .github/skills/planning/prototype-mobile-ui/SKILL.md |
| prune-doc-artifacts | Review / Execution | review | .github/skills/review/prune-doc-artifacts/SKILL.md |
| prune-sync-assets | Execution / Review | synchronization | .github/skills/synchronization/prune-sync-assets/SKILL.md |
| refine-ideas | Planning / Review | planning | .github/skills/planning/refine-ideas/SKILL.md |
| refine-mcp-servers | Execution / Review | execution | .github/skills/execution/refine-mcp-servers/SKILL.md |
| release-readiness | Execution / Review | execution | .github/skills/execution/release-readiness/SKILL.md |
| release-simulation | Execution / Review | execution | .github/skills/execution/release-simulation/SKILL.md |
| remediate-review | Review / Execution | review | .github/skills/review/remediate-review/SKILL.md |
| request-code-review | Review / Execution | review | .github/skills/review/request-code-review/SKILL.md |
| route-customization | Planning / Review | orchestration | .github/skills/orchestration/route-customization/SKILL.md |
| scaffold-dotnet | Execution / Planning | standards | .github/skills/standards/scaffold-dotnet/SKILL.md |
| scope-change-control | Execution / Planning | delivery | .github/skills/delivery/scope-change-control/SKILL.md |
| security-research | Review / Planning | security | .github/skills/security/security-research/SKILL.md |
| shadcn-accessibility | Execution / Review | execution | .github/skills/execution/shadcn-accessibility/SKILL.md |
| shadcn-animation | Execution / Review | execution | .github/skills/execution/shadcn-animation/SKILL.md |
| shadcn-ci-integration | Execution / Review | execution | .github/skills/execution/shadcn-ci-integration/SKILL.md |
| shadcn-component-design | Execution / Review | execution | .github/skills/execution/shadcn-component-design/SKILL.md |
| shadcn-data-display | Execution / Review | execution | .github/skills/execution/shadcn-data-display/SKILL.md |
| shadcn-design-system | Planning / Execution | planning | .github/skills/planning/shadcn-design-system/SKILL.md |
| shadcn-forms | Execution / Review | execution | .github/skills/execution/shadcn-forms/SKILL.md |
| shadcn-migration | Planning / Execution | planning | .github/skills/planning/shadcn-migration/SKILL.md |
| shadcn-quality-gate | Review / Execution | test | .github/skills/test/shadcn-quality-gate/SKILL.md |
| shadcn-registry | Execution / Review | execution | .github/skills/execution/shadcn-registry/SKILL.md |
| shadcn-setup | Execution / Review | standards | .github/skills/standards/shadcn-setup/SKILL.md |
| shadcn-source-curation | Planning / Execution | standards | .github/skills/standards/shadcn-source-curation/SKILL.md |
| shadcn-testing | Execution / Review | test | .github/skills/test/shadcn-testing/SKILL.md |
| shadcn-theming | Execution / Review | execution | .github/skills/execution/shadcn-theming/SKILL.md |
| skills-authoring | Execution / Review | standards | .github/skills/standards/skills-authoring/SKILL.md |
| sql-server-automation | Execution / Review | execution | .github/skills/execution/sql-server-automation/SKILL.md |
| sql-server-diagnostics | Execution / Review | execution | .github/skills/execution/sql-server-diagnostics/SKILL.md |
| sql-server-query-tuning | Execution / Review | execution | .github/skills/execution/sql-server-query-tuning/SKILL.md |
| sql-server-security | Execution / Review | security | .github/skills/security/sql-server-security/SKILL.md |
| sql-server-standards | Execution / Review | standards | .github/skills/standards/sql-server-standards/SKILL.md |
| sre-practices | Planning / Execution | planning | .github/skills/planning/sre-practices/SKILL.md |
| support-runbook-generator | Execution / Review | execution | .github/skills/execution/support-runbook-generator/SKILL.md |
| support-triage | Execution / Review | execution | .github/skills/execution/support-triage/SKILL.md |
| sveltekit-actions | Execution / Review | execution | .github/skills/execution/sveltekit-actions/SKILL.md |
| sveltekit-adapters | Execution / Review | execution | .github/skills/execution/sveltekit-adapters/SKILL.md |
| sveltekit-advanced-routing | Execution / Review | execution | .github/skills/execution/sveltekit-advanced-routing/SKILL.md |
| sveltekit-auth | Execution / Review | execution | .github/skills/execution/sveltekit-auth/SKILL.md |
| sveltekit-configuration | Execution / Review | execution | .github/skills/execution/sveltekit-configuration/SKILL.md |
| sveltekit-environment | Execution / Review | execution | .github/skills/execution/sveltekit-environment/SKILL.md |
| sveltekit-errors | Execution / Review | execution | .github/skills/execution/sveltekit-errors/SKILL.md |
| sveltekit-hooks | Execution / Review | execution | .github/skills/execution/sveltekit-hooks/SKILL.md |
| sveltekit-load | Execution / Review | execution | .github/skills/execution/sveltekit-load/SKILL.md |
| sveltekit-observability | Execution / Review | execution | .github/skills/execution/sveltekit-observability/SKILL.md |
| sveltekit-packaging | Execution / Review | execution | .github/skills/execution/sveltekit-packaging/SKILL.md |
| sveltekit-page-options | Execution / Review | execution | .github/skills/execution/sveltekit-page-options/SKILL.md |
| sveltekit-routing | Execution / Review | execution | .github/skills/execution/sveltekit-routing/SKILL.md |
| sveltekit-server-endpoints | Execution / Review | execution | .github/skills/execution/sveltekit-server-endpoints/SKILL.md |
| sveltekit-state-management | Execution / Review | execution | .github/skills/execution/sveltekit-state-management/SKILL.md |
| sveltekit-testing | Execution / Review | test | .github/skills/test/sveltekit-testing/SKILL.md |
| sync-compendium | Execution / Review | synchronization | .github/skills/synchronization/sync-compendium/SKILL.md |
| sync-customizations | Review / Planning | synchronization | .github/skills/synchronization/sync-customizations/SKILL.md |
| sync-editorconfig | Execution / Review | synchronization | .github/skills/synchronization/sync-editorconfig/SKILL.md |
| sync-skills | Review / Planning | synchronization | .github/skills/synchronization/sync-skills/SKILL.md |
| syrx-data-access | Execution / Review | execution | .github/skills/execution/syrx-data-access/SKILL.md |
| syrx-validation | Review / Execution | review | .github/skills/review/syrx-validation/SKILL.md |
| tailwind-ci-integration | Execution / Review | execution | .github/skills/execution/tailwind-ci-integration/SKILL.md |
| tailwind-component-design | Execution / Review | execution | .github/skills/execution/tailwind-component-design/SKILL.md |
| tailwind-design-system | Planning / Execution | planning | .github/skills/planning/tailwind-design-system/SKILL.md |
| tailwind-quality-gate | Review / Execution | test | .github/skills/test/tailwind-quality-gate/SKILL.md |
| tailwind-setup | Execution / Review | standards | .github/skills/standards/tailwind-setup/SKILL.md |
| tailwind-source-curation | Planning / Execution | standards | .github/skills/standards/tailwind-source-curation/SKILL.md |
| task-execution | Execution / Planning | execution | .github/skills/execution/task-execution/SKILL.md |
| task-research | Planning / Review | planning | .github/skills/planning/task-research/SKILL.md |
| taxonomy-tag-registry | Review / Planning | standards | .github/skills/standards/taxonomy-tag-registry/SKILL.md |
| test-design-review | Review / Planning | test | .github/skills/test/test-design-review/SKILL.md |
| test-driven-development | Execution / Planning | test | .github/skills/test/test-driven-development/SKILL.md |
| test-orchestration | Execution / Review | test | .github/skills/test/test-orchestration/SKILL.md |
| usability-test-scripts | Planning / Execution | planning | .github/skills/planning/usability-test-scripts/SKILL.md |
| web-ux-accessibility | Execution / Review | execution | .github/skills/execution/web-ux-accessibility/SKILL.md |
| web-ux-account-identity-flows | Execution / Review | execution | .github/skills/execution/web-ux-account-identity-flows/SKILL.md |
| web-ux-content-clarity | Execution / Review | execution | .github/skills/execution/web-ux-content-clarity/SKILL.md |
| web-ux-data-dense-interfaces | Execution / Review | execution | .github/skills/execution/web-ux-data-dense-interfaces/SKILL.md |
| web-ux-experimentation-evidence | Execution / Review | execution | .github/skills/execution/web-ux-experimentation-evidence/SKILL.md |
| web-ux-feedback-status | Execution / Review | execution | .github/skills/execution/web-ux-feedback-status/SKILL.md |
| web-ux-forms-conversion | Execution / Review | execution | .github/skills/execution/web-ux-forms-conversion/SKILL.md |
| web-ux-information-architecture | Execution / Review | execution | .github/skills/execution/web-ux-information-architecture/SKILL.md |
| web-ux-localization | Execution / Review | execution | .github/skills/execution/web-ux-localization/SKILL.md |
| web-ux-motion-animation | Execution / Review | execution | .github/skills/execution/web-ux-motion-animation/SKILL.md |
| web-ux-notification-alerts | Execution / Review | execution | .github/skills/execution/web-ux-notification-alerts/SKILL.md |
| web-ux-offline-resilience | Execution / Review | execution | .github/skills/execution/web-ux-offline-resilience/SKILL.md |
| web-ux-onboarding-progressive-disclosure | Execution / Review | execution | .github/skills/execution/web-ux-onboarding-progressive-disclosure/SKILL.md |
| web-ux-performance | Execution / Review | execution | .github/skills/execution/web-ux-performance/SKILL.md |
| web-ux-privacy-consent | Execution / Review | execution | .github/skills/execution/web-ux-privacy-consent/SKILL.md |
| web-ux-quality-gate | Planning / Review | test | .github/skills/test/web-ux-quality-gate/SKILL.md |
| web-ux-responsive-design | Execution / Review | execution | .github/skills/execution/web-ux-responsive-design/SKILL.md |
| web-ux-supportability-self-service | Execution / Review | execution | .github/skills/execution/web-ux-supportability-self-service/SKILL.md |
| web-ux-telemetry-instrumentation | Execution / Review | execution | .github/skills/execution/web-ux-telemetry-instrumentation/SKILL.md |
| web-ux-trust-risk-signals | Execution / Review | execution | .github/skills/execution/web-ux-trust-risk-signals/SKILL.md |
| web-ux-usability | Execution / Review | execution | .github/skills/execution/web-ux-usability/SKILL.md |
| web-ux-visual-consistency | Execution / Review | execution | .github/skills/execution/web-ux-visual-consistency/SKILL.md |
| work-intake-governance | Planning / Execution | planning | .github/skills/planning/work-intake-governance/SKILL.md |
| write-mcp-servers | Execution / Review | execution | .github/skills/execution/write-mcp-servers/SKILL.md |
| write-technical-docs | Execution / Review | standards | .github/skills/standards/write-technical-docs/SKILL.md |
| writing-plans | Planning / Execution | planning | .github/skills/planning/writing-plans/SKILL.md |
| xunit-async-testing | Execution / Review | test | .github/skills/test/xunit-async-testing/SKILL.md |
| xunit-ci-observability | Execution / Review | test | .github/skills/test/xunit-ci-observability/SKILL.md |
| xunit-fixture-lifecycle | Execution / Review | test | .github/skills/test/xunit-fixture-lifecycle/SKILL.md |
| xunit-moq-collaboration | Execution / Review | test | .github/skills/test/xunit-moq-collaboration/SKILL.md |
| xunit-quality-gate | Review / Execution | test | .github/skills/test/xunit-quality-gate/SKILL.md |
| xunit-runner-platforms | Execution / Review | test | .github/skills/test/xunit-runner-platforms/SKILL.md |
| xunit-source-curation | Planning / Execution | test | .github/skills/test/xunit-source-curation/SKILL.md |
| xunit-test-design | Execution / Planning | test | .github/skills/test/xunit-test-design/SKILL.md |
| xunit-theory-data-stability | Execution / Review | test | .github/skills/test/xunit-theory-data-stability/SKILL.md |
| xunit-traits-and-selection | Execution / Review | test | .github/skills/test/xunit-traits-and-selection/SKILL.md |
| xunit-v2-v3-migration | Planning / Execution | test | .github/skills/test/xunit-v2-v3-migration/SKILL.md |

## Appendix C - Non-Standard Current Paths

| Skill Name | Current Catalog Path | Note |
|---|---|---|
| curate-copilot-instructions | ./../skills/curate-copilot-instructions/references/README.md | Catalog currently references a non-standard file path; migration will normalize to SKILL.md target path. |

## Appendix D - Family Assignment Coverage and Lane Distribution

| Family | Skill Count | Primary Planning | Primary Execution | Primary Review |
|---|---:|---:|---:|---:|
| delivery | 11 | 6 | 2 | 3 |
| execution | 117 | 0 | 117 | 0 |
| governance | 14 | 1 | 0 | 13 |
| orchestration | 15 | 15 | 0 | 0 |
| planning | 24 | 24 | 0 | 0 |
| review | 6 | 0 | 0 | 6 |
| security | 7 | 0 | 3 | 4 |
| standards | 20 | 6 | 13 | 1 |
| synchronization | 5 | 0 | 3 | 2 |
| test | 42 | 4 | 21 | 17 |

## Appendix E - Technology Grouping Model (Secondary Discovery)

Technology grouping is metadata-driven and index-driven. It does not change physical storage paths.

| Technology Group | Purpose |
|---|---|
| dotnet-csharp | .NET and C# implementation, architecture, resilience, and language workflows. |
| web-frontend | Web UI engineering and UX quality workflows including shadcn, tailwind, jQuery, and Kendo surfaces. |
| mobile | Mobile-focused workflows for MAUI and Capacitor patterns. |
| sql-server | SQL Server operations, standards, security, automation, and diagnostics workflows. |
| mcp | Model Context Protocol server authoring, refinement, transport, and release workflows. |
| testing-quality | Testing strategy, test execution, quality gates, benchmark evidence, and validation workflows. |
| governance-customization | Governance, catalog integrity, lifecycle control, and customization audit workflows. |
| delivery-planning | Planning, forecasting, scope control, delivery orchestration, and status workflows. |
| security | Security research, hardening, and dependency risk workflows. |
| cross-cutting | Reusable platform-agnostic workflows such as documentation, librarian curation, and composition patterns. |

## Approval Gate

Approve this plan to begin execution design-to-implementation handoff with lifecycle-primary storage and technology-secondary discovery.
