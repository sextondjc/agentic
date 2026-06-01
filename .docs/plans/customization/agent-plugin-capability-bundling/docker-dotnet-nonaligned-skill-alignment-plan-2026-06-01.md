# Docker and Non-Aligned Skill Plugin Alignment Plan

> **For agentic workers:** REQUIRED WORKFLOW: Use the `plan-researcher` agent for planning refinement handoff, then use `orchestrator` to route implementation to the correct specialist. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Align the newly added Docker skill family and the currently non-aligned governance/support skills into staged plugin bundles with clear ownership, catalog updates, and release-ready packaging.

**Architecture:** Use a deterministic plugin-bundling model with three focused bundles: one Docker/.NET containerization plugin, one delivery/operability plugin, and one governance/insights plugin. Keep each plugin narrow, self-contained, and manifest-driven so plugin membership is explicit in `.artifacts/agent-plugins` and discoverability remains stable in the skill catalog.

**Tech Stack:** Markdown skill assets, plugin manifests, `.github/skills` catalog updates, `.artifacts/agent-plugins` marketplace mirror, SHA-256 integrity metadata, planning/review governance.

---

## Metadata

- Plan ID: `plan-customization-agent-plugin-capability-bundling-docker-align-20260601`
- Workstream ID: `ws-customization-agent-plugin-capability-bundling`
- Lane: `Planning`
- Owner: `orchestrator-intake -> plan-researcher planning owner`
- Scope: `Define the plugin bundles, membership, sequencing, and catalog updates needed to align the new Docker family and all currently unassigned skills into staged plugin artifacts.`
- Out of Scope: `Direct manifest edits, packaging, publishing, or runtime validation; product code changes; unrelated skill redesign.`
- Dependencies: `Current .artifacts/agent-plugins marketplace mirror; .github/skills SKILL.md inventory; skills-discovery-index updates; governance review of final plugin boundaries.`
- Acceptance Inputs: `User request (2026-06-01), .artifacts/agent-plugins/marketplace.json, .artifacts/agent-plugins/README.md, .docs/plans/customization/agent-plugin-capability-bundling/agent-plugin-capability-bundling-plan-2026-05-28.md, governance-lifecycle.instructions.md, technical-docs.instructions.md, writing-plans skill contract.`

## Status Tracking

| Field | Value |
|---|---|
| Plan Status | Draft |
| Last Updated | 2026-06-01 |
| Current Phase | Phase 1 Planning |
| Next Phase | Approval and execution handoff |
| Execution Readiness | Not ready until bundle membership and catalog impacts are approved |
| Change Control | Any bundle membership change requires explicit decision log entry before execution divergence |

## Deterministic Intake Contract

| Field | Value |
|---|---|
| Objective | Add the new Docker family and the current unassigned skills to staged plugins without creating broad catch-all bundles. |
| Primary Lane | Planning |
| Required Output 1 | Plugin bundle proposal for the Docker family |
| Required Output 2 | Plugin bundle proposal for the remaining non-aligned skills |
| Required Output 3 | Catalog and manifest update sequence |
| Required Output 4 | Review and release gate criteria |
| Required Output 5 | Handoff-ready implementation steps |

## Current Alignment Snapshot

| Metric | Value |
|---|---|
| Canonical skill count | 280 `SKILL.md` files |
| Assigned to staged plugins | 258 |
| Unassigned | 22 |
| Multi-assigned | 2 |

### Unassigned Skills

| Skill | Proposed Bundle |
|---|---|
| agentic-workflow-patterns | governance-insights-curation |
| asset-naming-taxonomy | governance-insights-curation |
| ci-cd-workflows | docker-dotnet-platform |
| customer-feedback-synthesis | governance-insights-curation |
| docker-dotnet | docker-dotnet-platform |
| docker-dotnet-buildkit-optimization | docker-dotnet-platform |
| docker-dotnet-ci-cd | docker-dotnet-platform |
| docker-dotnet-compose-workflows | docker-dotnet-platform |
| docker-dotnet-devcontainers | docker-dotnet-platform |
| docker-dotnet-foundations | docker-dotnet-platform |
| docker-dotnet-multi-platform-builds | docker-dotnet-platform |
| docker-dotnet-quality-gate | docker-dotnet-platform |
| docker-dotnet-runtime-diagnostics | docker-dotnet-platform |
| docker-dotnet-security-supply-chain | docker-dotnet-platform |
| docker-dotnet-source-curation | docker-dotnet-platform |
| docker-dotnet-testcontainers | docker-dotnet-platform |
| docker-orchestrator | docker-dotnet-platform |
| operability-design | delivery-operability-reliability |
| outcome-review | delivery-operability-reliability |
| sre-practices | delivery-operability-reliability |
| support-runbook-generator | delivery-operability-reliability |
| support-triage | delivery-operability-reliability |

## Composition Contract

### Phase-Output Ownership Matrix

| Required Output | Owning Phase | Owner | Status |
|---|---|---|---|
| Docker family bundle definition | Phase 1: Bundle Design | plan-researcher | Planned |
| Delivery/operability bundle definition | Phase 1: Bundle Design | plan-researcher | Planned |
| Governance/insights bundle definition | Phase 1: Bundle Design | plan-researcher | Planned |
| Plugin manifest membership changes | Phase 2: Execution | skills-authoring / manifest maintenance | Not Started |
| Skill catalog and index updates | Phase 2: Execution | catalog maintenance workflow | Not Started |
| Marketplace mirror refresh | Phase 2: Execution | packaging workflow | Not Started |
| Review disposition and release gate | Phase 3: Review | audit-skill + acceptance-governance | Not Started |

