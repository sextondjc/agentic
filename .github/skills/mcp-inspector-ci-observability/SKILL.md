---
name: mcp-inspector-ci-observability
description: Use when MCP server validation evidence must be captured consistently through Inspector UI/CLI workflows and CI-ready artifacts.
---

# MCP Inspector CI Observability

## Specialization

Standardize Inspector-driven validation and CI evidence collection for MCP server changes.

## Trigger Conditions

- CI validation for MCP behavior is missing or inconsistent.
- Inspector checks are manual and not durable.
- Release gates need repeatable evidence artifacts.

## Hard Constraints

- Use official Inspector tooling and documentation.
- Capture evidence in durable, reviewable artifacts.

## Inputs

- Candidate server endpoint or launch command.
- Required validation scenarios.
- CI environment constraints.

## Required Outputs

- Validation scenario list.
- Inspector command set.
- Evidence artifact set with pass/fail status.

## Deterministic Workflow

1. Define required MCP behaviors to validate.
2. Map behaviors to inspector methods.
3. Execute scenario suite using UI or CLI.
4. Record outputs and classify failures.
5. Publish CI-ready evidence summary.

## Scenario Matrix Template

| Behavior | Inspector Method | Expected Result | Evidence Artifact |
|---|---|---|---|
| tools/list | `tools/list` | Tools visible | <artifact> |
| tools/call | `tools/call` | Contract-valid output | <artifact> |
| resources/list | `resources/list` | Resource set available | <artifact> |
| prompts/list | `prompts/list` | Prompt set available | <artifact> |

## Done Criteria

- Scenario matrix complete.
- Evidence artifacts captured and linked.
- CI status is explicit with unresolved failures listed.

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
