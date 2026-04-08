---
name: governance-health-overview
description: Use when you need a reconciled, cross-skill governance health view that synthesizes outputs from audit-governance, skill-review, and validate-customization into one disposition.
---

# Governance Health Overview

## Specialization

Produce one reconciled governance health view across core governance, skill quality, and customization quality by synthesizing outputs from specialized review skills.

This skill is hyper-specialized for governance health reconciliation only.

This skill does not replace `audit-governance`, `skill-review`, or `validate-customization`; it only aggregates and reconciles their outputs.

## Trigger Conditions

Invoke this skill when any of the following is true:

- Multiple governance-related audits were run and their results need one unified disposition.
- A governance report appears inconsistent with skill/customization review outputs.
- A monthly cadence report must include both policy-level and artifact-level review status.

## Required Inputs

- Audit date (`YYYY-MM-DD`).
- Target scope (full workspace or constrained scope when explicitly requested).
- Optional override paths only when rerun is explicitly blocked; otherwise generate fresh artifacts in this invocation.

## Required Outputs

- Reconciled report at `.docs/changes/governance-audits/comprehensive-workspace-health-audit.md`.
- Coverage Grid.
- Standards Health Grid including GOV-M*, GOV-S*, plus aggregated GOV-SK and GOV-CUS outcomes.
- Aggregate Metrics Grid.
- Ranked Recommendations Grid.
- Explicit final disposition (`PASSED` or `FAILED`) based on MUST failures and open conflicts.

## Workflow

0. Use `powershell-script-library` first and run `invoke-governance-health-overview.ps1` to collect evidence in one non-interactive execution when tooling permits.
1. Run `audit-governance` first and produce a fresh core governance artifact under `.docs/changes/governance-audits/` for the audit date.
2. Run `skill-review` second and produce a fresh aggregate skill review artifact under `.docs/changes/skill-reviews/` for the audit date.
3. Run `validate-customization` third and produce a fresh aggregate customization review artifact under `.docs/changes/customization-reviews/` for the audit date.
4. Verify all three artifacts are generated in the current invocation and capture their paths in the report metadata.
5. Reconcile the three fresh sources into one coherent set of metrics.
6. If any MUST failures or open conflicts exist in any source, set disposition to `FAILED`.
7. Produce ranked remediation recommendations mapped to evidence artifacts.

## Freshness Policy

- Default behavior is `fresh-run required`.
- Do not aggregate from previously existing artifacts when reruns are possible.
- If reruns are blocked (tooling failure, permissions, or explicit user override), report `stale-input mode` in metadata and list the blocking reason.
- In `stale-input mode`, prefer latest-dated artifacts and mark disposition as provisional until fresh routines complete.

## Execution Efficiency Policy

- Target one terminal approval for the full workflow by batching phase evidence collection.
- Avoid interactive commands and prompts; pass required parameters explicitly.
- If one-approval execution is blocked by environment limits, document the blocker and the minimal extra approvals required.

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

- Core, skill, and customization governance routines were executed in this invocation.
- Report metadata records the three freshly generated source artifact paths.
- Report includes reconciled metrics from all three source skills.
- All source paths are cited in evidence rows.
- Final disposition matches MUST/conflict decision rules.

## Inputs

- User request context and target scope for this skill invocation.

