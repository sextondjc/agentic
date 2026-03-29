<!-- markdownlint-disable-file -->
# Agent and Skill Routing Guide

## Purpose

This document defines the intended routing model for the workspace so planning, implementation, architecture, debugging, and DBA work stay separated.

Default entry point: `orchestrator`

Use the orchestrator when the request is ambiguous, multi-phase, or could reasonably be routed to more than one specialist.

## Agents

### `orchestrator`

Use for:
- Mixed or ambiguous requests
- Multi-phase work spanning planning, architecture, implementation, or debugging
- Requests where role separation matters

Do not use for:
- Specialist domain execution when the lane is already obvious

### `planning-research`

Use for:
- Research
- Option analysis
- Implementation plans
- Plan audits and refinements

Outputs:
- `.docs/research/*`
- `.docs/plans/*`
- `.docs/changes/*` when implementation tracking is explicitly part of the workflow

Do not use for:
- Writing production code unless the user explicitly switches from planning to implementation

### `security-researcher`

Use for:
- .NET and C# security assessment
- Vulnerability identification
- Remediation reporting without implementation
- Risk documentation with evidence and handoff guidance

Outputs:
- `.docs/research/security/<solution-or-project-or-namespace>-security-research-report-<yyyyMMdd>.md`

Do not use for:
- Implementing fixes
- General feature development
- Architecture changes beyond recommendation and handoff

### `performance-researcher`

Use for:
- .NET and C# performance assessment
- Bottleneck identification
- Optimization reporting without implementation
- Evidence-backed performance handoff guidance

Outputs:
- `.docs/research/performance/<solution-or-project-or-namespace>-performance-research-report-<yyyyMMdd>.md`

Do not use for:
- Implementing fixes
- General feature development
- Speculative tuning without evidence

### `csharp-engineer`

Use for:
- .NET implementation
- Refactoring
- Test updates
- Focused engineering changes

Do not use for:
- Broad planning-only work
- Architecture-only decision work when no implementation is requested

### `architecture`

Use for:
- DDD guidance
- Boundary decisions
- Aggregate design
- ADR direction
- Architecture trade-offs

Outputs:
- `.docs/adr/*` for architectural decisions

Do not use for:
- General feature implementation
- Bug fixing unless the issue is primarily architectural

### `debug`

Use for:
- Reproducing defects
- Root cause analysis
- Minimal bug fixes
- Regression verification

Do not use for:
- High-level planning when no defect is involved

### `sql-dba`

Use for:
- SQL Server administration
- Query execution against live or connected databases
- Schema inspection
- Operational performance and security work

Do not use for:
- General application coding
- Syrx repository implementation in source code

## Skills

### `syrx-data-access`

Use for:
- Syrx repositories
- `CommandStrings`
- `ICommander<TRepository>` usage
- Installer wiring
- Explicit SQL patterns

Typical companion:
- `csharp-engineer`

### `task-research`

Use for:
- Deep evidence gathering
- Internal and external research before planning or implementation

Typical companion:
- `planning-research`

### `critical-thinking`

Use for:
- Challenging assumptions
- Clarifying constraints
- Pressure-testing a design or plan

Typical companion:
- `planning-research`
- `architecture`

### `security-research`

Use for:
- Reusable research-only .NET/C# security review workflow
- Standardized security report generation
- Evidence-backed remediation documentation without implementation

Typical companion:
- `security-researcher`
- `orchestrator`

### `performance-research`

Use for:
- Reusable research-only .NET/C# performance review workflow
- Standardized performance report generation
- Evidence-backed bottleneck documentation without implementation

Typical companion:
- `performance-researcher`
- `orchestrator`

### `api-design`

Use for:
- External API integration design
- Resilience patterns
- DTO and client boundary design

Typical companion:
- `csharp-engineer`
- `planning-research`

### `adr-generator`

Use for:
- Writing ADRs after an architectural decision is made

Typical companion:
- `architecture`

### `dotnet-modernization`

Use for:
- Cleanup
- Warning reduction
- async corrections
- targeted modernization without broad rewrites

Typical companion:
- `csharp-engineer`

### `prd-generator`

Use for:
- PRDs
- requirement documents
- user stories and acceptance criteria

Do not use for:
- Engineering implementation

## Routing Rules

### Planning vs implementation

- If the user asks to analyze, compare, explore, or plan, start with `planning-research`.
- If the user asks for a vulnerability assessment and wants a report rather than code changes, use `security-researcher`.
- If the user asks for a performance assessment and wants a report rather than code changes, use `performance-researcher`.
- If the user asks to modify code, implement features, or refactor, use `csharp-engineer`.
- Do not let planning silently become implementation.

### Research-only assessments

- Route security and performance investigations through `orchestrator` when scope is mixed, ambiguous, or likely to require follow-on implementation.
- Security reports default to `.docs/research/security/` and performance reports default to `.docs/research/performance/` unless the user explicitly overrides the location.
- These researcher agents may use their matching reusable skills and other existing skills, but they must not implement remediations.

### Architecture vs implementation

- If the main question is about boundaries, aggregates, DDD, or ADRs, use `architecture` first.
- If code changes follow, treat implementation as a separate phase.

### Debugging vs feature work

- If the task is to find or fix a defect, use `debug`.
- If broader refactoring is required after the defect is understood, explicitly hand off to `csharp-engineer`.

### DBA vs application work

- Use `sql-dba` for live database work.
- Use `csharp-engineer` plus `syrx-data-access` for repository and application-side SQL work.

## Canonical Workspace Standards

- Syrx only for .NET data access
- Latest stable C# supported by target framework
- xUnit and Moq only for tests
- FluentAssertions is banned
- Canonical docs locations:
  - `.docs/plans`
  - `.docs/research`
  - `.docs/changes`
  - `.docs/adr`

## Quick Examples

### Example 1

Request: "Research options for introducing a new payments module and give me a plan."

Route:
1. `orchestrator`
2. `planning-research`
3. Optional `critical-thinking` if trade-offs need pressure-testing

### Example 2

Request: "Review this .NET service for security issues and give me a remediation report."

Route:
1. `orchestrator`
2. `security-researcher`
3. `security-research` skill
4. Optional `critical-thinking`, `api-design`, or `syrx-data-access` skills

### Example 3

Request: "Find the likely performance bottlenecks in this C# worker and write them up."

Route:
1. `orchestrator`
2. `performance-researcher`
3. `performance-research` skill
4. Optional `task-research`, `dotnet-modernization`, or `syrx-data-access` skills

### Example 4

Request: "Implement a Syrx repository for customer lookups."

Route:
1. `orchestrator`
2. `csharp-engineer`
3. `syrx-data-access` skill

### Example 5

Request: "Create an ADR for how we split order and payment aggregates."

Route:
1. `orchestrator`
2. `architecture`
3. `adr-generator` skill

### Example 6

Request: "Find out why this test started failing after the last change."

Route:
1. `orchestrator`
2. `debug`

### Example 7

Request: "Show me the largest tables and missing indexes in SQL Server."

Route:
1. `orchestrator`
2. `sql-dba`