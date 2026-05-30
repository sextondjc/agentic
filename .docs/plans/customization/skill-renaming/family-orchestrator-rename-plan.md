# Skill Family Orchestrator Rename Plan

## Plan Metadata

| Field | Value |
|---|---|
| Plan ID | PLAN-SKILL-ORCH-RENAME-001 |
| Request Date | 2026-05-28 |
| Primary Lane | Planning |
| Secondary Lane | Execution, Review |
| Determinism Status | Default (no bounded exploration) |
| Current State | Executed - Pending User Review |
| Originating Request | Rename skill folders/files from orchestrate-<family> to <family>-orchestrator across the workspace |

## Deterministic Intake Schema

| Field | Value |
|---|---|
| Objective | Define an approval-gated, step-by-step execution plan to rename skill folder and SKILL.md naming patterns from orchestrate-<family> to <family>-orchestrator without silent scope drift. |
| In Scope | Skill folder renames under .github/skills; references in catalogs/docs/instructions; link/path integrity checks; final rename inventory evidence. |
| Out of Scope | Behavior changes inside skill content unrelated to naming; non-skill asset renames unless required only as a path-reference fix; release/promotion execution. |
| Required Outputs | (1) Approved execution checklist, (2) rename map, (3) updated references, (4) validation report, (5) review-ready diff summary. |
| Primary Lane | Planning |
| Owner | Orchestrator intake + planning specialist |
| Handoff Target | Execution specialist for rename implementation, then review specialist for quality gate |
| Candidate Capabilities | writing-plans, task-execution, audit-skill, acceptance-governance |
| Candidate Skills | writing-plans, task-execution, audit-skill |
| Selected Skill or Specialist | writing-plans (this artifact), then task-execution (after approval), then acceptance-governance or audit-skill for review |
| Rejected Candidates with Reason Codes | route-customization (R3: does not own rename execution checklist depth), refine-ideas (R1: planning style mismatch), release-readiness (R2: promotion governance not requested in this step) |

## Composition Gate

| Required Output | Owning Phase | Owner |
|---|---|---|
| Rename map and scoped inventory | Planning | Planning specialist |
| File and folder renames + reference updates | Execution | Execution specialist |
| Validation and defect findings | Review | Review specialist |

## Preconditions

| ID | Requirement | Status | Validation Check |
|---|---|---|---|
| PRE-01 | Confirm canonical rename rule is exactly orchestrate-<family> -> <family>-orchestrator | Approved | User approved execution on 2026-05-28 |
| PRE-02 | Confirm whether legacy aliases/symlinks are prohibited | Approved | Legacy aliases not created; canonical names only |
| PRE-03 | Confirm whether typo folders (for example goveranance) are excluded from this scope | Approved | Typo cleanup excluded from scope; no typo path changes applied |

## Asset Rename Inventory

| Asset ID | Current Asset (Source) | Target Asset (Renamed) | Status | Validation Check |
|---|---|---|---|---|
| ASSET-01 | .github/skills/orchestrate-benchmark | .github/skills/benchmark-orchestrator | Completed | Verified in filesystem-check.txt |
| ASSET-02 | .github/skills/orchestrate-capacitor | .github/skills/capacitor-orchestrator | Completed | Verified in filesystem-check.txt |
| ASSET-03 | .github/skills/orchestrate-csharp | .github/skills/csharp-orchestrator | Completed | Verified in filesystem-check.txt |
| ASSET-04 | .github/skills/orchestrate-jquery | .github/skills/jquery-orchestrator | Completed | Verified in filesystem-check.txt |
| ASSET-05 | .github/skills/orchestrate-kendo | .github/skills/kendo-orchestrator | Completed | Verified in filesystem-check.txt |
| ASSET-06 | .github/skills/orchestrate-mcp-servers | .github/skills/mcp-servers-orchestrator | Completed | Verified in filesystem-check.txt |
| ASSET-07 | .github/skills/orchestrate-mobile | .github/skills/mobile-orchestrator | Completed | Verified in filesystem-check.txt |
| ASSET-08 | .github/skills/orchestrate-shadcn | .github/skills/shadcn-orchestrator | Completed | Verified in filesystem-check.txt |
| ASSET-09 | .github/skills/orchestrate-sql-server | .github/skills/sql-server-orchestrator | Completed | Verified in filesystem-check.txt |
| ASSET-10 | .github/skills/orchestrate-sveltekit | .github/skills/sveltekit-orchestrator | Completed | Verified in filesystem-check.txt |
| ASSET-11 | .github/skills/orchestrate-tailwind | .github/skills/tailwind-orchestrator | Completed | Verified in filesystem-check.txt |
| ASSET-12 | .github/skills/orchestrate-xunit | .github/skills/xunit-orchestrator | Completed | Verified in filesystem-check.txt |

