# Librarian Curation Report

## Naming Violations Grid

| Path | Type | Violation | Suggested Name |
|---|---|---|---|
| `.docs/changes/skill/reviews/**/20260409-review.md` (48 files) | File | Date-prefixed filename; dates in names are prohibited | `review.md` (retain date in frontmatter/content) |
| `.docs/changes/skill/reviews/20260409-full-skill-review-grid.md` | File | Date-prefixed filename; dates in names are prohibited | `full-skill-review-grid.md` |
| `.docs/reference/.github/**/*.md.ref.md` | File | Double/triple-extension pattern (`*.md.ref.md`) | `<descriptive-name>-reference.md` |

## Structural Recommendations Grid

| Current Path | Suggested Path | Reason |
|---|---|---|
| `.docs/changes/skill-reviews/` | `.docs/changes/skill/reviews/` | Completed: files moved to canonical path and legacy folder removed in delete-approved pass |
| `.docs/changes/governance-audits/` | `.docs/changes/governance/audits/` | Completed: files moved to canonical path and legacy folder removed in delete-approved pass |
| `.docs/reference/.github/` | `.archive/reference-github-mirror/` (or remove after validation) | Mirror copies of source-of-truth `.github/` docs are redundant for active corpus navigation |
| `.docs/reference/.docs/` | `.archive/reference-docs-mirror/` (or remove after validation) | Mirror copies duplicate active `.docs` content and increase index noise |
| `.docs/reference/index.md` | `.docs/reference/INDEX.md` | Completed |

## Curation Candidates Grid

| Path | Category | Confidence | Suggested Action | Reason |
|---|---|---|---|---|
| `.docs/changes/skill-reviews/` and `.docs/changes/skill/reviews/` | Redundant | Resolved | Consolidated to nested path | Legacy flat folder removed after user delete approval |
| `.docs/changes/governance-audits/` and `.docs/changes/governance/audits/` | Redundant | Resolved | Consolidated to nested path | Legacy folder removed after user delete approval |
| `.docs/reference/.github/**` | Redundant | High | Archive/remove candidate | Reference mirror duplicates primary `.github/` customization assets |
| `.docs/reference/.docs/**` | Redundant | High | Archive/remove candidate | Reference mirror duplicates active `.docs` assets |
| `.docs/changes/skill/reviews/**/INDEX.legacyflat.md` | Redundant | Resolved | Removed | Legacy conflict-safe index files removed in delete-approved pass |

## Index Status Grid

| Root | Index Action | Status |
|---|---|---|
| `.docs/` | Refreshed | Complete via `invoke-index-refresh.ps1` (`FoldersIndexed=100`, `DocumentsIndexed=289`) |

## Execution Status Grid

| Approved Action | Status | Notes |
|---|---|---|
| Consolidate `.docs/changes/skill-reviews` into `.docs/changes/skill/reviews` | Completed | 48 dated review files and related index/grid artifacts moved to canonical tree |
| Consolidate `.docs/changes/governance-audits` into `.docs/changes/governance/audits` | Completed | Files moved with conflict-safe suffixing where names already existed |
| Normalize `.docs/reference/index.md` casing | Completed | Now resolved as `.docs/reference/INDEX.md` |
| Delete legacy files/folders (approved) | Completed | Legacy folders removed and legacy-suffix artifacts removed in cleanup pass |

## Confirmation Gate

Delete-approved cleanup is complete for the legacy consolidation targets.

## Artifact Locations

| Artifact | Location |
|---|---|
| Curation report | `.docs/changes/librarian-curation-report.md` |
| Generated indexes | `<selected-root>/INDEX.md` and child `INDEX.md` files |

