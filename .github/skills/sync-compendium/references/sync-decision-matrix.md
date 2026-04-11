# Sync Decision Matrix

Use this matrix to classify each artifact action from a sync dry-run plan.

## Preconditions

1. A dry-run plan exists for the requested source version.
2. Every artifact in scope has a source record.
3. Approver has reviewed conflict items.

## Decision Matrix

| Condition | Default Action | Approval Required | Notes |
|---|---|---|---|
| `source=local` | Preserve | No | Local artifacts are out of overwrite scope. |
| `source!=sextondjc/agentic` | Preserve | No | Treat as third-party or target-owned until explicitly reclassified. |
| `ownershipMode=local` | Preserve | No | Never overwritten by sync. |
| `ownershipMode=managed` and no local drift and source changed | Update candidate | Yes | Safe replace candidate once approved. |
| `ownershipMode=managed` and local drift detected | Manual review | Yes | Must inspect and resolve before update. |
| `ownershipMode=extended` and source changed | Manual merge | Yes | Update managed sections only; preserve local extension blocks. |
| Managed artifact missing from source manifest | Hold | Yes | Approver chooses keep, archive, or remove. |
| New artifact in source manifest | Add candidate | Yes | Require explicit acceptance. |

## Local Drift Detection

Mark as local drift when `contentHash != lastImportedHash` for a `managed` artifact.

## Approval Workflow

1. Generate dry-run plan.
2. Group actions by `update`, `add`, `manual-review`, `hold`, and `preserve`.
3. Require explicit approver decision per non-noop action.
4. Apply only approved items.
5. Write lock file and sync report.

## Required Sync Report Fields

- `planId`
- `sourceRepo`
- `sourceVersion`
- `sourceCommit`
- `approvedBy`
- `approvedAt`
- `appliedCount`
- `preservedCount`
- `manualReviewCount`
- `heldCount`

## Rejection Conditions

- Missing source metadata on any artifact in scope.
- Missing approval evidence for planned apply actions.
- Source manifest and requested version mismatch.
- Attempt to overwrite `local` ownership artifacts.
