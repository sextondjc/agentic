<!-- markdownlint-disable-file -->
# Release Changes: Instruction Economy Wave Two

**Related Plan**: instruction-economy-wave-two-plan.md
**Implementation Date**: 2026-04-09

## Summary

Implements isolated Wave 2 instruction-economy reductions on clean files only, preserving mandatory governance policy while moving workflow detail out of always-loaded instructions.

## Changes

### Added

- .docs/changes/governance/audits/instruction-economy-follow-up-review.md - Records post-Wave-1 review disposition and concurrent-drift safety guardrails.
- .docs/plans/instruction-economy-wave-two-plan.md - Records isolated Wave 2 scope and resumable workstreams.
- .docs/changes/instruction-economy-wave-two-changes.md - Progressive Wave 2 execution record.

### Modified

- .github/instructions/task-implementation.instructions.md - Reduced to policy-only constraints and routing notes.
- .github/instructions/lifecycle-governance.instructions.md - Reduced workflow payload and kept deterministic governance policy.

### Removed

- None.

## Workstream Traceability

| Workstream ID | Change | Status | Evidence |
|---|---|---|---|
| WS2-01 | Task implementation instruction shim | Completed | .github/instructions/task-implementation.instructions.md |
| WS2-02 | Lifecycle governance instruction trim | Completed | .github/instructions/lifecycle-governance.instructions.md |
| WS2-03 | Validation and footprint refresh | Completed | Post-change footprint: 797 instruction lines; touched-file error scan clean |

## Deviations

| Decision ID | Planned | Actual | Rationale |
|---|---|---|---|
| DEC-IE-W2-002 | Edit all next-largest candidates | Edited clean files only | Concurrent drift required isolated scope to avoid collisions. |

## Release Summary

**Total Files Affected**: 5

### Files Created (3)

- .docs/changes/governance/audits/instruction-economy-follow-up-review.md - Follow-up review artifact.
- .docs/plans/instruction-economy-wave-two-plan.md - Wave 2 resumable plan.
- .docs/changes/instruction-economy-wave-two-changes.md - Wave 2 progressive changes log.

### Files Modified (2)

- .github/instructions/task-implementation.instructions.md - Converted to concise policy shim.
- .github/instructions/lifecycle-governance.instructions.md - Reduced to strict lifecycle governance policy.

### Files Removed (0)

- None.
