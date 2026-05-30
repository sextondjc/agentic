# Governance Remediation Plan

## Plan Metadata

| Field | Value |
|---|---|
| Plan ID | GOV-REM-2026-05-28-01 |
| Created Date | 2026-05-28 |
| Primary Lane | Planning |
| Current Phase | Complete |
| Overall Status | Done |
| Review Cadence | Weekly until all critical/high items are closed |
| Source Audit Artifacts | `.docs/governance/audit-executor-report.md`, `.docs/changes/governance/type-audits/audit-customization-types.md`, `.docs/changes/governance/type-audits/execute-customization-audit.md`, `.docs/changes/governance/audits/governance-executive-audit.md` |

## Status Legend

| Status | Meaning |
|---|---|
| Not Started | Work has not begun |
| In Progress | Work started and actively being executed |
| Blocked | Work cannot continue due to dependency or decision gate |
| In Review | Implementation completed; awaiting validation/review |
| Done | Validation criteria passed and review accepted |

## Step-by-Step Remediation Plan

| Step | Workstream | Progress Status | Progress % | Description | Rationale | Validation Criteria | Evidence Artifact | Owner | Target Date |
|---:|---|---|---:|---|---|---|---|---|---|
| 1 | Catalog Integrity Script Alignment | Done | 100 | Update catalog lookups in `.github/scripts/powershell/test-catalog-integrity.ps1` to the active `.github/catalogs/*-discovery-index.md` files for agents, instructions, prompts, and skills. | Current automation points to legacy paths and causes deterministic audit failures across all types. | 1) Script exits cleanly for all four asset types. 2) No legacy-path false negatives. | `.docs/changes/governance/type-audits/audit-customization-types.md` | Governance tooling owner | 2026-06-02 |
| 2 | Portability Rule Policy Reconciliation | Done | 100 | Reconcile `.github/scripts/powershell/test-no-docs-dependency.ps1` scope with repository conventions that intentionally reference `.docs` from `.github`. | Existing rule reports high-volume violations that conflict with current repository operating model. | 1) Rule scope aligned with intended source checks. 2) Violation count baseline normalized. | `.docs/changes/governance/audits/governance-executive-audit.md` | Governance owner | 2026-06-04 |
| 3 | Source Catalog Freshness Recovery | Done | 100 | Refresh stale entries in sync source catalogs and update Last Evaluated dates and statuses. | Stale references weaken trust in guidance and lower governance health confidence. | 1) `test-source-catalog-freshness.ps1 -ThresholdDays 30` passes. | `.docs/changes/governance/type-audits/skills-audit.md` | Sync skill owners | 2026-06-05 |
| 4 | Naming Policy Exception Decision | Done | 100 | Decide whether `xunit-v2-v3-migration` receives a naming exception or is renamed to match current regex policy. | One unresolved naming violation remained open; explicit decision prevents recurring drift. | 1) Naming decision encoded in validation behavior. 2) Naming check passes. | `.docs/changes/governance/type-audits/skills-audit.md` | xUnit skill owner | 2026-06-06 |
| 5 | Full Governance Re-Validation | Done | 100 | Re-run governance evidence collection and regenerate affected type/aggregate reports. | Remediation is incomplete until post-change evidence confirms issue closure. | 1) Prior blocking findings closed. 2) Executive artifacts regenerated with current date. | `.docs/governance/audit-executor-report.md` | Review owner | 2026-06-07 |
| 6 | Review Disposition and Sign-off | Done | 100 | Conduct formal review of remediation evidence and record disposition with follow-up actions. | Plan completion requires explicit, traceable review decision. | 1) Review disposition artifact present. 2) Approver statuses recorded. | `.docs/changes/governance/audits/remediation-review-2026-05-28.md` | Engineering owner + Delivery/Product owner | 2026-06-08 |

## Review Checklist

| Check | Required | Pass Condition | Status |
|---|---|---|---|
| Progress status field present for each step | Yes | Each step has a valid status from the status legend | Done |
| Validation criteria defined for each step | Yes | Each step has explicit, testable criteria | Done |
| Description and rationale present for each step | Yes | No step has empty description/rationale | Done |
| Evidence artifact path assigned | Yes | Each step has a target evidence artifact | Done |
| Owner and target date assigned | Yes | Each step has accountable owner and due date | Done |

## Session Handoff Notes

- This file is intentionally stored under `.docs/plans/goveranance/remediation/` to persist across sessions.
- Scope closure validated on 2026-05-28 and marked complete.
