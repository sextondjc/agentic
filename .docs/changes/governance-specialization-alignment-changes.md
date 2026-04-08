<!-- markdownlint-disable-file -->
# Release Changes: Governance Specialization Alignment

**Related Plan**: 20260407-governance-specialization-alignment-plan.md
**Implementation Date**: 2026-04-07

## Summary

Implemented governance-alignment changes with durable traceability artifacts: non-interactive frontmatter validation behavior, governance-owned hub-sync usage guidance, workspace-wide specialization terminology standardization across source assets, catalog and hub remediation, and missing skill-structure completion to restore a passing governance baseline.

## Changes

### Added

- .docs/research/20260407-governance-specialization-and-script-ownership-research.md - Captured evidence-backed research, constraints, and selected implementation approach.
- .docs/plans/20260407-governance-specialization-alignment-plan.md - Added executable plan with PLAN/VIS/WS/DEC traceability and session-survival handoff grid.
- .docs/changes/20260407-governance-specialization-alignment-changes.md - Added progressive execution change record linked to the plan.

### Modified

- .github/scripts/powershell/test-frontmatter-validity.ps1 - Removed interactive mandatory parameter prompting and added fail-fast missing parameter handling.
- .github/scripts/powershell/README.md - Re-scoped workflow integration so hub-sync validation is governance-routine owned rather than orchestrator/planning default behavior.
- .github/skills/governance-health-overview/SKILL.md - Standardized the boundary section header to Specialization and added hyper-specialized scope statement.
- .github/agents/*.agent.md - Standardized agent boundary headings to Specialization.
- .github/skills/*/SKILL.md - Standardized remaining skill boundary headings to Specialization.
- .github/copilot-instructions.md - Replaced singular-purpose wording with specialization-first guidance.
- .github/skills/customization-authoring/** - Updated agent authoring templates and checks to require Specialization.
- .github/skills/audit-governance/SKILL.md - Updated governance review standards from singular-purpose wording to specialization wording.
- .github/skills/validate-customization/SKILL.md - Updated customization review standards to require Specialization sections.
- .github/agents/agent-lifecycle-catalog.md - Added the missing manual-code-reviewer catalog entry.
- .github/prompts/prompt-lifecycle-catalog.md - Added missing prompt catalog rows and corrected the prompt header label used by integrity checks.
- .github/copilot-instructions.md - Re-synchronized preferred agents and skills with actual assets.
- .github/skills/*/SKILL.md - Added missing Specialization and Trigger Conditions sections where required to satisfy skill review standards.
- .docs/changes/governance-audits/20260407-governance-audit.md - Refreshed the core governance artifact to the passing post-remediation state.
- .docs/changes/skill-reviews/20260407-full-skill-review-grid.md - Refreshed the skill review aggregate to the passing post-remediation state.
- .docs/changes/governance-audits/20260407-comprehensive-workspace-health-audit.md - Refreshed the reconciled health audit to the passing post-remediation state.

### Removed

- None.

## Workstream Traceability

| Workstream ID | Change | Status | Evidence |
|---|---|---|---|
| WS-01 | Non-interactive script behavior | Completed | .github/scripts/powershell/test-frontmatter-validity.ps1 |
| WS-02 | Governance-only hub-sync ownership text | Completed | .github/scripts/powershell/README.md |
| WS-03 | Specialization terminology transition | Completed | .github/skills/governance-health-overview/SKILL.md |

## Deviations

| Decision ID | Planned | Actual | Rationale |
|---|---|---|---|
| DEC-03 | Apply specialization terminology | Expanded across workspace source assets in follow-up pass | Standardized headings and governing rule text across agents, skills, instructions, and templates |
| DEC-04 | Stop after terminology and script changes | Expanded to full governance remediation until 2026-04-07 audits passed | User requested continued execution until complete; catalog drift and skill structure gaps were remediated in the same session |

## Release Summary

**Total Files Affected**: 54

### Files Created (3)

- .docs/research/20260407-governance-specialization-and-script-ownership-research.md - Research baseline for durable handoff.
- .docs/plans/20260407-governance-specialization-alignment-plan.md - Execution-ready plan with traceability IDs.
- .docs/changes/20260407-governance-specialization-alignment-changes.md - Progressive implementation tracking artifact.

### Files Modified (51)

- .github/scripts/powershell/test-frontmatter-validity.ps1 - Non-interactive parameter handling update.
- .github/scripts/powershell/README.md - Ownership boundary update for test-hub-file-sync usage.
- .github/skills/governance-health-overview/SKILL.md - Specialization terminology update.
- .github/agents/*.agent.md - Standardization of boundary headings to Specialization.
- .github/skills/*/SKILL.md - Standardization of boundary headings and related specialization terminology.
- .github/copilot-instructions.md - Specialist routing language updated to specialization wording.
- .github/instructions/naming-conventions.instructions.md - Terminology updated to specialization wording.
- .github/skills/customization-authoring/** - Agent template and review checklist updated to Specialization.
- .github/agents/agent-lifecycle-catalog.md - Manual reviewer agent catalog entry added.
- .github/prompts/prompt-lifecycle-catalog.md - Prompt catalog corrected and completed.
- .github/skills/*/SKILL.md - Missing skill structure sections remediated.
- .docs/changes/governance-audits/20260407-governance-audit.md - Passing governance audit state recorded.
- .docs/changes/skill-reviews/20260407-full-skill-review-grid.md - Passing skill review aggregate recorded.
- .docs/changes/governance-audits/20260407-comprehensive-workspace-health-audit.md - Passing reconciled audit state recorded.

### Files Removed (0)

- None.

### Dependencies & Infrastructure

- **New Dependencies**: None.
- **Updated Dependencies**: None.
- **Infrastructure Changes**: None.
- **Configuration Updates**: None.

### Deployment Notes

No deployment action required. Governance cadence runs will naturally pick up these changes.

