# Governance Current State

## Purpose

This file is the single, rolling governance digest for current workspace health.

Use this file for routine governance updates instead of creating daily full audit reports.

## Update Cadence

| Trigger | Action |
|---|---|
| Routine governance run | Update this file in place |
| High severity finding | Update this file and create an exception artifact in `.docs/changes/governance/audits/` |
| Policy or architecture change | Update this file and create an ADR or policy change artifact |
| Milestone or month-end checkpoint | Create one baseline snapshot artifact in `.docs/changes/governance/audits/` |

## Current Summary

| Field | Value |
|---|---|
| Last Updated | 2026-04-07 |
| Current Disposition | Passed |
| Open High Findings | 0 |
| Open Medium Findings | 0 |
| Open Low Findings | 0 |
| Drift Risk | Low |
| Next Baseline Snapshot Due | 2026-04-30 |

## Active Risks and Exceptions

| ID | Severity | Status | Owner | Due Date | Source |
|---|---|---|---|---|---|
| None | None | Closed | n/a | n/a | n/a |

## Salient Findings Snapshot

| Area | Status | Detail | Evidence |
|---|---|---|---|
| Lane Coverage | Pass | Planning, Execution, Review lane coverage complete | [governance-audit.md](./../changes/governance/audits/governance-audit.md) |
| Catalog Integrity | Pass | No missing or stale catalog rows detected | [governance-audit.md](./../changes/governance/audits/governance-audit.md) |
| Hub Freshness | Pass | Preferred agents and skills synchronized | [governance-audit.md](./../changes/governance/audits/governance-audit.md) |
| Link Health | Advisory | Broken local links detected and queued for remediation | [governance-audit.md](./../changes/governance/audits/governance-audit.md) |

## Baseline Snapshot Log

Only month-end or milestone snapshots should be added here.

| Snapshot Date | Scope | Outcome | Artifact |
|---|---|---|---|
| 2026-04-07 | all | Passed | [governance-audit.md](./../changes/governance/audits/governance-audit.md) |

## Legacy Audit Artifact Index

These artifacts predate retention-policy adoption and remain valid historical evidence.

| Date | Artifact | Classification |
|---|---|---|
| 2026-04-07 | [comprehensive-workspace-health-audit.md](./../changes/governance/audits/comprehensive-workspace-health-audit.md) | Legacy comprehensive snapshot (consolidated target) |
| 2026-04-07 | [comprehensive-workspace-health-audit-original.md](./../../.archive/comprehensive-workspace-health-audit-original.md) | Legacy transitional snapshot (archived) |
| 2026-04-03 | [governance-audit-r2.md](./../../.archive/governance-audit-r2.md) | Legacy daily rerun (archived) |
| 2026-04-03 | [governance-audit.md](./../../.archive/governance-audit.md) | Legacy daily run (archived) |
| 2026-04-03 | [comprehensive-workspace-health-audit-r2.md](./../../.archive/comprehensive-workspace-health-audit-r2.md) | Legacy comprehensive rerun (archived) |
| 2026-04-03 | [comprehensive-workspace-health-audit.md](./../../.archive/comprehensive-workspace-health-audit.md) | Legacy comprehensive run (archived) |
| 2026-04-03 | [governance-one-pager.md](./../changes/governance/audits/governance-one-pager.md) | Legacy summary |
| 2026-04-02 | [governance-audit-v1.md](./../../.archive/governance-audit-v1.md) | Legacy daily run (archived) |

## Decisions

| Decision ID | Date | Decision | Rationale | Status |
|---|---|---|---|---|
| DEC-01 | 2026-04-07 | Adopt rolling governance digest and exception-only detailed reporting | Preserve salient governance detail while reducing daily document churn | Active |

## Next Actions

| Action ID | Action | Owner | Target Date | Status |
|---|---|---|---|---|
| ACT-01 | Remediate broken local links detected by governance sweep | Workspace maintainers | 2026-04-14 | Open |
| ACT-02 | Produce month-end governance baseline snapshot | Workspace maintainers | 2026-04-30 | Planned |
