---
name: csharp-testing-quality-gate
description: Use when C# changes need an expert, evidence-first testing quality decision with deterministic coverage, failure-mode, and contract-verification checks before merge or promotion.
---

# C# Testing Quality Gate

## Specialization

Use this skill to evaluate the adequacy of C# test strategy and implementation with deterministic checks for coverage intent, failure-mode handling, async behavior, and contract verification.

This skill is specialized for testing-quality decisions and does not implement product features.

## Objective

Produce one deterministic testing-quality recommendation with severity-ranked findings and explicit remediation ownership.

## Trigger Conditions

- A C# change is release-bound and needs test-quality sign-off.
- A review flags insufficient test coverage or brittle test design.
- A defect escaped due to missing or weak tests.

## Scope Boundaries

In scope:

- Unit and integration test strategy quality.
- Failure-path, boundary, and edge-case coverage checks.
- Async behavior and cancellation test adequacy checks.
- Assertion quality and deterministic test reliability checks.

Out of scope:

- End-to-end performance benchmarking.
- Product feature implementation.
- Infrastructure deployment execution.

## Inputs

- Target modules and expected behavior contracts.
- Existing test suites and known defect history.
- Test threshold policy.
- Evaluation date in ISO format (`YYYY-MM-DD`) for source freshness checks.

## Required Outputs

- Coverage-intent matrix by behavior and risk.
- Findings table with severity, impact, and remediation.
- Test-reliability verdict for determinism and flakiness risk.
- Final recommendation: pass, pass-with-conditions, or fail.

## Deterministic Workflow

1. Map critical behavior contracts and failure modes for the target slice.
2. Verify tests exist for success, failure, and boundary behavior.
3. Verify async and cancellation behavior has explicit assertions where applicable.
4. Evaluate assertion quality, isolation strategy, and fixture determinism.
5. Identify missing or weak tests and rank findings by severity.
6. Publish one explicit recommendation with residual risks and remediation ownership.

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
