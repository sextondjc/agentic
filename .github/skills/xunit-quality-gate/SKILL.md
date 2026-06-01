---
name: xunit-quality-gate
description: Use when xUnit assets need an expert, evidence-first quality decision with deterministic findings, ownership, and pass-or-fail recommendation.
---

# xUnit Quality Gate

## Specialization

Use this skill to evaluate xUnit test assets and xUnit-focused skill outputs with deterministic quality checks and one explicit recommendation.

This skill is specialized for review and sign-off decisions, not implementation.

## Objective

Produce one deterministic xUnit quality verdict with severity-ranked findings, remediation ownership, and release recommendation.

## Trigger Conditions

- xUnit test changes are merge-bound or promotion-bound.
- xUnit skill outputs need acceptance review.
- Test regressions escaped and quality controls need reinforcement.

## Scope Boundaries

In scope:

- xUnit design quality and behavior coverage adequacy.
- Fixture lifecycle safety and parallelization readiness.
- Async/cancellation test adequacy.
- Moq collaboration-test quality and brittleness risk.
- Analyzer-rule alignment and deterministic execution checks.

Out of scope:

- Product feature implementation.
- Non-test operational release tasks.
- Performance benchmarking outside test-quality scope.

## Inputs

- Target xUnit artifacts and behavior contracts.
- Existing defects, flaky-test history, and risk classification.
- Required quality threshold policy.
- Evaluation date in ISO format (`YYYY-MM-DD`) for source freshness checks.

## Required Outputs

- Findings table with severity, impact, owner, and remediation.
- Coverage-intent adequacy summary.
- Determinism verdict for flake and nondeterministic risk.
- Final recommendation: pass, pass-with-conditions, or fail.

## Deterministic Workflow

1. Validate behavior coverage intent across success, failure, and boundary conditions.
2. Validate fixture lifecycle and shared-context safety posture.
3. Validate async and cancellation assertion adequacy.
4. Validate mock collaboration boundaries and interaction-verification quality.
5. Validate analyzer-rule and deterministic execution compliance.
6. Rank findings and assign owner/remediation for each.
7. Publish one explicit recommendation with residual risks.

## Decision Rules

- `pass`: no unresolved critical or high findings.
- `pass-with-conditions`: only medium or low findings remain with owner and due date.
- `fail`: unresolved critical findings, or unresolved high findings in release-bound paths.

## Severity Model

- `critical`: direct risk of false confidence in release-bound behavior.
- `high`: material behavior risk or systemic flakiness under common conditions.
- `medium`: meaningful maintainability or coverage gaps with bounded risk.
- `low`: minor clarity or consistency issues with low immediate impact.

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
