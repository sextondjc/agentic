---
name: instructions-audit
description: 'Prompt for a deep, report-only review of *.instructions.md files for duplication, conflicts, and boundary alignment with agents and skills.'
---

# Instructions Audit Prompt

Use the `validate-customization` skill to run a deep audit of instruction files.

## Goal

Review all `*.instructions.md` files and return a report that identifies:

- duplicate or overlapping guidance,
- conflicting guidance across instruction files,
- boundary conflicts between instructions and active agent personas or skills.

## Review Mode

- Report-only.
- Do not edit instruction, agent, or skill files as part of this prompt.

## Scope

- Target path: `.github/instructions/*.instructions.md`
- Cross-check catalogs and active customizations:
  - `.github/agents/*.agent.md`
  - `.github/skills/*/SKILL.md`
  - [instruction-lifecycle-catalog.md](./../instructions/instruction-lifecycle-catalog.md)
  - [agent-lifecycle-catalog.md](./../agents/agent-lifecycle-catalog.md)
  - [skill-discovery-index.md](./../skills/skill-discovery-index.md)

## Required Actions

1. Load and follow [SKILL.md](./../skills/validate-customization/SKILL.md).
2. Evaluate each instruction file against applicable INR standards.
3. Perform cross-file analysis for duplicate/conflicting policy content.
4. Perform boundary analysis against active agent and skill roles.
5. Produce severity-ranked findings with clear evidence and remediation options.

## Output Requirements

Return findings in Markdown grids first, then brief recommendations:

### Summary Grid

| Metric | Value |
|---|---|
| Files Reviewed | N |
| Duplicates Detected | N |
| Conflicts Detected | N |
| Agent/Skill Boundary Conflicts | N |
| Critical | N |
| Important | N |
| Advisory | N |

### Findings Grid

| Severity | Files Involved | Type | Evidence | Recommendation |
|---|---|---|---|---|
| Critical/Important/Advisory | <paths> | Duplicate/Conflict/Boundary | <line/path evidence> | <action> |

- Do not include code changes.
- If no issues are found, state that explicitly and list residual risks.


