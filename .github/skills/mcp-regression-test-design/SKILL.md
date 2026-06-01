---
name: mcp-regression-test-design
description: Use when MCP servers need deterministic non-regression test scenarios across tool, resource, prompt, and transport behavior.
---

# MCP Regression Test Design

## Specialization

Design deterministic regression suites that protect MCP behavior through schema, protocol, and transport changes.

## Trigger Conditions

- Contract or transport changes are introduced.
- Previous regressions need durable prevention.
- Release confidence is limited by weak behavior coverage.

## Hard Constraints

- Test design must align with official MCP behavior.
- Scenarios must include both happy-path and failure-path checks.

## Inputs

- Current and changed behavior surfaces.
- Known defect history.
- Target runtime environments.

## Required Outputs

- Regression scenario matrix.
- Execution order and gating policy.
- Coverage gaps and follow-up actions.

## Deterministic Workflow

1. Identify changed behavior surfaces.
2. Map risks to test scenarios.
3. Define expected outcomes and assertions.
4. Classify scenarios by severity impact.
5. Publish gate decisions and remaining gaps.

## Scenario Matrix Template

| Surface | Scenario | Assertion | Severity | Gate |
|---|---|---|---|---|
| Tool call | Invalid input | Structured error returned | High | Block |
| Resource read | Missing URI | Deterministic failure response | Medium | Warn |
| Prompt retrieval | Argument default handling | Stable prompt output contract | Medium | Block |
| Transport reconnect | Session interruption | Recovery behavior as specified | High | Block |

## Done Criteria

- Scenario matrix covers all changed surfaces.
- Severity and gate outcomes are explicit.
- Coverage gaps are documented with owners.

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