This inventory is the authoritative rename scope for this plan. Any additional assets discovered later require explicit scope amendment before execution.

## Rename Strategy

1. Build a complete candidate inventory of paths matching orchestrate-* under .github/skills and all references in markdown catalogs and instruction files.
2. Create a deterministic rename map with one row per family and target path.
3. Apply folder renames first, then update internal and external references.
4. Run validation gates in sequence: path existence, broken link scan, text reference residual scan, and optional policy lint checks.
5. Produce final evidence table with status for each family rename.

## Execution Workstream Plan

| Step ID | Workstream | Action | Owner | Status | Validation Check | Evidence Artifact |
|---|---|---|---|---|---|---|
| WS-01 | Discovery | Enumerate current skill folders named orchestrate-* and capture baseline list | Execution specialist | Completed | Inventory and source-target mapping captured | rename-inventory-before.md |
| WS-02 | Mapping | Build source->target rename table for each family | Execution specialist | Completed | One-to-one mapping confirmed for all 12 assets | rename-map.md |
| WS-03 | Rename | Rename each folder to <family>-orchestrator | Execution specialist | Completed | Old paths absent and new paths present | filesystem-check.txt |
| WS-04 | Reference Updates | Update catalogs, docs, and instructions that reference old paths/names | Execution specialist | Completed | Residual old-name references restricted to historical records and plan traceability | reference-scan-after.txt |
| WS-05 | Integrity Check | Verify all SKILL.md file paths remain reachable and discoverable by indexes | Review specialist | Completed | All 12 renamed skills exist and are indexed | link-integrity-report.md |
| WS-06 | Governance Check | Confirm lane mapping/catalog rows still valid after rename | Review specialist | Completed | No blocking governance defects; low-severity historical-reference advisories only | governance-findings.md |
| WS-07 | Handoff Closeout | Publish concise change summary and approval-ready report | Review specialist | Completed | Evidence bundle complete and traceable to plan ID | rename-closeout.md |

## Validation Gates

| Gate ID | Gate | Pass Criteria | Status |
|---|---|---|---|
| VAL-01 | Inventory Completeness | Every orchestrate-* skill has exactly one target <family>-orchestrator entry | Pass |
| VAL-02 | Rename Correctness | All renamed directories follow <family>-orchestrator format and resolve on disk | Pass |
| VAL-03 | Reference Hygiene | No unintended leftover references to old names in active catalogs/instructions/docs | Pass with Advisories |
| VAL-04 | Catalog Integrity | skills-discovery-index and related discovery surfaces align with renamed assets | Pass |
| VAL-05 | Review Readiness | Evidence artifacts exist and can be consumed by review specialist | Pass |

## Risks and Controls

| Risk ID | Risk | Control |
|---|---|---|
| RSK-01 | Missed references causing broken discoverability | Run pre/post scans and compare deltas |
| RSK-02 | Name collisions when family names normalize similarly | Validate one-to-one mapping before any rename |
| RSK-03 | Hidden references in archived docs | Restrict must-fix scope to active governance and discovery artifacts; log optional follow-up list |

## Approval Gate

Execution must not begin until explicit approval is recorded below.

| Approval Item | Owner | Status | Timestamp |
|---|---|---|---|
| Approve PLAN-SKILL-ORCH-RENAME-001 for execution | Requesting user | Approved | 2026-05-28 |

## Next Handoff (Post-Approval)

1. Route to execution specialist with scope locked to WS-01 through WS-07.
2. Require a single consolidated execution pass where safe, with validation artifacts produced in the same change set.
3. Route completed output to review specialist for severity-tagged findings and disposition.
