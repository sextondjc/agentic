---
name: governance-type-audit
description: 'Canonical Level 2 governance prompt for type-level deep-scan reporting (agents, instructions, prompts, skills, optimization).'
---

# Governance Type Audit Prompt

Route this request to `orchestrator`.

Use the `governance-health-overview` skill as the orchestration workflow and then render the requested type slice.

## Purpose

Produce a Level 2 type-level governance report with standardized delta and failure-ID schema aligned to the executive report.

## Required Input

- `Target Type`: `agents` | `instructions` | `prompts` | `skills` | `optimization`

## Deep-Scan Requirement (Mandatory)

Even for a type slice, run deep scan across all customization roots first:

- `.github/agents/*.agent.md`
- `.github/instructions/*.instructions.md`
- `.github/prompts/*.prompt.md`
- `.github/skills/*/SKILL.md`

Then filter findings/metrics to the requested type.

## Required Actions

1. Load and follow [SKILL.md](./../skills/governance-health-overview/SKILL.md).
2. Use full-workspace evidence collection from `fresh-run required` execution.
3. Render only the target type as Level 2 output while preserving links to Level 3 item evidence.
4. Maintain standardized schemas identical to executive report for delta and failure detail sections.

## Output Contract

Return sections in this order:

1. Type Scope Grid
2. Aggregate Outcome Grid
3. Standards Health Grid (type-specific standards)
4. Failure Detail Grid
5. Delta vs Prior Report Grid (Metric, Prior, Current, Delta, Trend)
6. Ranked Recommendations Grid
7. Final Disposition (`PASSED`, `FAILED`, or `PROVISIONAL-FAILED`)

## Failure ID Format

Use normalized IDs in the form `GOV-<DOMAIN>-NNN` where `<DOMAIN>` is one of:

- `CUS` for customization findings
- `OPT` for optimization findings
- `SK` for skill findings
