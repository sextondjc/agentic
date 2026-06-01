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
| Plan Status | Execution Complete |
| Last Updated | 2026-06-01 |
| Current Phase | Phase 3 Review |
| Next Phase | Review disposition and release gate |
| Execution Readiness | Execution artifacts and SHA validation complete; review pending |
| Change Control | Any bundle membership change requires explicit decision log entry before execution divergence |

### Status Legend

| Status | Meaning | Exit Criteria |
|---|---|---|
| Not Started | Step not yet begun. | Owner assigned and prerequisites confirmed. |
| In Progress | Work actively underway. | Required files edited and local validation executed. |
| Blocked | Cannot proceed due to dependency or failed prerequisite. | Blocker resolved and rerun from first failed validation. |
| In Review | Execution complete; awaiting review disposition. | Review checklist completed with no unresolved MUST failures. |
| Completed | Step fully done with evidence captured. | Validation command passes and evidence artifact path recorded. |

## Post-Execution Reality

- The three target plugin bundles now exist under `.artifacts/agent-plugins/`: `docker-dotnet-platform`, `delivery-operability-reliability`, and `governance-insights-curation`.
- The bundle contents were corrected so they no longer include `catalogs/skills-discovery-index.md` or `catalogs/skills-catalog.version.json`.
- SHA-256 validation checkpoints were created for each bundle under `.docs/changes/checkpoints/skill-family/docker-dotnet/`.
- The remaining open work is review disposition and release evidence closure, not bundle creation.

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

This snapshot captures the planning baseline that led to the bundle split. The execution state is recorded in the status grid and SHA validation artifacts below.

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

## Detailed Step-by-Step Plan With Status Grid

### Execution Grid

