---
name: agents-audit
description: 'Prompt for a deep review of all workspace agents against AGR standards, with per-agent reports and an aggregate grid result.'
---

# Full Workspace Agents Audit Prompt

Use the `validate-customization` skill to perform a deep review of every agent under `.github/agents/`.

## Scope

- Review all agents found in `.github/agents/*.agent.md`.
- Review date: today's date in `YYYY-MM-DD` format.
- Apply AGR-M* and AGR-S* standards only.

## Required Actions

1. Load and follow [SKILL.md](./../skills/validate-customization/SKILL.md) before beginning.
2. For each agent file:
   - Evaluate all AGR-M* (MUST) and AGR-S* (SHOULD) standards with evidence.
   - Write a per-agent review report to `.docs/changes/customization/reviews/agents/<agent-name>/review.md`.
   - Append a history row to `.docs/changes/customization/reviews/audit-history.md`.
3. After all agents are reviewed, produce the aggregate grid output in chat.

## Output Requirements

Return the following in chat, in this order:

### Aggregate Outcome Grid

| Metric | Value |
|---|---|
| Review Date | YYYY-MM-DD |
| Total Agents Reviewed | N |
| Pass | N |
| Pass With Advisories | N |
| Fail | N |
| Total MUST Failures | N |
| Total SHOULD Advisories | N |

### Per-Agent Results Grid

| Agent | Outcome | MUST Failures | SHOULD Advisories | Conflict Status | Report |
|---|---|---:|---:|---|---|
| <agent-name> | Pass/Pass With Advisories/Fail | N | N | None/Detected/Resolved | <report-path> |

- Grids only. No per-agent prose summaries.
- If any agent fails, list actionable remediation steps below the grid.
- Include the Violation Code Legend from the validate-customization skill output spec.

## Artifact Locations

| Artifact | Location |
|---|---|
| Per-agent reports | `.docs/changes/customization/reviews/agents/<agent-name>/review.md` |
| Aggregate history | `.docs/changes/customization/reviews/audit-history.md` |
