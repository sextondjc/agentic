---
name: prompts-audit
description: 'Prompt for a deep review of all workspace prompts against PRR standards, with per-prompt reports and an aggregate grid result.'
---

# Full Workspace Prompts Audit Prompt

Use the `validate-customization` skill to perform a deep review of every prompt under `.github/prompts/`.

## Scope

- Review all prompts found in `.github/prompts/*.prompt.md`.
- Review date: today's date in `YYYY-MM-DD` format.
- Apply PRR-M* and PRR-S* standards only.

## Required Actions

1. Load and follow [SKILL.md](./../skills/validate-customization/SKILL.md) before beginning.
2. For each prompt file:
   - Evaluate all PRR-M* (MUST) and PRR-S* (SHOULD) standards with evidence.
   - Write a per-prompt review report to `.docs/changes/customization/reviews/prompts/<prompt-name>/review.md`.
   - Append a history row to `.docs/changes/customization/reviews/audit-history.md`.
3. After all prompts are reviewed, produce the aggregate grid output in chat.

## Output Requirements

Return the following in chat, in this order:

### Aggregate Outcome Grid

| Metric | Value |
|---|---|
| Review Date | YYYY-MM-DD |
| Total Prompts Reviewed | N |
| Pass | N |
| Pass With Advisories | N |
| Fail | N |
| Total MUST Failures | N |
| Total SHOULD Advisories | N |

### Per-Prompt Results Grid

| Prompt | Outcome | MUST Failures | SHOULD Advisories | Conflict Status | Report |
|---|---|---:|---:|---|---|
| <prompt-name> | Pass/Pass With Advisories/Fail | N | N | None/Detected/Resolved | <report-path> |

- Grids only. No per-prompt prose summaries.
- If any prompt fails, list actionable remediation steps below the grid.
- Include the Violation Code Legend from the validate-customization skill output spec.

## Artifact Locations

| Artifact | Location |
|---|---|
| Per-prompt reports | `.docs/changes/customization/reviews/prompts/<prompt-name>/review.md` |
| Aggregate history | `.docs/changes/customization/reviews/audit-history.md` |