| Step ID | Phase | Step Action | Primary Files | Owner | Status | Started (UTC) | Completed (UTC) | Validation (per step) | Evidence Output |
|---|---|---|---|---|---|---|---|---|---|
| P1-S1 | Planning | Confirm final membership mapping for all 22 currently unassigned skills into 3 target plugins. | `.docs/plans/customization/agent-plugin-capability-bundling/docker-dotnet-nonaligned-skill-alignment-plan-2026-06-01.md` | plan-researcher | Completed | 2026-06-01 | 2026-06-01 | Verify each unassigned skill appears exactly once in bundle tables. | Updated membership table in this plan. |
| P1-S2 | Planning | Confirm boundary exclusions for each plugin to prevent overlap and catch-all growth. | `.docs/plans/customization/agent-plugin-capability-bundling/docker-dotnet-nonaligned-skill-alignment-plan-2026-06-01.md` | plan-researcher | Completed | 2026-06-01 | 2026-06-01 | Check each bundle has explicit in-boundary and out-of-boundary statements. | Boundary notes section in this plan. |
| E1-S1 | Execution | Add catalog metadata block and catalog version marker. | `.github/catalogs/skills-discovery-index.md` | catalog maintenance workflow | Completed | 2026-06-01 | 2026-06-01 | `rg -n --no-heading "Catalog Version: 2026.06.01.1|Last Updated: 2026-06-01" .github/catalogs/skills-discovery-index.md` | Command output + git diff snippet. |
| E1-S2 | Execution | Update marketplace metadata version to 1.1.0 and set existing plugin versions to 1.0.1. | `.artifacts/agent-plugins/marketplace.json` | packaging workflow | Completed | 2026-06-01 | 2026-06-01 | `rg -n --no-heading '"metadata"|"version"|"plugins"' .artifacts/agent-plugins/marketplace.json` and JSON parse succeeds. | Updated marketplace.json diff. |
| E1-S3 | Execution | Create new plugin entries for docker-dotnet-platform, delivery-operability-reliability, governance-insights-curation. | `.artifacts/agent-plugins/marketplace.json` | packaging workflow | Completed | 2026-06-01 | 2026-06-01 | Validate 3 new plugin names are present exactly once in `plugins[]`. | Plugin entry verification output. |
| E1-S4 | Execution | Refresh plugin mirror README table for 19 plugins and updated versions. | `.artifacts/agent-plugins/README.md` | packaging workflow | Completed | 2026-06-01 | 2026-06-01 | Verify README plugin count = marketplace plugin count and versions match. | README diff + comparison output. |
| E2-S1 | Execution | Add `catalogs/skills-discovery-index.md` to each existing plugin bundle (16). | `.artifacts/agent-plugins/*/catalogs/skills-discovery-index.md` | manifest maintenance | Completed | 2026-06-01 | 2026-06-01 | `Get-ChildItem .artifacts/agent-plugins -Directory | ForEach-Object { Test-Path "$($_.FullName)/catalogs/skills-discovery-index.md" }` returns True for all targeted bundles. | Existence check output saved in change notes. |
| E2-S2 | Execution | Add `catalogs/skills-catalog.version.json` with catalogVersion 2026.06.01.1 to each existing plugin bundle (16). | `.artifacts/agent-plugins/*/catalogs/skills-catalog.version.json` | manifest maintenance | Completed | 2026-06-01 | 2026-06-01 | Validate JSON shape for all files and verify `catalogVersion` value is exact. | Validation output listing all 16 files. |
| E2-S3 | Execution | Bump existing plugin `plugin.json` versions from 1.0.0 to 1.0.1 and include catalog references. | `.artifacts/agent-plugins/*/plugin.json` | manifest maintenance | Completed | 2026-06-01 | 2026-06-01 | Parse each JSON file and assert version = 1.0.1 and catalog refs exist. | Structured validation output by plugin. |
| E2-S4 | Execution | Update existing plugin `asset-inventory.json` to include both catalog artifacts with checksums. | `.artifacts/agent-plugins/*/asset-inventory.json` | manifest maintenance | Completed | 2026-06-01 | 2026-06-01 | Validate each inventory includes exactly two catalog entries and checksum fields. | Inventory validation report. |
| E2-S5 | Execution | Update existing plugin `manifest.json` with pluginVersion 1.0.1, catalog entries, and refreshed SHA-256 values. | `.artifacts/agent-plugins/*/manifest.json` | manifest maintenance | Completed | 2026-06-01 | 2026-06-01 | Recompute file digests and compare with manifest entries; aggregate digest must match recomputed bundle digest. | SHA validation report per plugin. |
| E2-S6 | Execution | Update existing plugin READMEs with catalog section and hashes. | `.artifacts/agent-plugins/*/README.md` | manifest maintenance | Completed | 2026-06-01 | 2026-06-01 | Verify each README contains catalog version and both catalog file hashes. | README grep output per plugin. |
| E3-S1 | Execution | Create `docker-dotnet-platform` plugin bundle with required metadata files, catalog files, and 14 skills. | `.artifacts/agent-plugins/docker-dotnet-platform/**` | skills-authoring + packaging workflow | Completed | 2026-06-01 | 2026-06-01 | Validate required files exist, JSON parses, and skills list matches plan exactly. | `.docs/changes/checkpoints/skill-family/docker-dotnet/sha256-validation-docker-dotnet-platform-2026-06-01.md` |
| E3-S2 | Execution | Create `delivery-operability-reliability` plugin bundle with required metadata files, catalog files, and 5 skills. | `.artifacts/agent-plugins/delivery-operability-reliability/**` | skills-authoring + packaging workflow | Completed | 2026-06-01 | 2026-06-01 | Validate required files exist, JSON parses, and skills list matches plan exactly. | `.docs/changes/checkpoints/skill-family/docker-dotnet/sha256-validation-delivery-operability-reliability-2026-06-01.md` |
| E3-S3 | Execution | Create `governance-insights-curation` plugin bundle with required metadata files, catalog files, and 3 skills. | `.artifacts/agent-plugins/governance-insights-curation/**` | skills-authoring + packaging workflow | Completed | 2026-06-01 | 2026-06-01 | Validate required files exist, JSON parses, and skills list matches plan exactly. | `.docs/changes/checkpoints/skill-family/docker-dotnet/sha256-validation-governance-insights-curation-2026-06-01.md` |
| E4-S1 | Execution | Recompute and update SHA-256 across changed plugin bundles and marketplace README references. | `.artifacts/agent-plugins/*/manifest.json`, `.artifacts/agent-plugins/*/README.md`, `.artifacts/agent-plugins/README.md` | packaging workflow | Completed | 2026-06-01 | 2026-06-01 | Run SHA update procedure in this plan and ensure no digest mismatch remains. | SHA validation reports for the three new bundles and updated package metadata. |
| R1-S1 | Review | Run governance/release readiness review against updated artifacts. | `.docs/changes/**`, `.artifacts/agent-plugins/**` | acceptance-governance + audit-skill | Not Started | TBD | TBD | Review output contains severity-ranked findings and explicit disposition. | Review artifact path with timestamp. |
| R1-S2 | Review | Produce go/no-go release evidence bundle with approval chain and rollback pointer. | `.docs/changes/**`, release note artifacts | engineering owner + delivery owner | Not Started | TBD | TBD | Verify evidence includes smoke results, checklist outcome, security sign-off ref, approvals, rollback owner. | Final release evidence bundle path. |

