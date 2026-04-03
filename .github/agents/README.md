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
| `learning-agent` | Planning | Execution | Decomposes learning goals into specialist topic maps, calibrates depth, and routes skill/customization generation work. |
| `plan-researcher` | Planning | Review | Produces research and executable plans before implementation starts. |
| `architecture-designer` | Planning | Review | Defines architecture boundaries and ADR decisions before build work. |
| `csharp-engineer` | Execution | Review | Implements .NET code, tests, and focused engineering artifacts. |
| `defect-debugger` | Execution | Review | Reproduces and fixes defects with verification output. |
| `sql-dba` | Execution | Review | Executes operational database work and schema changes. |
| `workspace-scaffolder` | Execution | Planning | Scaffolds project structures and workspace artifacts. |
| `powershell-reviewer` | Review | Execution | Evaluates PowerShell scripts for safety, automation readiness, and maintainability with corrective guidance. |
| `code-reviewer` | Review | Planning | Reviews completed work against plans and standards. |
| `security-researcher` | Review | Planning | Performs security assessment and report-first remediation guidance. |
| `performance-assessor` | Review | Planning | Performs performance assessment and evidence-backed recommendations. |
| `benchmark-researcher` | Review | Planning | Reviews performance behavior using BenchmarkDotNet methodology. |

## Governance Notes

- Primary lane governs default routing behavior.
- Secondary lane indicates where an agent can assist without owning the phase.
- Any lane conflict should be resolved by `orchestrator` with explicit phase split.




