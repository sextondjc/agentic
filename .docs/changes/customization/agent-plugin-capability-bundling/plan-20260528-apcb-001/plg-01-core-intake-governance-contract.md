# PLG-01 Contract: core-intake-governance

## Contract Metadata

| Field | Value |
|---|---|
| Contract ID | PLG-01-CONTRACT-20260530 |
| Plan ID | PLAN-20260528-APCB-001 |
| Change ID | CHG-20260530-APCB-001 |
| Plugin ID | PLG-01 |
| Plugin Name | core-intake-governance |
| Status | Draft for Review |

## Capability Definition

| Field | Value |
|---|---|
| Primary Capability | Deterministic intake, lifecycle governance, and cross-plugin control plane |
| In Scope | Intake routing, lifecycle policy, request economy, secure defaults, release governance references, composition control skills |
| Out of Scope | Domain-specific engineering behaviors, framework-specific implementations, plugin publishing mechanics |

## Asset Inclusion Manifest

| Asset Type | Included Assets |
|---|---|
| Agents | orchestrator.agent.md |
| Instructions | governance-lifecycle.instructions.md; request-economy.instructions.md; secure-coding.instructions.md; governance-release.instructions.md; governance-naming-conventions.instructions.md |
| Prompts | run-delivery-pattern.prompt.md; execute-delivery.prompt.md; review-project.prompt.md |
| Skills | work-intake-governance; route-customization; compose-skills; writing-plans; task-research; task-execution; plans; scope-change-control; taxonomy-tag-registry |

## Dependency Model

| Rule ID | Rule | Enforcement |
|---|---|---|
| DEP-PLG01-001 | Shared assets are centrally referenced, not duplicated into downstream plugins. | Downstream plugin contracts must declare dependency on PLG-01 for these assets. |
| DEP-PLG01-002 | PLG-01 is mandatory foundation for execution-capable plugin compositions. | Composition graph validation before slice promotion. |
| DEP-PLG01-003 | Dependency declarations must be explicit by plugin ID. | Reject implicit dependency assumptions during review. |

## Inclusion and Exclusion Rules

| Rule ID | Rule |
|---|---|
| INC-001 | Include only assets that enforce intake governance or deterministic execution controls. |
| INC-002 | Include only prompts that operationalize intake and delivery control behavior. |
| EXC-001 | Exclude domain-specific specialists and skills from PLG-02 through PLG-16. |
| EXC-002 | Exclude implementation workflows that bypass orchestrator or lifecycle governance controls. |

## Validation Checklist

| Check ID | Check | Status |
|---|---|---|
| VAL-001 | Single primary capability statement is explicit. | Pass |
| VAL-002 | Asset inclusion list maps 1:1 to approved plan rows for PLG-01. | Pass |
| VAL-003 | Shared asset strategy aligns with CQ-002 resolution. | Pass |
| VAL-004 | Scope boundary excludes domain execution assets. | Pass |
| VAL-005 | Traceability to plan and change IDs is present. | Pass |

## Review Handoff

| Field | Value |
|---|---|
| Ready For Review | Yes |
| Requested Review Focus | Scope leakage, dependency ambiguity, and policy completeness |
| Next Slice Gate | PLG-04 may start only after review disposition is recorded. |
