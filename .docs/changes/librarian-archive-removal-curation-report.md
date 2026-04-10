# Librarian Curation Report: Archive Removal

## Execution Traceability

| Field | Value |
|---|---|
| Plan ID | PLAN-LIB-ARCHIVE-REMOVAL-01 |
| Primary Lane | Planning -> Execution -> Review |
| Scope | Documentation corpus curation with explicit `.archive` removal request |
| User Approval | Explicit: "We no longer need the `.archive` folder. Get rid of it. We have source control." |
| Deviation Log | No scope deviations |

## Critical-Thinking Decision Check

| Assumption | Trade-off | Decision |
|---|---|---|
| `.archive` is no longer required as a retention surface | Deleting `.archive` removes historical snapshots and may leave legacy archive references in active docs | Proceed with deletion because user explicitly approved removal and source control is the retained history mechanism |

## Naming Violations Grid

| Path | Type | Violation | Suggested Name |
|---|---|---|---|
| `.archive/comprehensive-workspace-health-audit-original.md` | File | Redundant qualifier (`original`) and duplicated audit variants | `workspace-health-audit.md` |
| `.archive/comprehensive-workspace-health-audit-r2.md` | File | Revision suffix in filename (`r2`) | `workspace-health-audit.md` |
| `.archive/comprehensive-workspace-health-audit-v1.md` | File | Revision suffix in filename (`v1`) | `workspace-health-audit.md` |
| `.archive/governance-audit-r2.md` | File | Revision suffix in filename (`r2`) | `governance-audit.md` |
| `.archive/governance-audit-v1.md` | File | Revision suffix in filename (`v1`) | `governance-audit.md` |
| `.archive/governance-audit-v2.md` | File | Revision suffix in filename (`v2`) | `governance-audit.md` |
| `.archive/prune/.docs/plans/20260403-r3-rec005-advisory-remediation-plan.md` | File | Date prefix prohibited by librarian naming rules | `r3-rec005-advisory-remediation-plan.md` |
| `.archive/prune/.docs/plans/20260407-workspace-recreation-prompts.md` | File | Date prefix prohibited by librarian naming rules | `workspace-recreation-prompts.md` |

## Structural Recommendations Grid

| Current Path | Suggested Path | Reason |
|---|---|---|
| `.archive/` | Remove path (approved) | Workspace now uses source control for historical retention; archive mirror is no longer needed |
| `.archive/condense/.docs/**` | None (remove with `.archive`) | Historical mirror content duplicates existing documentation lineage |
| `.archive/prune/.docs/**` | None (remove with `.archive`) | Archived planning/change records are now recoverable from VCS history |

## Curation Candidates Grid

| Path | Category | Confidence | Suggested Action | Reason |
|---|---|---|---|---|
| `.archive/` | Redundant | High | Remove Candidate (Approved) | Entire folder is designated unnecessary by user and superseded by source control history |
| `.archive/condense/.docs/**` | Duplicate | High | Remove Candidate | Snapshot mirror of previously condensed docs |
| `.archive/prune/.docs/**` | Redundant | High | Remove Candidate | Pruned artifacts retained elsewhere in git history |
| `.docs/**` references to `.archive/**` | Misplaced | Medium | Keep + follow-up update | References become stale after deletion and should be rewritten or removed in a separate pass |

## Index Status Grid

| Root | Index Action | Status |
|---|---|---|
| `.docs/` | Refreshed | Pending execution in this run |

## Confirmation Gate

No files will be moved, renamed, or deleted without your approval.
