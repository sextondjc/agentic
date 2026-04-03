<!-- markdownlint-disable-file -->
# Release Changes: Customization Taxonomy Promotion

**Related Plan**: PLAN-20260402-001
**Implementation Date**: 2026-04-02

## Summary

Promoted [customization-taxonomy-v1.md](./../reference/customization-taxonomy-v1.md) from draft to approved conceptual baseline, aligned it to current asset inventory, recorded precedence boundaries in ADR form, improved reference discoverability, and validated governance integrity.

## Changes

### Added

- [20260402-customization-taxonomy-promotion-changes.md](./20260402-customization-taxonomy-promotion-changes.md) - Progressive execution log for taxonomy promotion work.
- [20260402-customization-taxonomy-promotion-boundary.md](./../adr/20260402-customization-taxonomy-promotion-boundary.md) - ADR for taxonomy promotion boundary and precedence model.
- [20260402-governance-audit.md](./governance-audits/20260402-governance-audit.md) - Post-change governance validation report.

### Modified

- [customization-taxonomy-v1.md](./../reference/customization-taxonomy-v1.md) - Normalized taxonomy rows to current names/assets, added approved v1 family decisions, and made source-of-truth precedence explicit.
- [README.md](./../adr/README.md) - Added ADR index entry for taxonomy promotion decision.
- [index.md](./../reference/index.md) - Added direct link to taxonomy reference for discoverability.
- [20260402-customization-taxonomy-promotion-plan.md](./../plans/20260402-customization-taxonomy-promotion-plan.md) - Transitioned from approval-pending to execution-complete state and aligned acceptance closure.

### Removed

- None.

## Deviation Log

- No execution scope deviations from PLAN-20260402-001.
- Family model decisions were executed exactly as approved in the plan: keep `delivery` distinct from `execution`, keep performance assets under `test` in v1, and keep `architecture-designer` in `standards` for v1.

## Release Summary

**Total Files Affected**: 7

### Files Created (3)

- [20260402-customization-taxonomy-promotion-changes.md](./20260402-customization-taxonomy-promotion-changes.md) - Change traceability artifact.
- [20260402-customization-taxonomy-promotion-boundary.md](./../adr/20260402-customization-taxonomy-promotion-boundary.md) - Durable architecture/governance decision record.
- [20260402-governance-audit.md](./governance-audits/20260402-governance-audit.md) - Governance standards validation evidence.

### Files Modified (4)

- [customization-taxonomy-v1.md](./../reference/customization-taxonomy-v1.md) - Promoted and normalized taxonomy baseline.
- [README.md](./../adr/README.md) - Added ADR index row.
- [index.md](./../reference/index.md) - Added taxonomy discoverability link.
- [20260402-customization-taxonomy-promotion-plan.md](./../plans/20260402-customization-taxonomy-promotion-plan.md) - Updated status and closure markers.

### Files Removed (0)

- None.

### Dependencies & Infrastructure

- **New Dependencies**: None.
- **Updated Dependencies**: None.
- **Infrastructure Changes**: None.
- **Configuration Updates**: None.

### Deployment Notes

Documentation-only governance change. No runtime deployment or service restart required.
