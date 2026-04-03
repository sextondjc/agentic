---
name: governance-health-overview
description: Use when you need a reconciled, cross-skill governance health view that synthesizes outputs from audit-governance, skill-review, and validate-customization into one disposition.
---

# Governance Health Overview

## Singular Purpose

Produce one reconciled governance health view across core governance, skill quality, and customization quality by synthesizing outputs from specialized review skills.

This skill does not replace `audit-governance`, `skill-review`, or `validate-customization`; it only aggregates and reconciles their outputs.

## Trigger Conditions

Invoke this skill when any of the following is true:

- Multiple governance-related audits were run and their results need one unified disposition.
- A governance report appears inconsistent with skill/customization review outputs.
- A monthly cadence report must include both policy-level and artifact-level review status.

## Required Inputs

- Audit date (`YYYY-MM-DD`).
- Core governance report path under `.docs/changes/governance-audits/`.
- Skill review aggregate path under `.docs/changes/skill-reviews/`.
- Customization review aggregate path under `.docs/changes/customization-reviews/`.

## Required Outputs

- Reconciled report at `.docs/changes/governance-audits/YYYYMMDD-comprehensive-workspace-health-audit.md`.
- Coverage Grid.
- Standards Health Grid including GOV-M*, GOV-S*, plus aggregated GOV-SK and GOV-CUS outcomes.
- Aggregate Metrics Grid.
- Ranked Recommendations Grid.
- Explicit final disposition (`PASSED` or `FAILED`) based on MUST failures and open conflicts.

## Workflow

1. Read `audit-governance` output for GOV-M* and GOV-S* baseline.
2. Read `skill-review` aggregate output for pass/fail/advisory totals and MUST failures.
3. Read `validate-customization` aggregate output for MUST failures, advisories, and conflicts.
4. Reconcile all three sources into one coherent set of metrics.
5. If any MUST failures or open conflicts exist in any source, set disposition to `FAILED`.
6. Produce ranked remediation recommendations mapped to evidence artifacts.

## Decision Rules

- Core governance pass does not override failing skill/customization quality outcomes.
- Open conflict artifacts from customization review force overall `FAILED` until resolved.
- If source artifacts disagree, cite each artifact and prefer latest-dated output.

## Companion Skills

- `audit-governance`
- `skill-review`
- `validate-customization`
- `sync-customizations`
- `sync-skills`

## Done Criteria

- Report includes reconciled metrics from all three source skills.
- All source paths are cited in evidence rows.
- Final disposition matches MUST/conflict decision rules.

## Inputs

- User request context and target scope for this skill invocation.

