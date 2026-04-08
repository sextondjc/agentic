<!-- markdownlint-disable-file -->
# Release Changes: Docs Condensation Pass

**Related Plan**: User-directed condensation request (no pre-existing plan file)
**Implementation Date**: 2026-04-08

## Summary

Condensed date-prefixed review documents into per-folder history files, archived original dated documents outside `.docs`, and reduced active markdown files under `.docs` from 401 to 193.

## Changes

### Added

- .github/scripts/powershell/condense-dated-docs.ps1 - Automates condensation of dated review docs into history files and archives originals.
- .docs/changes/skill-reviews/*/history.md - Consolidated per-skill review histories.
- .docs/changes/skill-reviews/full-skill-review-history.md - Consolidated top-level full skill review grids.
- .docs/changes/customization-reviews/*/history.md - Consolidated per-asset customization review histories.
- .docs/changes/customization-reviews/audit-history.md - Consolidated customization review audit history.
- .docs/changes/20260408-docs-condensation-pass.md - Traceability report for this condensation run.

### Modified

- .docs/changes/skill-maintenance/20260407-prune-doc-artifacts-disposition.md - Updated archive destination paths from `.docs/archive` to `.archive`.
- .docs/changes/skill-reviews/full-skill-review-history.md - Updated archive path references.
- .docs/changes/customization-reviews/audit-history.md - Updated archive path references.

### Removed

- .docs/changes/skill-reviews/**/20*.md (multi-file set) - Date-prefixed review snapshots moved to archive after condensation.
- .docs/changes/customization-reviews/**/20*.md (multi-file set) - Date-prefixed review snapshots moved to archive after condensation.
- .docs/changes/skill-reviews/20*-full-skill-review-grid.md (multi-file set) - Dated full review grid files moved to archive.
- .docs/changes/customization-reviews/20*-audit*.md (multi-file set) - Dated audit files moved to archive.

## Release Summary

**Total Files Affected**: 376

### Files Created (84)

- .github/scripts/powershell/condense-dated-docs.ps1 - Condensation automation script.
- .docs/changes/skill-reviews/*/history.md + full-skill-review-history.md - Rollup history artifacts.
- .docs/changes/customization-reviews/*/history.md + audit-history.md - Rollup history artifacts.
- .docs/changes/20260408-docs-condensation-pass.md - Change report.

### Files Modified (86)

- .docs markdown files containing archive path references - Updated from `.docs/archive/...` to `.archive/...`.

### Files Removed (206)

- Date-prefixed markdown files under `.docs/changes/skill-reviews/**` and `.docs/changes/customization-reviews/**` moved to archive.

### Dependencies & Infrastructure

- **New Dependencies**: None.
- **Updated Dependencies**: None.
- **Infrastructure Changes**: Added script-based condensation workflow.
- **Configuration Updates**: None.

### Deployment Notes

- Archived source files are preserved under `.archive/condense` and `.archive/prune`.
- Active `.docs` count is now 193 markdown files.

