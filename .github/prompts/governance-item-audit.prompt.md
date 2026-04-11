---
name: governance-item-audit
description: 'Canonical Level 3 governance prompt for individual customization evidence and remediation tracking.'
---

# Governance Item Audit Prompt

Route this request to `orchestrator`.

Use `governance-health-overview` to gather full-workspace evidence and use `validate-customization` / `skill-review` / `optimize-customizations` for item-level findings as applicable.

## Purpose

Produce a Level 3 item report for one specific customization with evidence-backed findings linked from Level 2 and Level 1 reports.

## Required Input

- `Item Path`: path to one customization file under `.github/agents`, `.github/instructions`, `.github/prompts`, or `.github/skills`

## Deep-Scan Requirement (Mandatory)

Do not run isolated item-only checks. First collect full-workspace deep-scan evidence across all customization roots, then focus the report on the requested item.

## Required Actions

1. Run full-workspace governance evidence collection (`fresh-run required`).
2. Evaluate the item against all applicable MUST/SHOULD standards.
3. Emit normalized failure IDs and remediation actions.
4. Link the item report to its Level 2 aggregate and Level 1 executive report.

## Output Contract

Return sections in this order:

1. Item Scope Grid
2. Applicable Standards Grid
3. Failure Detail Grid (standardized schema)
4. Delta vs Prior Item Grid (Metric, Prior, Current, Delta, Trend)
5. Ranked Recommendations Grid
6. Final Disposition (`PASSED`, `FAILED`, or `PROVISIONAL-FAILED`)

## Failure ID Format

Use normalized IDs in the form `GOV-<DOMAIN>-NNN` where `<DOMAIN>` is one of:

- `M`, `S`, `SK`, `CUS`, `OPT`
