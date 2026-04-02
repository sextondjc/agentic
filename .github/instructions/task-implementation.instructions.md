---
name: task-implementation
applyTo: '.docs/changes/*.md'
description: 'Policy boundaries for executing approved plans and maintaining change traceability artifacts.'
---

# Task Plan Implementation Instructions

This instruction defines policy constraints only. Procedural execution workflows belong to skills.

## Scope

- Applies to change artifacts in `.docs/changes/*.md` produced while implementing approved plans.
- Governs traceability between plan files in `.docs/plans/**`, research notes in `.docs/research/**`, and delivered implementation artifacts.

## Mandatory Policy Requirements

- Execution work MUST reference an originating plan identifier.
- Change artifacts MUST record deviations from the approved plan with rationale.
- Change artifacts MUST be updated progressively during implementation, not only at completion.
- Quality and security standards from active instruction files remain mandatory for all implementation output.
- Release summary sections MUST be completed only after plan phases are finished.

## Workflow Ownership

- Use skill workflows for execution procedure details:
   - `task-execution` for same-session execution with task-level orchestration.
   - `executing-plans` for dedicated-session execution and checkpointed handoff.

- This instruction does not define step-by-step task execution flows.

## Success Criteria

- ✅ Change artifacts preserve plan linkage and deviation traceability.
- ✅ Progressive updates are present across the implementation lifecycle.
- ✅ Final release summary is present after completion.

## Template Changes File

Use the following template for `.docs/changes/YYYYMMDD-task-description-changes.md`.

**IMPORTANT**: Update this file after EVERY task completion by appending to Added, Modified, or Removed sections.
**MANDATORY**: Always include the following at the top of the changes file: `<!-- markdownlint-disable-file -->`

<!-- <changes-template> -->
```markdown
<!-- markdownlint-disable-file -->
# Release Changes: {{task name}}

**Related Plan**: {{plan-file-name}}
**Implementation Date**: {{YYYY-MM-DD}}

## Summary

{{Brief description of the overall changes made for this release}}

## Changes

### Added

- {{relative-file-path}} - {{one sentence summary of what was implemented}}

### Modified

- {{relative-file-path}} - {{one sentence summary of what was changed}}

### Removed

- {{relative-file-path}} - {{one sentence summary of what was removed}}

## Release Summary

**Total Files Affected**: {{number}}

### Files Created ({{count}})

- {{file-path}} - {{purpose}}

### Files Modified ({{count}})

- {{file-path}} - {{changes-made}}

### Files Removed ({{count}})

- {{file-path}} - {{reason}}

### Dependencies & Infrastructure

- **New Dependencies**: {{list-of-new-dependencies}}
- **Updated Dependencies**: {{list-of-updated-dependencies}}
- **Infrastructure Changes**: {{infrastructure-updates}}
- **Configuration Updates**: {{configuration-changes}}

### Deployment Notes

{{Any specific deployment considerations or steps}}
```
<!-- </changes-template> -->
