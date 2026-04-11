# Prompts Lifecycle Catalog

This folder contains reusable `.prompt.md` templates for repeatable governance and delivery workflows. This catalog assigns each prompt to a primary lifecycle lane and shows the corresponding file in this folder.

## Prompt Mapping

| Prompt File | File | Primary Lane | Secondary Lane | Rationale |
|---|---|---|---|---|
| `workspace-scaffolder` | `workspace-scaffolder.prompt.md` | Execution | Planning | Produces workspace scaffolding and concrete setup artifacts. |
| `write-component-docs` | `write-component-docs.prompt.md` | Execution | Review | Produces technical component documentation artifacts. |
| `curate-copilot` | `curate-copilot.prompt.md` | Execution | Planning | Discovers imported customizations and updates copilot-instructions.md to reflect available agents, skills, and instructions. |
| `generate-readme` | `generate-readme.prompt.md` | Execution | Review | Produces consolidated repository README output. |
| `execute-testing-xunit` | `execute-testing-xunit.prompt.md` | Execution | Review | Produces test artifacts aligned with xUnit standards. |
| `review-technical-docs` | `review-technical-docs.prompt.md` | Review | Execution | Evaluates and remediates technical docs quality and completeness. |
| `execute-manual-review` | `execute-manual-review.prompt.md` | Execution | Review | Applies previously recorded manual review findings and validates the resulting remediation work. |
| `review-project` | `review-project.prompt.md` | Review | Execution | Verifies plan alignment, artifact hygiene, and scope integrity before a new execution wave begins. |
| `execute-delivery` | `execute-delivery.prompt.md` | Execution | Review | Resumes an active execution slice with traceability-first status and routing checks. |
| `governance-executive-audit` | `governance-executive-audit.prompt.md` | Review | Planning | Canonical Level 1 deep-scan governance report for full-workspace executive disposition. |
| `governance-type-audit` | `governance-type-audit.prompt.md` | Review | Planning | Canonical Level 2 deep-scan governance report by customization type with normalized deltas and failure IDs. |
| `governance-item-audit` | `governance-item-audit.prompt.md` | Review | Execution | Canonical Level 3 deep-scan governance report for one customization item with evidence-backed findings. |
| `optimize-customizations` | `optimize-customizations.prompt.md` | Review | Execution | Runs an on-demand optimization-factor review for agents, instructions, skills, and prompts with ranked remediation output. |
| `execute-condense` | `execute-condense.prompt.md` | Review | Execution | Invokes skills-authoring plus agent-authoring/instructions-authoring concision mode for one named artifact or a full artifact set and returns concise rewrite recommendations without applying edits. |
| `librarian` | `librarian.prompt.md` | Execution | Review | Curates documentation corpus naming and structure with `.docs/` as default root and produces approval-gated recommendations. |
| `sync-compendium` | `sync-compendium.prompt.md` | Execution | Review | Runs explicit-approval compendium sync with source attribution, conflict classification, and bespoke-safe merge constraints. |
| `security-research` | `security-research.prompt.md` | Review | Planning | Produces security assessment output without implementation. |
| `performance-research` | `performance-research.prompt.md` | Review | Planning | Produces performance assessment output without implementation. |

## Governance Notes

- Prompts should be selected using the lane first, then domain fit.
- The `Prompt` column is the canonical prompt identifier used by workspace integrity checks.
- The `File` column should match the actual `.prompt.md` files in this folder.
- Mixed-lane requests should be split into distinct prompt runs per lane.
- Canonical governance entrypoints are `governance-executive-audit`, `governance-type-audit`, and `governance-item-audit`.
