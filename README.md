# Lean .NET Agentic Templates

This workspace is a governance-first compendium of reusable customizations and skills for agent-assisted .NET delivery. It centralizes instructions, skills, prompts, and specialist agents so planning, implementation, and review remain traceable and consistent.

## Repository Scope (Authoritative)

This repository is customization-only.

- It is not an application or solution host.
- It must not contain product C# projects (`*.csproj`) under normal operation.
- Build/runtime assets such as `.editorconfig` and `Directory.Build.targets` are maintained as reusable skill reference/template artifacts and are intended to be applied to external target repositories.

## Workspace At A Glance

| Area | Purpose | Primary Lane |
|---|---|---|
| `.github/instructions` | Always-on engineering and policy guardrails applied by file pattern. | Planning + Execution + Review |
| `.github/skills` | Reusable workflows for focused tasks (planning, execution, audits, docs). | Mixed (per skill) |
| `.github/agents` | Specialist agent definitions for routing complex requests. | Mixed (per agent) |
| `.github/prompts` | Lightweight task prompts for repeatable interactions. | Mixed (per prompt) |
| `.docs/plans` | Implementation plans and planning artifacts. | Planning |
| `.docs/changes` | Progressive implementation traceability and release deltas. | Execution |
| `.docs/adr` | Architecture decision records with rationale and consequences. | Planning + Review |

## Directory Map

| Path | What You Keep Here |
|---|---|
| [copilot-instructions.md](./.github/copilot-instructions.md) | Canonical workspace operating model, preferred agents, and preferred skills. |
| [instruction-lifecycle-catalog.md](./.github/instructions/instruction-lifecycle-catalog.md) | Lane catalog for instruction files and governance mapping. |
| [skill-discovery-index.md](./.github/skills/skill-discovery-index.md) | Skill discovery index with lane assignments and usage guidance. |
| [agent-routing-guide.md](./.docs/agent-routing-guide.md) | Routing guidance for choosing the right agent/skill path. |

## Lifecycle Routing

Use this matrix to select the correct execution route.

| Situation | Preferred Route | Output Expectation |
|---|---|---|
| No approved plan exists | `writing-plans` skill | A traceable plan with scoped tasks and IDs. |
| Approved plan, same-session implementation | `task-execution` skill | Implemented artifacts with ongoing `.docs/changes` updates. |
| Approved plan, separate/dedicated execution session | `execute-plans` skill | Checkpointed progress and explicit handoff continuity. |
| Multi-phase or ambiguous request | `orchestrator` agent | Phase-split assignment to the correct specialist. |

## Quick Start

1. Review [copilot-instructions.md](./.github/copilot-instructions.md).
2. Pick a route using [agent-routing-guide.md](./.docs/agent-routing-guide.md).
3. If no plan exists, create one under `.docs/plans` before code changes.
4. Execute with the appropriate skill/agent and update `.docs/changes` progressively.
5. Run a review pass (`code-reviewer`, `security-researcher`, or `performance-assessor` as needed).

## Workspace Contract

### Requirements

| ID | Requirement |
|---|---|
| REQ-001 | All implementation work must follow active instruction files in `.github/instructions`. |
| REQ-002 | New or renamed customization assets must update the relevant catalog/index file in the same change. |
| REQ-003 | Execution work must link to an originating plan and record deviations in `.docs/changes`. |
| REQ-004 | Repository data access in .NET implementations must follow Syrx repository constraints. |

### Security Controls

| ID | Control |
|---|---|
| SEC-001 | Never hardcode secrets, tokens, or connection strings. |
| SEC-002 | Validate external inputs at boundaries and fail fast on invalid values. |
| SEC-003 | Use parameterized SQL only; no interpolated SQL from user input. |
| SEC-004 | Redact sensitive values from logs and user-facing errors. |

### Constraints

| ID | Constraint |
|---|---|
| CON-001 | C# data access uses Syrx repositories only; do not introduce EF Core. |
| CON-002 | Tests use xUnit and Moq; FluentAssertions is prohibited. |
| CON-003 | Lifecycle lanes are limited to Planning, Execution, and Review. |
| CON-004 | This repository is customization-only and does not host product C# projects. |

### Acceptance Criteria

| ID | Acceptance Criterion |
|---|---|
| AC-001 | A newcomer can identify the correct route for a task in under 5 minutes using this README and routing docs. |
| AC-002 | Teams can locate policy, skill, and agent catalogs directly from this README. |
| AC-003 | Governance requirements and security defaults are explicit and machine-readable by ID. |

## Contributing

1. Keep changes lane-consistent (Planning, Execution, Review).
2. Update related catalog files when adding/removing/renaming instructions, skills, prompts, or agents.
3. Keep documentation concise, explicit, and table-first where practical.
4. Preserve secure defaults and least-privilege patterns.

## Related Indexes

- [instruction-lifecycle-catalog.md](./.github/instructions/instruction-lifecycle-catalog.md)
- [skill-discovery-index.md](./.github/skills/skill-discovery-index.md)
- [agent-lifecycle-catalog.md](./.github/agents/agent-lifecycle-catalog.md)
- [prompt-lifecycle-catalog.md](./.github/prompts/prompt-lifecycle-catalog.md)


