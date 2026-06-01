---
name: csharp-architecture-quality-gate
description: Use when C# architectural integrity needs an expert, evidence-first quality decision across boundaries, repository safety, and validation discipline.
---

# C# Architecture Quality Gate

## Specialization

Use this skill to assess C# architectural integrity with deterministic checks for layering, dependency direction, repository boundaries, validation discipline, and testability.

This skill is specialized for architecture-quality findings and does not implement product features.

## Objective

Produce one deterministic architecture-quality recommendation with severity-ranked findings and explicit remediation ownership.

## Trigger Conditions

- A change modifies boundaries between domain, application, and infrastructure concerns.
- A review flags coupling, repository, or validation discipline risks.
- A release-bound C# slice needs architectural sign-off.

## Scope Boundaries

In scope:

- Boundary and dependency-direction checks.
- Repository contract and data-access safety checks.
- Validation-at-boundary and immutability checks.
- Testability and isolation checks.

Out of scope:

- End-to-end product implementation.
- DBA operations and live infrastructure changes.
- Non-C# architecture domains not material to the request.

## Inputs

- Target modules and dependency graph context.
- Repository and validation standards for the workspace.
- Required release constraints.
- Evaluation date in ISO format (`YYYY-MM-DD`) for source freshness checks.

## Required Outputs

- Boundary findings matrix with severity and impact.
- Repository safety and validation-discipline verdict.
- Testability-risk summary.
- Final recommendation: pass, pass-with-conditions, or fail.

## Deterministic Workflow

1. Map the architectural slice and dependency direction.
2. Verify that boundary responsibilities are explicit and non-overlapping.
3. Validate repository contracts and parameterized data-access safety assumptions.
4. Verify that boundary input validation and immutable model expectations are enforced.
5. Evaluate testability and substitution feasibility at key seams.
6. Rank findings and publish one explicit recommendation.

## Decision Rules

- `pass`: no unresolved critical or high findings.
- `pass-with-conditions`: only medium or low findings remain with owner and due date.
- `fail`: unresolved critical findings, or high findings in core boundaries.

## Done Criteria

- Trigger conditions are satisfied.
- Required outputs are complete.
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
