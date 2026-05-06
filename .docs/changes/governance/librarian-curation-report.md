# Librarian Curation Report

## Scope

- Root: `.docs/`
- Intent: cleanup recommendations only (no move/rename/delete execution)

## Naming Violations Grid

| Path | Type | Violation | Suggested Name |
|---|---|---|---|
| None | N/A | No naming violations detected in `.docs` during this pass. | N/A |

## Structural Recommendations Grid

| Current Path | Suggested Path | Reason |
|---|---|---|
| None | None | Existing hierarchy aligns to the workspace doc model and index coverage is present at root and child levels. |

## Curation Candidates Grid

| Path | Category | Confidence | Suggested Action | Reason |
|---|---|---|---|---|
| `.docs/changes/skill/reviews/*/history.md` | Duplicate | High | Keep | Repeated by design as per-skill history ledgers; expected corpus pattern. |
| `.docs/**/INDEX.md` | Duplicate | High | Keep | Repeated by design for navigable corpus indexing at each folder level. |
| `.docs/changes/skill/reviews/*/review.md` | Duplicate | High | Keep | Repeated by design as per-skill review records. |

## Link Integrity Status Grid

| Root | Link Check | Status |
|---|---|---|
| `.docs/` | `test-governance-link-graph.ps1` | Passed |

## Index Status Grid

| Root | Index Action | Status |
|---|---|---|
| `.docs/` | Refreshed | Success |

## Confirmation Gate

- No files will be moved, renamed, or deleted without your approval.