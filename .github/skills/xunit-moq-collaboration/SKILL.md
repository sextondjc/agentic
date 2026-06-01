---
name: xunit-moq-collaboration
description: Use when xUnit tests need expert-level Moq usage boundaries, interaction verification strategy, and collaboration-focused test doubles.
---

# xUnit Moq Collaboration

## Specialization

Use this skill to design mock boundaries and interaction assertions that keep xUnit tests behavior-focused and resistant to brittle implementation coupling.

This skill is specialized for xUnit + Moq collaboration testing patterns.

## Objective

Produce a deterministic collaboration-testing design that defines where mocks are required, how interactions are verified, and when state assertions are preferred.

## Trigger Conditions

- Tests depend on collaborator behavior and side effects.
- Existing mocks are over-specified or noisy.
- Teams need consistent Moq usage boundaries across projects.

## Scope Boundaries

In scope:

- Mock seam selection.
- Interaction vs state assertion decisions.
- Verify posture (`Times`, strictness, and call intent).
- Test-double anti-pattern checks.

Out of scope:

- Product dependency injection architecture redesign.
- Mocking framework migration execution.
- Integration tests with real infrastructure.

## Inputs

- Target behavior and collaboration contract.
- External side effects and idempotency expectations.
- Known brittle tests and false-positive patterns.
- Evaluation date in ISO format (`YYYY-MM-DD`) for source freshness checks.

## Required Outputs

- Collaboration seam map.
- Verification strategy matrix (state vs interaction).
- Mock strictness and setup policy.
- Anti-pattern findings with mitigations.
- Final recommendation with residual risks.

## Deterministic Workflow

1. Identify collaborator seams and classify each by behavior criticality.
2. Decide state assertion or interaction verification per seam.
3. Define minimal mock setup required to express test intent.
4. Set verification strictness and call cardinality expectations.
5. Detect brittle coupling anti-patterns and mitigation actions.
6. Publish one collaboration-testing recommendation.

## Decision Rules

- Prefer state assertions when observable outputs are sufficient.
- Use interaction verification only when collaborator calls are part of the behavior contract.
- Keep mock setup minimal and explicit for the scenario under test.
- Avoid verifying incidental calls that are not behavior-critical.

## Anti-Pattern Checks

- Verifying every collaborator call by default.
- Deep mock chains that mirror implementation structure.
- Reusing mutable mock state across unrelated tests.
- Assertions that pass despite broken behavior due to permissive setups.

## Done Criteria

- Trigger conditions are satisfied.
- Required outputs are complete.
- Verification decisions are explicit.
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
