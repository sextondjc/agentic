---
name: csharp-data-access-quality-gate
description: Use when C# data-access changes need an expert, evidence-first quality decision across repository boundaries, parameterized SQL safety, and immutable contract discipline before merge or promotion.
---

# C# Data Access Quality Gate

## Specialization

Use this skill to assess C# data-access quality with deterministic checks for repository boundaries, explicit parameterization, immutable contracts, and validation discipline.

This skill is specialized for data-access quality findings and does not implement product features.

## Objective

Produce one deterministic data-access quality recommendation with severity-ranked findings and remediation ownership.

## Trigger Conditions

- A change modifies repository contracts or SQL execution behavior.
- A review flags data-access safety, layering, or validation risks.
- A release-bound C# slice needs explicit data-access sign-off.

## Scope Boundaries

In scope:

- Repository interface and implementation boundary checks.
- Parameterized SQL safety and injection-risk prevention checks.
- Immutable data contract and boundary validation checks.
- Error handling and observability checks for data-access operations.

Out of scope:

- Schema administration or live DBA operations.
- End-to-end feature implementation.
- Non-C# data stack governance unrelated to the request.

## Inputs

- Target repositories, SQL statements, and model contracts.
- Workspace data-access and validation standards.
- Release constraints and risk policy.
- Evaluation date in ISO format (`YYYY-MM-DD`) for source freshness checks.

## Required Outputs

- Data-access findings matrix with severity and impact.
- Repository-boundary and SQL-safety verdict.
- Contract immutability and validation-discipline verdict.
- Final recommendation: pass, pass-with-conditions, or fail.

## Deterministic Workflow

1. Map repository seams and dependency direction for the target slice.
2. Verify SQL execution is explicit and parameterized.
3. Verify repository contracts preserve immutability and validation-at-boundary expectations.
4. Verify error-handling paths provide safe failures and actionable diagnostics.
5. Rank findings by severity and map each finding to one remediation owner.
6. Publish one explicit recommendation with residual risks.

## Decision Rules

- `pass`: no unresolved critical or high findings.
- `pass-with-conditions`: only medium or low findings remain with owner and due date.
- `fail`: unresolved critical findings, or unresolved high findings in production paths.

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
