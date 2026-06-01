---
name: mcp-release-readiness-gate
description: Use when an MCP server promotion needs evidence-backed go/no-go decisioning with rollback, approvals, and release-note completeness.
---

# MCP Release Readiness Gate

## Specialization

Provide a release promotion decision for MCP server changes using explicit evidence, approval chain, and rollback readiness checks.

## Trigger Conditions

- An MCP server change is scheduled for promotion.
- Risk profile requires explicit release governance.
- Promotion depends on coordinated validation evidence.

## Hard Constraints

- Promotion decisions require named evidence bundles.
- Approval chain and rollback owner must be explicit.
- Scope must remain official-source and C#/TypeScript bounded.

## Inputs

- Release scope and target environment.
- Validation evidence bundle.
- Approval chain and security sign-off status.

## Required Outputs

- Go, no-go, or go-with-conditions decision.
- Release checklist disposition.
- Rollback readiness and owner record.

## Deterministic Workflow

1. Validate evidence bundle completeness.
2. Confirm approval chain entries.
3. Verify rollback procedure and ownership.
4. Confirm release notes completeness.
5. Publish disposition and required remediations.

## Gate Checklist Template

| Gate | Status | Evidence | Owner |
|---|---|---|---|
| Smoke and quality evidence | Pass or Fail | <artifact> | <owner> |
| Security sign-off | Pass or Fail | <artifact> | <owner> |
| Rollback readiness | Pass or Fail | <artifact> | <owner> |
| Release notes completeness | Pass or Fail | <artifact> | <owner> |

## Done Criteria

- Gate checklist is complete.
- Promotion disposition is explicit.
- Blocking remediations are assigned.

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
