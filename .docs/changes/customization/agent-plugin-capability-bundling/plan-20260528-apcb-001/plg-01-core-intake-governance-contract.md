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

## Asset Purpose and Benefit Matrix

| Asset | Purpose | Benefit |
|---|---|---|
| orchestrator.agent.md | Mandatory intake and routing authority for deterministic workflows. | Ensures all downstream plugin requests begin with consistent classification and scope control. |
| governance-lifecycle.instructions.md | Defines lane controls and handoff traceability. | Keeps intake and control-plane behavior aligned to Planning, Execution, Review governance. |
| request-economy.instructions.md | Enforces bounded discovery and efficient operation. | Reduces noise and unnecessary expansion in control-plane decisioning. |
| secure-coding.instructions.md | Provides cross-cutting security defaults. | Applies secure baseline to all routed work from this foundational plugin. |
| governance-release.instructions.md | Defines approval and release evidence policy. | Prevents ungated promotion behavior in routed workflows. |
| governance-naming-conventions.instructions.md | Standardizes asset naming and discoverability conventions. | Improves consistency of routed asset references and catalog integrity. |
| run-delivery-pattern.prompt.md | Encodes approved delivery pattern invocation. | Gives a repeatable entrypoint for lifecycle-consistent delivery routing. |
| execute-delivery.prompt.md | Supports controlled execution resumption. | Improves deterministic transition from intake to execution slices. |
| review-project.prompt.md | Provides pre-execution review posture check. | Reduces risk of executing with unresolved scope or governance drift. |
| work-intake-governance | Specializes intake classification and admission control. | Strengthens objective, scope, and boundary quality at request entry. |
| route-customization | Maps requests to correct customization type. | Prevents misrouting and keeps plugin composition precise. |
| compose-skills | Defines deterministic multi-skill composition contracts. | Enables safe composition of control-plane capabilities without ambiguity. |
| writing-plans | Produces execution-ready plans when absent. | Preserves planning completeness before execution starts. |
| task-research | Supports bounded research before implementation. | Improves decision quality for intake without uncontrolled exploration. |
| task-execution | Executes approved plans with traceability. | Connects control-plane decisions to implementation lifecycle safely. |
| plans | Supports checkpointed plan execution in dedicated sessions. | Maintains continuity for longer-running routed workstreams. |
| scope-change-control | Governs adds, swaps, and descopes during delivery. | Protects control-plane integrity when scope pressure appears. |
| taxonomy-tag-registry | Maintains tag consistency across artifacts. | Keeps categorization and routing metadata stable across plugins. |

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