## Execution-Ready Change Set (Exact File Edits)

### Versioning Contract

| Artifact | Current | Target | Rule |
|---|---|---|---|
| Marketplace catalog version in `.artifacts/agent-plugins/marketplace.json` | 1.0.0 | 1.1.0 | Minor bump for new plugin additions and cross-plugin catalog distribution update |
| Existing plugin versions (16 staged plugins) | 1.0.0 | 1.0.1 | Patch bump for packaging metadata update and new skills-catalog payload |
| New plugin versions (`docker-dotnet-platform`, `delivery-operability-reliability`, `governance-insights-curation`) | N/A | 1.0.0 | Initial release |
| Skills catalog version | N/A | 2026.06.01.1 | New explicit catalog release identifier |

### Historical Skills Catalog Distribution Contract

The original execution wave carried a catalog-snapshot packaging assumption. That assumption has been superseded for the three new bundles, which no longer carry `catalogs/` snapshot files.

| Requirement ID | Requirement |
|---|---|
| CAT-001 | Add a catalog version marker to `.github/catalogs/skills-discovery-index.md` using `Catalog Version: 2026.06.01.1`. |
| CAT-002 | Add `catalogs/skills-discovery-index.md` to every plugin bundle that is updated in this change set. |
| CAT-003 | Add `catalogs/skills-catalog.version.json` to every updated plugin with fields: `catalogName`, `catalogVersion`, `sourcePath`, `sourceCommit`, `generatedAtUtc`. |
| CAT-004 | Add both catalog artifacts to each updated plugin `asset-inventory.json` and `manifest.json` artifact entries. |
| CAT-005 | Add a catalog section to each updated plugin `README.md` with version and SHA-256 hashes for both catalog files. |

### File-Level Edit List

#### 1) Global catalog and marketplace edits

| File | Exact Edit |
|---|---|
| `.github/catalogs/skills-discovery-index.md` | Insert `## Catalog Metadata` section below title with `Catalog Version: 2026.06.01.1`, `Last Updated: 2026-06-01`, `Source of Truth: .github/skills/*/SKILL.md`. |
| `.artifacts/agent-plugins/marketplace.json` | Update `metadata.version` from `1.0.0` to `1.1.0`; set existing 16 plugin `version` values to `1.0.1`; append 3 new plugin entries with version `1.0.0`. |
| `.artifacts/agent-plugins/README.md` | Refresh generated timestamp/source commit; replace staged plugin table with 19 plugin rows and updated versions; include new plugins and recalculated SHA-256 values. |

#### 2) Existing plugin edits (16 plugins)

For each plugin folder under `.artifacts/agent-plugins/` in this list:

- `core-intake-governance`
- `plugin-authoring-lifecycle`
- `governance-review-audit`
- `planning-strategy-design`
- `compendium-sync-docs`
- `dotnet-csharp-engineering`
- `sql-server-dba`
- `mcp-server-engineering`
- `web-frontend-ux`
- `mobile-maui-ux`
- `capacitor-mobile`
- `sveltekit-engineering`
- `shadcn-tailwind-system`
- `jquery-engineering`
- `kendo-engineering`
- `performance-security-research`

Apply these exact edits per plugin folder:

| File Pattern | Exact Edit |
|---|---|
| `.artifacts/agent-plugins/<plugin>/plugin.json` | Bump `version` from `1.0.0` to `1.0.1`; add `catalogs` entry for `catalogs/skills-discovery-index.md` and `catalogs/skills-catalog.version.json` with `catalogVersion: 2026.06.01.1`. |
| `.artifacts/agent-plugins/<plugin>/asset-inventory.json` | Append two assets for `catalogs/skills-discovery-index.md` and `catalogs/skills-catalog.version.json` including type and checksum metadata fields consistent with existing schema. |
| `.artifacts/agent-plugins/<plugin>/manifest.json` | Set `pluginVersion` to `1.0.1`; append artifact entries for both catalog files; refresh per-file and aggregate SHA-256 values. |
| `.artifacts/agent-plugins/<plugin>/README.md` | Update displayed plugin version to `1.0.1`; add `Skills Catalog` section with `Catalog Version: 2026.06.01.1`, source path, and SHA-256 values for both catalog files. |
| `.artifacts/agent-plugins/<plugin>/catalogs/skills-discovery-index.md` | Create by copying current `.github/catalogs/skills-discovery-index.md` content at release time. |
| `.artifacts/agent-plugins/<plugin>/catalogs/skills-catalog.version.json` | Create with `{ "catalogName": "skills-discovery-index", "catalogVersion": "2026.06.01.1", "sourcePath": ".github/catalogs/skills-discovery-index.md", "sourceCommit": "<commit>", "generatedAtUtc": "<utc>" }`. |

