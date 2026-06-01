---
name: mcp-source-curation
description: Use when MCP guidance must be curated from official sources into reusable, agent-usable contracts with freshness and drift controls.
---

# MCP Source Curation

## Specialization

Curate authoritative MCP guidance into deterministic, reusable skill inputs while enforcing official-source-only policy.

## Trigger Conditions

- A new MCP skill or policy needs source grounding.
- Existing MCP skill references may be stale or conflicting.
- A release decision requires refreshed source evidence.

## Hard Constraints

- Sources must be official MCP documentation, specification, or official SDK/tool repositories.
- SDK scope is limited to C# and TypeScript.
- Community aggregators are excluded.

## Inputs

- Target MCP domain.
- Evaluation date (`YYYY-MM-DD`).
- Freshness threshold in days.

## Required Outputs

- Curated source table with status and freshness.
- Extraction rules mapped to concrete outcomes.
- Drift list with remediation actions.

## Deterministic Workflow

1. Enumerate candidate official sources.
2. Classify each source by domain coverage.
3. Evaluate freshness and authority.
4. Extract only testable rules.
5. Produce a source contract for downstream skills.

## Source Contract Template

| Source | Coverage | Last Evaluated | Status | Extraction Rule |
|---|---|---|---|---|
| <url> | <domain> | <date> | Current or Needs Review | <testable rule> |

## Done Criteria

- Source table is complete.
- All in-use sources are official and freshness-checked.
- Drift actions are explicit and owned.

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
