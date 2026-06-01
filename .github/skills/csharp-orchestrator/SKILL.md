---
name: csharp-orchestrator
description: Use when one C# and .NET request spans multiple capability areas and needs one deterministic intake, explicit phase ownership, and a unified execution contract.
---

# C# Orchestrator

## Specialization

Use this skill to coordinate cross-project C# and .NET requests from one intake when work spans language design, async behavior, architecture, validation, data access, testing, and hardening.

This skill is specialized for intake, phase ownership, and unified synthesis. It does not replace deep execution guidance for any single phase.

## Objective

Produce one deterministic C# execution contract from a single intake, with explicit phase ownership, evidence expectations, and completion checks.

## Trigger Conditions

- A C# request spans more than one capability area.
- Teams need one intake instead of disconnected language, architecture, and testing workflows.
- Cross-project reuse matters more than local one-off optimization.
- A change requires explicit ownership across language, async, architecture, validation, testing, or performance, including repository-contract decisions that require a test-guidance follow-on.

## Scope Boundaries

In scope:

- Deterministic C# intake and phased execution planning.
- Phase-output ownership with exactly one owner per required output.
- Unified execution recommendation for mixed C# requests.

Out of scope:

- Deep implementation of any one specialized phase.
- Non-C# product areas unless they materially constrain the C# slice.
- Generic project governance unrelated to the request objective.

## Inputs

- User objective and target C#/.NET surface.
- Scope boundaries, environments, and risk level.
- Required outputs, known evidence, and delivery constraints.
- Evaluation date in ISO format (`YYYY-MM-DD`) for source freshness checks.

## Required Outputs

- Intake contract with objective, boundaries, and required outputs.
- Phase-output ownership matrix.
- Unified C# execution recommendation.
- Rejected-candidate table with deterministic reason codes.
- Closure check stating whether all required outputs are owned.

## Capability Catalog

Use one or more phases based on request shape:

- Language and API Contract
- Async and Concurrency
- Architecture and Boundaries
- Validation and Data Integrity
- Data Access and Repository Safety
- Testing and Evidence
- Performance and Resilience
- Release and Governance Readiness
- Repository and model-contract decisions must stabilize in `Validation and Data Integrity` plus `Data Access and Repository Safety` before routing follow-on work to `Testing and Evidence`.

## Deterministic Workflow

1. Lock objective, risk boundary, target runtime, and required outputs.
2. Classify the request into one or more capability phases from the catalog.
3. Assign exactly one owner per required output.
3a. When repository/model guidance and test guidance both apply, complete repository/model contract outputs first, then hand off test-surface changes as a bounded follow-on.
4. Reject any phase plan with unowned or multiply owned outputs.
5. Define evidence expectations and handoff criteria between phases.
6. Produce one unified execution recommendation: narrow-execution, phased-execution, or stop-pending-blockers.
7. Publish closure status with residual risks and unresolved blockers.

## Phase-Output Ownership Matrix Template

| Required Output | Owning Phase | Evidence Expectation |
|---|---|---|
| Language feature and compatibility decision | Language and API Contract | TFM compatibility and feature adoption notes |
| Async behavior and cancellation decision | Async and Concurrency | Task model, cancellation, and exception behavior evidence |
| Layering and dependency boundary decision | Architecture and Boundaries | Boundary map and dependency direction checks |
| Input and model invariant decision | Validation and Data Integrity | Boundary validation and immutability evidence |
| Repository and SQL safety decision | Data Access and Repository Safety | Repository contract and parameterization notes |
| Test strategy and risk coverage decision (after repository/model contract stabilization) | Testing and Evidence | Unit, integration, and edge-case coverage matrix aligned to repository contract outputs |
| Performance and allocation decision | Performance and Resilience | Baselines, hotspots, and regression checks |
| Promotion and rollback decision | Release and Governance Readiness | Approval chain, rollback plan, and evidence bundle |

## Unified Decision Rules

- `narrow-execution`: one phase owns the meaningful work and adjacent phases are informational.
- `phased-execution`: two or more phases are required and ownership is unambiguous.
- `stop-pending-blockers`: required outputs are unowned, evidence is materially missing, or risk cannot be bounded.

## Rejected Candidate Reasons

- `R1`: Outside the C#/.NET slice.
- `R2`: Adds overlap without adding required-output coverage.
- `R3`: Expands scope beyond the bounded objective.
- `R4`: Requires evidence or environment access that is not available.
- `R5`: Better handled by a narrower single-phase workflow.

## Reference Assets

- Use [csharp-execution-contract-template.md](./references/csharp-execution-contract-template.md) when one C# request needs a reusable intake and ownership contract.

## Done Criteria

- Trigger conditions are satisfied.
- Required outputs are complete.
- Ownership matrix has no unowned or multiply owned outputs.
- Decision mode is explicit.
- Source catalog is current for this evaluation cycle.

## Workflow

1. Capture inputs and constraints.
2. Execute this skill's deterministic steps.
3. Publish outputs with status and next actions.

## Execution Context
### Input Context

- Request objective and scope boundary.
- Applicable constraints and required outputs.

### Process Context

- Follow this skill's deterministic workflow from intake to closure.
- Record ownership and decisions for required outputs.

### Output Context

- Deliverables with explicit completion status.
- Residual risks and next actions.
## References Assets

- [Reference assets](./references/README.md)