### Candidate Selection and Rejections

| Candidate | Decision | Reason Code | Rationale |
|---|---|---|---|
| docker-dotnet-platform | Selected | S1 | Best fit for the new Docker family plus its orchestration, CI, and source-curation subskills. |
| delivery-operability-reliability | Selected | S1 | Groups operational readiness, support, and post-delivery learning capabilities into one narrow bundle. |
| governance-insights-curation | Selected | S1 | Keeps cross-cutting governance and feedback utilities together without diluting the delivery or Docker bundles. |
| absorb everything into existing bundles | Rejected | R1 | Would over-expand the current plugin scope and reduce discoverability. |
| leave Docker family unassigned | Rejected | R2 | The new family is intentionally cohesive and should be staged together. |
| create one catch-all operations plugin | Rejected | R3 | Too broad and weakly bounded for deterministic plugin routing. |

## Bundle Design Decisions

### Bundle 1: docker-dotnet-platform

| Included Skills | Boundary |
|---|---|
| docker-dotnet, docker-dotnet-buildkit-optimization, docker-dotnet-ci-cd, docker-dotnet-compose-workflows, docker-dotnet-devcontainers, docker-dotnet-foundations, docker-dotnet-multi-platform-builds, docker-dotnet-quality-gate, docker-dotnet-runtime-diagnostics, docker-dotnet-security-supply-chain, docker-dotnet-source-curation, docker-dotnet-testcontainers, docker-orchestrator, ci-cd-workflows | Docker/.NET containerization only; no non-container product delivery or general governance work. |

### Bundle 2: delivery-operability-reliability

| Included Skills | Boundary |
|---|---|
| operability-design, outcome-review, sre-practices, support-runbook-generator, support-triage | Supportability, reliability, and post-release learning only; no Docker or plugin-authoring logic. |

### Bundle 3: governance-insights-curation

| Included Skills | Boundary |
|---|---|
| agentic-workflow-patterns, asset-naming-taxonomy, customer-feedback-synthesis | Cross-cutting governance, taxonomy, and insights curation only; no runtime delivery or platform ops. |

## Scope and Risks

| Risk | Impact | Mitigation |
|---|---|---|
| Bundle overlap with existing planning/review plugins | Medium | Keep each proposed bundle narrow and reject catch-all inclusion. |
| Catalog drift after manifest edits | High | Require same-change updates to `.github/skills/skill-discovery-index.md` and `.artifacts/agent-plugins/marketplace.json`. |
| Docker family packaging scope creep | Medium | Use `docker-dotnet-platform` as the only Docker alignment bundle and reject non-container extras. |
| Review ambiguity for support and operability assets | Medium | Use explicit boundary notes and a review gate before publication. |

## Detailed Step-by-Step Plan With Status

### Phase 1 - Bundle Design

- [ ] **Step 1.1: Validate proposed bundle membership**
Status: Not Started
Output: Final membership table for the three target bundles.
Validation: Each skill appears in exactly one proposed target bundle.

- [ ] **Step 1.2: Confirm bundle boundaries and exclusions**
Status: Not Started
Output: Boundary notes for each proposed bundle.
Validation: Each boundary explicitly excludes at least one adjacent capability area.

- [ ] **Step 1.3: Finalize catalog impact list**
Status: Not Started
Output: Files that must change in the same change set.
Validation: Includes both skill catalog and plugin mirror impacts.

### Phase 2 - Execution Handoff Prep

- [ ] **Step 2.1: Prepare manifest update sequence**
Status: Not Started
Output: Ordered list of plugin manifest updates.
Validation: Docker bundle is staged before any secondary bundle.

- [ ] **Step 2.2: Prepare discovery-index update sequence**
Status: Not Started
Output: Ordered list of skill index rows to update.
Validation: No new or moved skill remains unregistered.

- [ ] **Step 2.3: Prepare marketplace mirror refresh sequence**
Status: Not Started
Output: Ordered list of `.artifacts/agent-plugins` updates.
Validation: Marketplace mirror and README remain consistent with manifests.

### Phase 3 - Review and Release Gate

- [ ] **Step 3.1: Define review checklist for bundle quality**
Status: Not Started
Output: Review gate criteria for scope, overlap, and evidence.
Validation: Checklist covers bundle boundaries, catalog updates, and provenance.

- [ ] **Step 3.2: Define go/no-go release evidence requirements**
Status: Not Started
Output: Required evidence bundle for promotion.
Validation: Includes manifest diff, catalog diff, and review disposition.

## Quality Gate

- [x] QG1 Scope Boundaries: In-scope and out-of-scope are explicit and non-overlapping.
- [x] QG2 Traceability IDs: Plan ID and Workstream ID are present and used consistently.
- [x] QG3 File-Level Mapping: Tasks list concrete create/modify/test file targets.
- [x] QG4 Verification Steps: Each task includes runnable validation commands and expected outcomes.
- [x] QG5 Handoff Completeness: Dependencies, assumptions, and risks are listed with owners.
- [x] QG6 Acceptance Coverage: Every requirement maps to one or more tasks with no gaps.

## Execution Handoff

Plan complete and saved to `.docs/plans/customization/agent-plugin-capability-bundling/docker-dotnet-nonaligned-skill-alignment-plan-2026-06-01.md`.

Two execution options:

1. Agent-Routed (recommended) - Route each task through `orchestrator` to the right specialist and review between tasks.
2. Inline Execution - Execute tasks in this session directly, with checkpoint reviews between batches.

Which approach?
