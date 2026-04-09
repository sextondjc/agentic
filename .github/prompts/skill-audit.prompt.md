---
name: skill-audit
description: 'Prompt for a deep review of all workspace skills against SKR standards, with per-skill reports and an aggregate grid result.'
---

# Full Workspace Skill Audit Prompt

Use the `skill-review` skill to perform a deep review of every skill under `.github/skills/`.

## Scope

- Review all skills found in `.github/skills/`.
- Include the `agent-customization` skill if present via `copilot-skill://`.
- Review date: today's date in `YYYY-MM-DD` format.

## Required Actions

1. Load the `skill-review` skill from [SKILL.md](./../skills/skill-review/SKILL.md) before beginning.
2. For each skill:
   - Load the current `SKILL.md`.
   - Load its history file from `.github/skills/skill-review/references/history/<skill>-history.md`.
   - Build a deny-list from entries marked Rejected, Removed, or Illegitimate in the history.
   - Evaluate all SKR-M* (MUST) and SKR-S* (SHOULD) standards with evidence.
   - Write a per-skill review report to `.docs/changes/skill/reviews/<skill-name>/review.md` using the template at [skill-review-report-template.md](./../skills/skill-review/references/skill-review-report-template.md).
   - Update the history file with findings.
3. After all skills are reviewed, produce the aggregate Markdown grid output in chat.

## Output Requirements

Return the following in chat, in this order:

### Aggregate Outcome Grid

| Metric | Value |
|---|---|
| Review Date | YYYY-MM-DD |
| Total Skills Reviewed | N |
| Pass | N |
| Pass With Advisories | N |
| Fail | N |
| Blocked | N |
| Total MUST Failures | N |
| Total SHOULD Advisories | N |

### Per-Skill Results Grid

| Skill | Outcome | MUST Failures | SHOULD Advisories | Conflict Status | Report |
|---|---|---:|---:|---|---|
| <skill-name> | Pass/Pass With Advisories/Fail/Blocked | N | N | None/Detected/Resolved/Blocked | <report-path> |

- Do not return per-skill prose summaries. Grids only.
- If any skill Fails or has advisories, list actionable remediation steps below the grid.

## Artifact Locations

| Artifact | Location |
|---|---|
| Per-skill reports | `.docs/changes/skill/reviews/<skill-name>/review.md` |
| Aggregate grid | `.docs/changes/skill/reviews/full-skill-review-grid.md` |
| Skill histories | `.github/skills/skill-review/references/history/<skill>-history.md` |
| History index | [index.md](./../skills/skill-review/references/history/index.md) |

## Notes

- Scripts are available in `.github/skills/skill-review/references/scripts/` to automate this audit if preferred over manual review. See `generate-baseline-skill-reviews.ps1` for full baseline generation and `build-skill-review-grid.ps1` to rebuild the aggregate grid from existing reports.
- If a conflict is detected between two skills, initiate the conflict resolution workflow using [skill-conflict-report-template.md](./../skills/skill-review/references/skill-conflict-report-template.md).
