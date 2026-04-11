---
name: governance-executive-audit
description: 'Canonical Level 1 governance prompt for full-workspace deep scan and executive disposition reporting.'
---

# Governance Executive Audit Prompt

Route this request to `orchestrator`.

Use the `governance-health-overview` skill as the primary workflow.

## Purpose

Produce the Level 1 executive governance report for the full workspace with standardized metrics, coverage, failures, deltas, ranked recommendations, and final disposition.

## Deep-Scan Requirement (Mandatory)

Run a full-workspace deep scan across all available customizations before any disposition:

- `.github/agents/*.agent.md`
- `.github/instructions/*.instructions.md`
- `.github/prompts/*.prompt.md`
- `.github/skills/*/SKILL.md`

A partial scan cannot produce `PASSED`; mark as `PROVISIONAL-FAILED`.

## Required Actions

1. Load and follow [SKILL.md](./../skills/governance-health-overview/SKILL.md).
2. Run governance synthesis with `fresh-run required`.
3. Run companion checks for docs corpus hygiene via `librarian`.
4. Generate/update [governance-executive-audit.md](./../../.docs/changes/governance/audits/governance-executive-audit.md).
5. Ensure Level 1 report links to Level 2 and Level 3 artifacts.

## Output Contract

Return sections in this order:

1. Report Navigation Grid (Level 1 -> Level 2 -> Level 3)
2. Coverage Grid
3. Standards Health Grid
4. Aggregate Metrics Grid
5. Failure Detail Grid
6. Delta vs Prior Report Grid (Metric, Prior, Current, Delta, Trend)
7. Docs Corpus Hygiene Grid
8. Ranked Recommendations Grid
9. Final Disposition (`PASSED`, `FAILED`, or `PROVISIONAL-FAILED`)


