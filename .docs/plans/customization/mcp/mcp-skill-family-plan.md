# MCP Skill Family Plan

## Plan Metadata

| Field | Value |
|---|---|
| Plan ID | PLAN-MCP-SKILL-FAMILY-2026-04-28 |
| Workstream ID | WS-MCP-SKILL-COMPENDIUM |
| Date | 2026-04-28 |
| Primary Lane | Planning |
| Secondary Lane | Execution |
| Intake Agent | orchestrator |

## Objective

Convert the MCP resources guidance into reusable, expert-level, discoverable, and orchestrated skill assets for cross-project compendium use.

## Scope Boundaries

### In Scope

- New skill assets for MCP server authoring and orchestration.
- Official-source-only reference catalogs inside each new skill.
- C# and TypeScript SDK guidance only.
- Skill discovery registration in the canonical index.

### Out of Scope

- Runtime code implementation in any SDK.
- Community aggregator sources.
- Coverage for non-C# and non-TypeScript MCP SDK stacks.

## Deterministic Intake Contract

| Field | Value |
|---|---|
| Required Output 1 | MCP skill family artifacts (SKILL.md + references) |
| Required Output 2 | Official source catalogs per skill |
| Required Output 3 | Skill discovery index updates |
| Required Output 4 | Completion summary with skills and agents used |

## Phase Ownership Matrix

| Required Output | Owning Phase | Owner |
|---|---|---|
| Skill family artifacts | Execution | skills-authoring workflow |
| Source catalogs | Execution | skills-authoring workflow |
| Index registration | Execution | skill catalog maintenance |
| Final disposition and evidence summary | Review | agent response pass |

## Candidate Capability Selection

| Candidate | Decision | Reason Code | Rationale |
|---|---|---|---|
| compose-skills | Selected | S1 | Required for orchestrated multi-skill structure |
| skills-authoring | Selected | S1 | Required for expert-level SKILL.md authoring |
| route-customization | Selected | S1 | Confirms skill (not agent/instruction) is correct artifact |
| sync-skills | Selected | S1 | Ensures source freshness and reusable maintenance pattern |
| write-technical-docs | Rejected | R1 | Request targets skill system, not general doc generation |
| agent-authoring | Rejected | R2 | No new specialist agent requested |

## Acceptance Checklist

- Skills are reusable across projects and not repo-specific.
- Skill content is explicit, deterministic, and expert-level.
- Discovery index contains new entries with lane rationale.
- References include only official MCP sources.
- SDK guidance is limited to C# and TypeScript.
- Final summary includes a grid of skills and custom agents used.

## Phase 2 Expansion (All 8 Additional Skills)

### Implementation Scope

- `mcp-source-curation`
- `mcp-sdk-selection-csharp-typescript`
- `mcp-contract-versioning`
- `mcp-transport-architecture`
- `mcp-inspector-ci-observability`
- `mcp-authn-authz-hardening`
- `mcp-regression-test-design`
- `mcp-release-readiness-gate`

### Additional Required Outputs

- Each skill includes a `references/source-catalog.md` artifact.
- Skill discovery index includes all eight entries.
- Change trace includes all new files and compliance confirmation.
