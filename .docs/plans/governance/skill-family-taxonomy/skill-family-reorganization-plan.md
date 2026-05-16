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

## Guidance and Patterns

- GUD-001: Keep .github/skills as canonical root and place family folders beneath it.
- GUD-002: Use one primary family plus optional metadata tags for cross-family relevance.
- GUD-003: Keep global discovery index as canonical; add family discovery indexes for targeted entry points.
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
| oldPath | string | Yes | Existing flat skill path |
| newPath | string | Yes | Family-qualified target path |
| entryPointGroup | string | No | Family entry-point grouping key |
| migrationWave | string | Yes | Planned rollout wave identifier |

### Discovery Index Contract Additions

| Field | Type | Required | Description |
|---|---|---|---|
| Family | string | Yes | Primary family value for each skill row |
| Skill File | markdown link | Yes | Family-qualified path to SKILL.md |
| Entry Point | markdown link | No | Family entry-point skill link when applicable |

## Acceptance Criteria

- AC-001: A complete family classification table exists for all current skills with no unassigned skill.
- AC-002: Target directory model is documented and validated against naming policy.
- AC-003: Discovery design includes both global and family entry surfaces.
- AC-004: Migration checklist includes catalogs, scripts, workflows, and documentation updates.
- AC-005: Validation plan includes preflight integrity, link integrity, and post-cutover route smoke tests.
- AC-006: Rollback procedure is documented with explicit owner and execution steps.
- AC-007: Plan artifact is stored in a durable path and includes status fields for cross-session continuation.

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

### Tasks
1. Specify directory structure as .github/skills/family/skill.
2. Define entry-point criteria: create family entry skill when family has six or more member skills.
3. Define entry-point template: routing intent, sub-skill map, and escalation rules.
4. Define global versus family index interaction.

### Deliverables
- Target path architecture specification.
- Family entry-point specification.
- Discovery surface design map.

### Exit Criteria
- AC-002 and AC-003 satisfied.

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
- Agent-facing routing documentation updates.

### Tasks
1. Update skill file links in global discovery index to family-qualified paths.
2. Add Family column or equivalent family metadata in index rows.
3. Create family-specific index files for targeted browsing.
4. Update references in governance and routing docs.

### Deliverables
- Updated global skills discovery index.
- Family index set.
- Updated routing references.

### Exit Criteria
- AC-003 and AC-004 satisfied for discovery surfaces.

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
3. Run route smoke tests for orchestrator and selected family entry points.
4. Record findings and dispositions in review artifact.

### Deliverables
- Validation evidence bundle.
- Review report with severity-tagged findings and dispositions.

### Exit Criteria
- AC-005 and AC-006 satisfied.
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

## Approval Gate

Approve this plan to begin execution design-to-implementation handoff.
