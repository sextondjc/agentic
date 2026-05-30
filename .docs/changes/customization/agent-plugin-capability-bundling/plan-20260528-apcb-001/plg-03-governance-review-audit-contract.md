# PLG-03 Contract: governance-review-audit

## Contract Metadata

| Field | Value |
|---|---|
| Contract ID | PLG-03-CONTRACT-20260530 |
| Plan ID | PLAN-20260528-APCB-001 |
| Change ID | CHG-20260530-APCB-001 |
| Plugin ID | PLG-03 |
| Plugin Name | governance-review-audit |
| Status | Draft for Review |

## Capability Definition

| Field | Value |
|---|---|
| Primary Capability | Review-lane governance workflows for audits, findings, optimization, and release readiness decisions |
| In Scope | Customization audits, governance summarization, acceptance governance, review prompts, and release-readiness review support |
| Out of Scope | Domain implementation specialists and execution-lane implementation behavior |

## Asset Inclusion Manifest

| Asset Type | Included Assets |
|---|---|
| Agents | code-reviewer.agent.md; manual-code-reviewer.agent.md; governance-briefer.agent.md; powershell-reviewer.agent.md |
| Instructions | governance-lifecycle.instructions.md; technical-docs.instructions.md; task-implementation.instructions.md |
| Prompts | execute-customization-audit.prompt.md; governance-audit-types.prompt.md; governance-item-audit.prompt.md; audit-customization-types.prompt.md; audit-agent.prompt.md; optimize-customizations.prompt.md; execute-artifact-condense.prompt.md; execute-manual-review.prompt.md |
| Skills | governance-audit; execute-customization-audit; audit-executor; audit-customization-types; audit-agent; audit-instructions; audit-prompts; audit-skill; audit-powershell; acceptance-governance; optimize-customizations; governance-health-overview; governance-summarize; matrix-skill-mapping; delivery-status-grid; remediate-review; request-code-review; test-design-review; test-orchestration; release-readiness; release-simulation; post-release-retrospective |

## Dependency Declarations

| Dependency | Type | Rationale |
|---|---|---|
| PLG-01 core-intake-governance | Required | Review workflows depend on lifecycle controls and deterministic scope boundaries. |

## Inclusion and Exclusion Rules

| Rule ID | Rule |
|---|---|
| INC-PLG03-001 | Include only review-lane agents and audit-oriented skills/prompts. |
| INC-PLG03-002 | Include release-readiness and test review gates as review responsibilities. |
| EXC-PLG03-001 | Exclude execution-lane domain implementation specialists from this plugin. |
| EXC-PLG03-002 | Exclude plugin-authoring implementation assets that belong to PLG-04. |

## Validation Checklist

| Check ID | Check | Status |
|---|---|---|
| VAL-001 | Single primary capability statement is explicit. | Pass |
| VAL-002 | Manifest aligns with PLG-03 row in approved plan. | Pass |
| VAL-003 | Dependencies are explicit and minimal. | Pass |
| VAL-004 | Scope excludes implementation-lane domain assets. | Pass |
| VAL-005 | Plan and change traceability fields are present. | Pass |

## Review Handoff

| Field | Value |
|---|---|
| Ready For Review | Yes |
| Requested Review Focus | Separation of review-lane versus execution-lane responsibilities |
| Next Slice Gate | Broad rollout wave can begin after review disposition is recorded. |