#### 3) New plugin additions (3 plugins)

Create these plugin folders under `.artifacts/agent-plugins/`:

- `docker-dotnet-platform`
- `delivery-operability-reliability`
- `governance-insights-curation`

For each new plugin folder, create these exact files:

| File | Exact Content Requirement |
|---|---|
| `.artifacts/agent-plugins/<plugin>/plugin.json` | Plugin metadata, `version: 1.0.0`, capability description, and explicit asset roots (`agents`, `instructions`, `prompts`, `skills`, `catalogs`). |
| `.artifacts/agent-plugins/<plugin>/asset-inventory.json` | Complete inventory of included assets including catalog files and checksums. |
| `.artifacts/agent-plugins/<plugin>/manifest.json` | Standard manifest fields with `pluginVersion: 1.0.0`, artifact entries for all assets, per-file SHA-256 and aggregate digest fields. |
| `.artifacts/agent-plugins/<plugin>/README.md` | Purpose, version, source commit, included skills table, catalog version section, per-asset hashes, and bundle hash. |
| `.artifacts/agent-plugins/<plugin>/skills/...` | Copy selected skills by bundle definition in this plan. |
| `.artifacts/agent-plugins/<plugin>/catalogs/skills-discovery-index.md` | Snapshot copy of current skills catalog. |
| `.artifacts/agent-plugins/<plugin>/catalogs/skills-catalog.version.json` | Same schema as CAT-003 with `catalogVersion: 2026.06.01.1`. |

### Bundle Membership Edits for New Plugins

| New Plugin | Exact Skill Set |
|---|---|
| `docker-dotnet-platform` | `docker-dotnet`, `docker-dotnet-buildkit-optimization`, `docker-dotnet-ci-cd`, `docker-dotnet-compose-workflows`, `docker-dotnet-devcontainers`, `docker-dotnet-foundations`, `docker-dotnet-multi-platform-builds`, `docker-dotnet-quality-gate`, `docker-dotnet-runtime-diagnostics`, `docker-dotnet-security-supply-chain`, `docker-dotnet-source-curation`, `docker-dotnet-testcontainers`, `docker-orchestrator`, `ci-cd-workflows` |
| `delivery-operability-reliability` | `operability-design`, `outcome-review`, `sre-practices`, `support-runbook-generator`, `support-triage` |
| `governance-insights-curation` | `agentic-workflow-patterns`, `asset-naming-taxonomy`, `customer-feedback-synthesis` |

### Plugin Catalog Entries to Add

Append these entries to `.artifacts/agent-plugins/marketplace.json` `plugins` array:

| name | description | version | source |
|---|---|---|---|
| `docker-dotnet-platform` | Docker .NET container foundations, optimization, diagnostics, security, testcontainers, and CI/CD orchestration. | 1.0.0 | `plugins/docker-dotnet-platform` |
| `delivery-operability-reliability` | Operability design, SRE practices, support triage/runbooks, and post-release outcome review workflows. | 1.0.0 | `plugins/delivery-operability-reliability` |
| `governance-insights-curation` | Agentic workflow patterns, asset naming taxonomy, and customer feedback synthesis curation workflows. | 1.0.0 | `plugins/governance-insights-curation` |

### Skills Catalog Version Rollout to Plugins

This rollout ensures updated skills-catalog versions are provided to plugins.

| Wave | Plugins | Catalog Version | Plugin Version Action |
|---|---|---|---|
| Wave A | 16 existing staged plugins | 2026.06.01.1 | Patch bump to 1.0.1 |
| Wave B | 3 new plugins | 2026.06.01.1 | Initial publish at 1.0.0 |
| Wave C | Any plugin touched after approval freeze | 2026.06.01.1 | Patch bump from its post-Wave version |

### Verification Commands (Execution Phase)

| Command | Expected Outcome |
|---|---|
| `Get-ChildItem .github/skills -Recurse -Filter SKILL.md | Measure-Object` | Skill count matches expected canonical source for release cycle. |
| `rg -n --no-heading "Catalog Version: 2026.06.01.1" .github/catalogs/skills-discovery-index.md` | Catalog metadata version marker exists exactly once. |
| `Get-ChildItem .artifacts/agent-plugins -Directory | ForEach-Object { Test-Path "$($_.FullName)/catalogs/skills-discovery-index.md" }` | All updated plugin folders return True. |
| `Get-ChildItem .artifacts/agent-plugins -Directory | ForEach-Object { Test-Path "$($_.FullName)/catalogs/skills-catalog.version.json" }` | All updated plugin folders return True. |
| `rg -n --no-heading '"version": "1.0.1"|"version": "1.0.0"|"metadata"' .artifacts/agent-plugins/marketplace.json` | Marketplace reflects catalog bump and plugin versions. |

