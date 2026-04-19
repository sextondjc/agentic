# Agents Lifecycle Catalog

This catalog assigns each agent to a primary lifecycle lane.

## Lanes

- Planning: Analyze intent, discover constraints, and produce durable plans.
- Execution: Produce implementation artifacts (code, docs, configuration, scripts).
- Review: Evaluate outputs, identify risks, and provide remediation guidance.

## Agent Mapping

| Agent | Primary Lane | Secondary Lane | Rationale |
|---|---|---|---|
| `orchestrator` | Planning | Review | Classifies intent, decomposes phases, and routes work across lanes. |
| `topic-learner` | Planning | Execution | Decomposes learning goals into specialist topic maps, calibrates depth, and routes skill/customization generation work. |
| `plan-researcher` | Planning | Review | Produces research and executable plans before implementation starts. |
| `architecture-designer` | Planning | Review | Defines architecture boundaries and ADR decisions before build work. |
| `csharp-engineer` | Execution | Review | Implements .NET code, tests, and focused engineering artifacts. |
| `defect-debugger` | Execution | Review | Reproduces and fixes defects with verification output. |
| `sql-dba` | Execution | Review | Executes operational database work and schema changes. |
| `workspace-scaffolder` | Execution | Planning | Scaffolds project structures and workspace artifacts. |
| `powershell-reviewer` | Review | Execution | Evaluates PowerShell scripts for safety, automation readiness, and maintainability with corrective guidance. |
| `governance-briefer` | Review | Planning | Produces one-page governance briefings by aggregating salient evidence, risks, and actions from existing artifacts. |
| `manual-code-reviewer` | Review | Execution | Captures manual review findings into structured, session-scoped review artifacts without evaluating or fixing them. |
| `code-reviewer` | Review | Planning | Reviews completed work against plans and standards. |
| `security-researcher` | Review | Planning | Performs security assessment and report-first remediation guidance. |
| `performance-assessor` | Review | Planning | Performs performance assessment and evidence-backed recommendations. |
| `benchmark-researcher` | Review | Planning | Reviews performance behavior using BenchmarkDotNet methodology. |
| `ux-designer` | Planning | Execution | UX research, wireframe design, prototype definition, usability validation, and engineering handoff across web and mobile surfaces. Does not write production code. |
| `web-frontend-engineer` | Execution | Review | Implements and reviews web frontend code: HTML, CSS, TypeScript, components, accessibility, Core Web Vitals, and frontend security. |
| `mobile-frontend-engineer` | Execution | Review | Cross-platform mobile frontend engineering using MAUI or React Native: architecture, navigation, data, security, testing, and release readiness. |

## Governance Notes

- Primary lane governs default routing behavior.
- Secondary lane indicates where an agent can assist without owning the phase.
- All requests route through `orchestrator` first for intake and handoff, including single-lane work.
- Any lane conflict should be resolved by `orchestrator` with explicit phase split.
- Routing is deterministic by default with explicit intake fields and required outputs before specialist execution.
- Bounded exploration is permitted only as a rare exception with explicit hypothesis, boundary, time-box, success criteria, and closure decision.
- PDL coverage map: agent routing context is informed by the Phase / Discipline / Lane matrix at [phase-discipline-lane-agentic-delivery-matrix.md](../.docs/plans/governance/taxonomy-tag-registry/phase-discipline-lane-agentic-delivery-matrix.md). Bundle codes X01–X12 identify which agents are included in each coverage cluster.
