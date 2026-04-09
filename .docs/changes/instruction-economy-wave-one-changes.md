<!-- markdownlint-disable-file -->
# Release Changes: Instruction Economy Wave One

**Related Plan**: instruction-economy-wave-one-plan.md
**Implementation Date**: 2026-04-09

## Summary

Implements the first instruction-economy migration wave: durable governance artifacts, instruction-to-skill splitting for the five heaviest instruction files, and discovery updates so the slimmer instruction layer remains clear and usable across sessions.

## Changes

### Added

- .docs/changes/governance/audits/instruction-economy-review.md - Records the review findings, routing matrix, Wave 1 approval, and expected savings.
- .docs/plans/instruction-economy-wave-one-plan.md - Records the resumable execution plan with workstream traceability.
- .docs/changes/instruction-economy-wave-one-changes.md - Tracks this implementation progressively against the approved plan.
- .github/skills/domain-design/SKILL.md - Adds the on-demand architecture workflow skill introduced by Wave 1.

### Modified

- .github/instructions/architecture.instructions.md - Reduced always-on architecture guidance to policy-only rules and routed detailed workflow depth to the new domain-design skill.
- .github/instructions/syrx.instructions.md - Reduced always-on Syrx guidance to mandatory repository and SQL policy only.
- .github/skills/syrx-data-access/SKILL.md - Clarified that detailed Syrx implementation depth now belongs in the skill layer.
- .github/instructions/csharp.instructions.md - Reduced always-on C# guidance to core engineering policy and routing notes.
- .github/skills/dotnet-refactor/SKILL.md - Added modernization workflow and evidence gates for on-demand deep guidance.
- .github/instructions/naming-conventions.instructions.md - Reduced naming guidance to policy-only rules and routed migration depth to authoring and librarian skills.
- .github/skills/librarian/SKILL.md - Added concise migration notes for document renames and restructuring.
- .github/instructions/powershell.instructions.md - Reduced always-on PowerShell guidance to core automation policy.
- .github/skills/powershell-script-library/SKILL.md - Repaired malformed links and absorbed on-demand cmdlet and script authoring guidance.
- .github/skills/skill-discovery-index.md - Registered the new domain-design skill.
- .github/copilot-instructions.md - Updated hub guidance to the concise instruction shim plus skills model.

### Removed

- None.

## Workstream Traceability

| Workstream ID | Change | Status | Evidence |
|---|---|---|---|
| WS-01 | Governance review artifact | Completed | .docs/changes/governance/audits/instruction-economy-review.md |
| WS-02 | Resumable implementation plan | Completed | .docs/plans/instruction-economy-wave-one-plan.md |
| WS-03 | Architecture split | Completed | .github/instructions/architecture.instructions.md |
| WS-04 | Syrx split | Completed | .github/instructions/syrx.instructions.md |
| WS-05 | C# split | Completed | .github/instructions/csharp.instructions.md |
| WS-06 | Naming split | Completed | .github/instructions/naming-conventions.instructions.md |
| WS-07 | PowerShell split and discovery sync | Completed | .github/instructions/powershell.instructions.md |

## Deviations

| Decision ID | Planned | Actual | Rationale |
|---|---|---|---|
| DEC-IE-010 | Reuse existing skills where practical | Added one new skill (`domain-design`) | The architecture instruction had no appropriate on-demand skill destination and required a reusable workflow home. |

## Release Summary

**Total Files Affected**: 15

### Files Created (4)

- .docs/changes/governance/audits/instruction-economy-review.md - Review artifact for the approved migration wave.
- .docs/plans/instruction-economy-wave-one-plan.md - Resumable implementation plan.
- .docs/changes/instruction-economy-wave-one-changes.md - Progressive execution record.
- .github/skills/domain-design/SKILL.md - New on-demand architecture workflow skill.

### Files Modified (11)

- .github/instructions/architecture.instructions.md - Converted to a policy-only architecture shim.
- .github/instructions/syrx.instructions.md - Converted to a policy-only Syrx shim.
- .github/instructions/csharp.instructions.md - Converted to a policy-only C# shim.
- .github/instructions/naming-conventions.instructions.md - Converted to a policy-only naming shim.
- .github/instructions/powershell.instructions.md - Converted to a policy-only PowerShell shim.
- .github/skills/syrx-data-access/SKILL.md - Absorbed explicit ownership of detailed Syrx guidance.
- .github/skills/dotnet-refactor/SKILL.md - Absorbed modernization workflow detail.
- .github/skills/librarian/SKILL.md - Added rename and restructuring migration notes.
- .github/skills/powershell-script-library/SKILL.md - Repaired links and absorbed cmdlet and script authoring detail.
- .github/skills/skill-discovery-index.md - Added the domain-design discovery row.
- .github/copilot-instructions.md - Shifted hub guidance to concise instructions plus skills.

### Files Removed (0)

- None.

### Dependencies & Infrastructure

- **New Dependencies**: None.
- **Updated Dependencies**: None.
- **Infrastructure Changes**: None.
- **Configuration Updates**: None.

### Deployment Notes

No deployment action required. Future sessions can resume directly from the saved plan and changes record.