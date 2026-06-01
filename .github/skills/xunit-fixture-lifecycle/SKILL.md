---
name: xunit-fixture-lifecycle
description: Use when xUnit fixture scope, shared context, lifecycle cleanup, and parallelization boundaries must be designed for deterministic and fast tests.
---

# xUnit Fixture Lifecycle

## Specialization

Use this skill to choose the correct xUnit context-sharing strategy and lifecycle cleanup model while preserving determinism and test isolation.

This skill is specialized for fixture architecture and lifecycle safety.

## Objective

Produce a deterministic fixture-lifecycle design that maps each context need to constructor scope, class fixture, collection fixture, or assembly fixture with explicit cleanup and concurrency posture.

## Trigger Conditions

- Test setup is expensive and needs controlled sharing.
- Fixtures are causing flakiness, leakage, or parallel contention.
- Teams need consistent fixture-scope rules across projects.

## Scope Boundaries

In scope:

- Constructor-per-test context setup.
- Class, collection, and assembly fixture decisions.
- Sync and async startup/cleanup choices.
- Parallelization safety and isolation constraints.

Out of scope:

- Database schema design or infrastructure provisioning.
- Application-level runtime tuning.
- Non-xUnit fixture models.

## Inputs

- Setup cost profile and desired sharing scope.
- Resource mutability and thread-safety properties.
- Cleanup requirements and failure-handling expectations.
- Evaluation date in ISO format (`YYYY-MM-DD`) for source freshness checks.

## Required Outputs

- Fixture-scope decision matrix.
- Lifecycle contract for startup and cleanup.
- Parallelization risk table with mitigations.
- Final fixture recommendation with residual risks.

## Deterministic Workflow

1. Classify each setup resource by cost, mutability, and sharing tolerance.
2. Choose scope: constructor-per-test, class, collection, or assembly fixture.
3. Define startup and cleanup lifecycle contract for each chosen scope.
4. Evaluate parallel execution impact and isolation boundaries.
5. Add mitigation controls for shared mutable resources.
6. Publish a fixture recommendation with blocker and risk notes.

## Fixture Selection Rules

- Use constructor scope when isolation is required and setup cost is acceptable.
- Use class fixture when one expensive context can be safely shared by one class.
- Use collection fixture when several classes must share one context.
- Use assembly fixture only when global sharing is safe under concurrent execution.

## Lifecycle Rules

- Use `IDisposable` for synchronous cleanup.
- Use `IAsyncLifetime` when async startup and async cleanup are required.
- Use `IAsyncDisposable` in xUnit v3 when only async cleanup is required.

## Done Criteria

- Trigger conditions are satisfied.
- Required outputs are complete.
- Scope and lifecycle choices are explicit.
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