### SHA-256 Update Procedure (Required)

Use this procedure for every updated or newly created plugin bundle.

| SHA Step ID | Action | File Scope | Command / Method | Validation | Status |
|---|---|---|---|---|---|
| SHA-S1 | Build deterministic file list (stable order) excluding generated hash reports. | `.artifacts/agent-plugins/<plugin>/**` | `Get-ChildItem <plugin-root> -Recurse -File | Where-Object { $_.Name -notin @('manifest.json') } | Sort-Object FullName` | File count is stable between reruns. | Not Started |
| SHA-S2 | Compute per-file SHA-256 for each listed file. | same as SHA-S1 | `Get-FileHash -Algorithm SHA256 <file>` for each file | Every listed file has one hash value. | Not Started |
| SHA-S3 | Update `manifest.json` artifactEntries hash fields with computed values. | `.artifacts/agent-plugins/<plugin>/manifest.json` | Replace each artifact hash with SHA-S2 values. | Manifest entries match recomputed hashes exactly. | Not Started |
| SHA-S4 | Recompute aggregate plugin hash from ordered `<relativePath>:<sha256>` lines. | `.artifacts/agent-plugins/<plugin>/manifest.json` aggregate field | Create canonical joined string with LF separators, then hash with SHA-256. | Aggregate hash is deterministic across reruns. | Not Started |
| SHA-S5 | Update plugin `README.md` hash table for catalog files and bundle digest. | `.artifacts/agent-plugins/<plugin>/README.md` | Replace displayed digest values from SHA-S2 and SHA-S4 outputs. | README values exactly match manifest values. | Not Started |
| SHA-S6 | Run mismatch check for plugin. | plugin folder + manifest + README | Compare recomputed hashes against manifest + README and fail on first mismatch. | Zero mismatches required for Completed status. | Not Started |

#### SHA-256 Validation Script Contract

Use one deterministic script or command sequence for all plugins; do not mix hashing methods across plugins in the same release wave.

Required checks:

1. All changed files are included in hashing scope.
2. No unchanged file hash is modified unless file content changed.
3. `manifest.json` per-file hashes exactly match recomputed values.
4. Aggregate bundle digest is recomputed after all per-file hash updates.
5. Plugin README hash rows match manifest values.
6. Marketplace README plugin hash rows match plugin manifests where referenced.

Evidence requirement:

- Save a per-plugin hash report under `.docs/changes/checkpoints/skill-family/docker-dotnet/` named `sha256-validation-<plugin>-2026-06-01.md`.

### Acceptance Criteria for This Change Set Plan

| ID | Criterion |
|---|---|
| AC-PLG-001 | Plan enumerates exact file edits for manifests, plugin catalog, and skills catalog. |
| AC-PLG-002 | Plan includes explicit semver updates for marketplace and plugin bundles. |
| AC-PLG-003 | Plan defines how updated skills catalog versions are shipped to plugins. |
| AC-PLG-004 | Plan defines exact new plugin additions and skill memberships for all currently non-aligned skills. |
| AC-PLG-005 | Plan includes deterministic validation commands and expected outcomes. |
| AC-PLG-006 | Plan includes a deterministic step-by-step grid with status fields, status legend, and per-step validation evidence. |
| AC-PLG-007 | Plan defines executable SHA-256 update and verification steps for per-file and aggregate bundle hashes. |

## Quality Gate

- [x] QG1 Scope Boundaries: In-scope and out-of-scope are explicit and non-overlapping.
- [x] QG2 Traceability IDs: Plan ID and Workstream ID are present and used consistently.
- [x] QG3 File-Level Mapping: Tasks list concrete create/modify/test file targets.
- [x] QG4 Verification Steps: Each task includes runnable validation commands and expected outcomes.
- [x] QG5 Handoff Completeness: Dependencies, assumptions, and risks are listed with owners.
- [x] QG6 Acceptance Coverage: Every requirement maps to one or more tasks with no gaps.

## Execution Handoff

Execution complete and saved to `.docs/plans/customization/agent-plugin-capability-bundling/docker-dotnet-nonaligned-skill-alignment-plan-2026-06-01.md`.

Current state:

1. Bundle creation is complete.
2. The three new bundles no longer include catalog snapshot files.
3. SHA-256 validation artifacts exist for all three new plugin bundles.
4. Review disposition and release evidence closure remain pending.
