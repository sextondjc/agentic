# Prompts Lifecycle Catalog

This catalog assigns each prompt to a primary lifecycle lane.

## Prompt Mapping

| Prompt | Primary Lane | Secondary Lane | Rationale |
|---|---|---|---|
| `project-setup` | Execution | Planning | Produces workspace scaffolding and concrete setup artifacts. |
| `write-component-docs` | Execution | Review | Produces technical component documentation artifacts. |
| `curate-copilot` | Execution | Planning | Discovers imported customizations and updates copilot-instructions.md to reflect available agents, skills, and instructions. |
| `generate-readme` | Execution | Review | Produces consolidated repository README output. |
| `syrx-validation` | Execution | Review | Generates implementation-ready validation patterns and examples. |
| `testing-xunit` | Execution | Review | Produces test artifacts aligned with xUnit standards. |
| `review-technical-docs` | Review | Execution | Evaluates and remediates technical docs quality and completeness. |
| `skill-audit` | Review | Planning | Audits workspace skills against quality standards. |
| `instructions-audit` | Review | Planning | Runs a deep, report-only audit of instruction files for duplication, conflicts, and boundary alignment with agents and skills. |
| `security-research` | Review | Planning | Produces security assessment output without implementation. |
| `performance-research` | Review | Planning | Produces performance assessment output without implementation. |

## Governance Notes

- Prompts should be selected using the lane first, then domain fit.
- Mixed-lane requests should be split into distinct prompt runs per lane.