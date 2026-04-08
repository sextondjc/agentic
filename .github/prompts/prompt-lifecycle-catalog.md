# Prompts Lifecycle Catalog

This folder contains reusable `.prompt.md` templates for repeatable governance and delivery workflows. This catalog assigns each prompt to a primary lifecycle lane and shows the corresponding file in this folder.

## Prompt Mapping

| Prompt File | File | Primary Lane | Secondary Lane | Rationale |
|---|---|---|---|---|
| `workspace-scaffolder` | `workspace-scaffolder.prompt.md` | Execution | Planning | Produces workspace scaffolding and concrete setup artifacts. |
| `write-component-docs` | `write-component-docs.prompt.md` | Execution | Review | Produces technical component documentation artifacts. |
| `curate-copilot` | `curate-copilot.prompt.md` | Execution | Planning | Discovers imported customizations and updates copilot-instructions.md to reflect available agents, skills, and instructions. |
| `generate-readme` | `generate-readme.prompt.md` | Execution | Review | Produces consolidated repository README output. |
| `syrx-validation` | `syrx-validation.prompt.md` | Execution | Review | Generates implementation-ready validation patterns and examples. |
| `testing-xunit` | `testing-xunit.prompt.md` | Execution | Review | Produces test artifacts aligned with xUnit standards. |
| `review-technical-docs` | `review-technical-docs.prompt.md` | Review | Execution | Evaluates and remediates technical docs quality and completeness. |
| `execute-manual-review` | `execute-manual-review.prompt.md` | Execution | Review | Applies previously recorded manual review findings and validates the resulting remediation work. |
| `project-checkpoint` | `project-checkpoint.prompt.md` | Review | Execution | Verifies plan alignment, artifact hygiene, and scope integrity before a new execution wave begins. |
| `resume-execution` | `resume-execution.prompt.md` | Execution | Review | Resumes an active execution slice with traceability-first status and routing checks. |
| `skill-audit` | `skill-audit.prompt.md` | Review | Planning | Audits workspace skills against quality standards. |
| `instructions-audit` | `instructions-audit.prompt.md` | Review | Planning | Runs a deep, report-only audit of instruction files for duplication, conflicts, and boundary alignment with agents and skills. |
| `governance-cadence` | `governance-cadence.prompt.md` | Review | Planning | Runs a monthly governance health check across all assets and catalogs and produces a ranked remediation report. |
| `condense` | `condense.prompt.md` | Review | Execution | Invokes skills-authoring plus agent-authoring/instructions-authoring concision mode for one named artifact or a full artifact set and returns concise rewrite recommendations without applying edits. |
| `librarian` | `librarian.prompt.md` | Execution | Review | Curates documentation corpus naming and structure with `.docs/` as default root and produces approval-gated recommendations. |
| `security-research` | `security-research.prompt.md` | Review | Planning | Produces security assessment output without implementation. |
| `performance-research` | `performance-research.prompt.md` | Review | Planning | Produces performance assessment output without implementation. |

## Governance Notes

- Prompts should be selected using the lane first, then domain fit.
- The `Prompt` column is the canonical prompt identifier used by workspace integrity checks.
- The `File` column should match the actual `.prompt.md` files in this folder.
- Mixed-lane requests should be split into distinct prompt runs per lane.
