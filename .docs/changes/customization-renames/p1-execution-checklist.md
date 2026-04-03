# P1 Rename Execution Checklist

Status: Completed execution tracker
Date: 2026-04-02
Source: [rename-history.md](./rename-history.md)

## Purpose
Provide an exact pre-change file target list for each planned P1 rename before any names are changed.

## Scope Rules

1. `required` means the file includes a direct asset-name reference that should be updated in the rename change set.
2. `conditional` means update only if that reference is intended to point to the renamed asset after review.
3. For ambiguous names (`architecture`, `debug`), this checklist targets explicit asset tokens and agent-file references, not generic prose usage.

## P1-01 Skill Rename

Execution Status: Applied 2026-04-02

| Old Name | New Name |
|---|---|
| request-review | request-code-review |

| File | Scope |
|---|---|
| [copilot-instructions.md](./../../../.github/copilot-instructions.md) | required |
| [curate-copilot.prompt.md](./../../../.github/prompts/curate-copilot.prompt.md) | required |
| [README.md](./../../../.github/skills/README.md) | required |
| [SKILL.md](./../../../.github/skills/current-test-coverage/SKILL.md) | required |
| .github/skills/request-review/SKILL.md | required |
| .github/skills/request-review/references/README.md | required |
| [SKILL.md](./../../../.github/skills/task-execution/SKILL.md) | required |
| [code-quality-reviewer-prompt.md](./../../../.github/skills/task-execution/code-quality-reviewer-prompt.md) | required |
| [index.md](./../../../.github/skills/skill-review/references/history/index.md) | required |
| .github/skills/skill-review/references/history/request-review-history.md | required |
| [customization-taxonomy-v1.md](./../../reference/customization-taxonomy-v1.md) | required |
| [20260329-full-skill-review-grid.md](./../skill-reviews/20260329-full-skill-review-grid.md) | required |
| [20260401-full-skill-review-grid.md](./../skill-reviews/20260401-full-skill-review-grid.md) | required |
| .docs/changes/skill-reviews/request-review/20260329-review.md | required |
| .docs/changes/skill-reviews/request-review/20260401-review.md | required |
| [rename-history.md](./rename-history.md) | required |

## P1-02 Skill Rename

Execution Status: Applied 2026-04-02

| Old Name | New Name |
|---|---|
| apply-review | remediate-review |

| File | Scope |
|---|---|
| [copilot-instructions.md](./../../../.github/copilot-instructions.md) | required |
| [curate-copilot.prompt.md](./../../../.github/prompts/curate-copilot.prompt.md) | required |
| [naming-conventions.instructions.md](./../../../.github/instructions/naming-conventions.instructions.md) | required |
| [README.md](./../../../.github/skills/README.md) | required |
| .github/skills/apply-review/SKILL.md | required |
| .github/skills/apply-review/references/README.md | required |
| [index.md](./../../../.github/skills/skill-review/references/history/index.md) | required |
| .github/skills/skill-review/references/history/apply-review-history.md | required |
| [customization-taxonomy-v1.md](./../../reference/customization-taxonomy-v1.md) | required |
| [20260329-full-skill-review-grid.md](./../skill-reviews/20260329-full-skill-review-grid.md) | required |
| [20260401-full-skill-review-grid.md](./../skill-reviews/20260401-full-skill-review-grid.md) | required |
| .docs/changes/skill-reviews/apply-review/20260329-review.md | required |
| .docs/changes/skill-reviews/apply-review/20260401-review.md | required |
| [rename-history.md](./rename-history.md) | required |

## P1-03 Skill Rename

Execution Status: Applied 2026-04-02

| Old Name | New Name |
|---|---|
| complete-branch | branch-completion |

| File | Scope |
|---|---|
| [copilot-instructions.md](./../../../.github/copilot-instructions.md) | required |
| [naming-conventions.instructions.md](./../../../.github/instructions/naming-conventions.instructions.md) | required |
| [README.md](./../../../.github/skills/README.md) | required |
| .github/skills/complete-branch/SKILL.md | required |
| .github/skills/complete-branch/references/README.md | required |
| [SKILL.md](./../../../.github/skills/executing-plans/SKILL.md) | required |
| [SKILL.md](./../../../.github/skills/task-execution/SKILL.md) | required |
| [index.md](./../../../.github/skills/skill-review/references/history/index.md) | required |
| .github/skills/skill-review/references/history/complete-branch-history.md | required |
| [customization-taxonomy-v1.md](./../../reference/customization-taxonomy-v1.md) | required |
| [20260401-maintenance.md](./../skill-maintenance/20260401-maintenance.md) | required |
| [20260329-full-skill-review-grid.md](./../skill-reviews/20260329-full-skill-review-grid.md) | required |
| [20260401-full-skill-review-grid.md](./../skill-reviews/20260401-full-skill-review-grid.md) | required |
| .docs/changes/skill-reviews/complete-branch/20260329-review.md | required |
| .docs/changes/skill-reviews/complete-branch/20260401-review.md | required |
| [rename-history.md](./rename-history.md) | required |

## P1-04 Agent Rename

Execution Status: Applied 2026-04-02

| Old Name | New Name |
|---|---|
| planning-research | plan-researcher |

| File | Scope |
|---|---|
| [copilot-instructions.md](./../../../.github/copilot-instructions.md) | required |
| [README.md](./../../../.github/agents/README.md) | required |
| [benchmark-researcher.agent.md](./../../../.github/agents/benchmark-researcher.agent.md) | required |
| [orchestrator.agent.md](./../../../.github/agents/orchestrator.agent.md) | required |
| .github/agents/performance-researcher.agent.md | required |
| .github/agents/planning-research.agent.md | required |
| [security-researcher.agent.md](./../../../.github/agents/security-researcher.agent.md) | required |
| [naming-conventions.instructions.md](./../../../.github/instructions/naming-conventions.instructions.md) | required |
| [curate-copilot.prompt.md](./../../../.github/prompts/curate-copilot.prompt.md) | required |
| [review-technical-docs.prompt.md](./../../../.github/prompts/review-technical-docs.prompt.md) | required |
| [SKILL.md](./../../../.github/skills/curating-copilot-instructions/SKILL.md) | required |
| [SKILL.md](./../../../.github/skills/write-technical-docs/SKILL.md) | required |
| [SKILL.md](./../../../.github/skills/writing-plans/SKILL.md) | required |
| [agent-routing-guide.md](./../../agent-routing-guide.md) | required |
| [customization-taxonomy-v1.md](./../../reference/customization-taxonomy-v1.md) | required |
| [coverage-report.md](./../../reference/coverage-report.md) | required |
| [index.md](./../../reference/.github/agents/index.md) | required |
| .docs/reference/.github/agents/planning-and-research.agent.md.ref.md | required |
| [rename-history.md](./rename-history.md) | required |

## P1-05 Agent Rename

Execution Status: Applied 2026-04-02

| Old Name | New Name |
|---|---|
| project-setup | workspace-scaffolder |

| File | Scope |
|---|---|
| [copilot-instructions.md](./../../../.github/copilot-instructions.md) | required |
| [README.md](./../../../.github/agents/README.md) | required |
| .github/agents/project-setup.agent.md | required |
| [README.md](./../../../.github/prompts/README.md) | required |
| .github/prompts/project-setup.prompt.md | required |
| [SKILL.md](./../../../.github/skills/curating-copilot-instructions/SKILL.md) | required |
| .docs/_workspace-file-inventory.txt | required |
| [customization-taxonomy-v1.md](./../../reference/customization-taxonomy-v1.md) | required |
| [coverage-report.md](./../../reference/coverage-report.md) | required |
| [index.md](./../../reference/.github/agents/index.md) | required |
| .docs/reference/.github/agents/project-setup.agent.md.ref.md | required |
| [index.md](./../../reference/.github/prompts/index.md) | required |
| .docs/reference/.github/prompts/project-setup.prompt.md.ref.md | required |
| [rename-history.md](./rename-history.md) | required |

## P1-06 Agent Rename

Execution Status: Applied 2026-04-02

| Old Name | New Name |
|---|---|
| performance-researcher | performance-assessor |

| File | Scope |
|---|---|
| [copilot-instructions.md](./../../../.github/copilot-instructions.md) | required |
| [README.md](./../../../.github/agents/README.md) | required |
| [benchmark-researcher.agent.md](./../../../.github/agents/benchmark-researcher.agent.md) | required |
| [orchestrator.agent.md](./../../../.github/agents/orchestrator.agent.md) | required |
| .github/agents/performance-researcher.agent.md | required |
| [curate-copilot.prompt.md](./../../../.github/prompts/curate-copilot.prompt.md) | required |
| [performance-research.prompt.md](./../../../.github/prompts/performance-research.prompt.md) | required |
| [SKILL.md](./../../../.github/skills/performance-research/SKILL.md) | required |
| [performance-research-report-template.md](./../../../.github/skills/performance-research/references/performance-research-report-template.md) | required |
| .docs/_workspace-file-inventory.txt | required |
| [agent-routing-guide.md](./../../agent-routing-guide.md) | required |
| [customization-taxonomy-v1.md](./../../reference/customization-taxonomy-v1.md) | required |
| [coverage-report.md](./../../reference/coverage-report.md) | required |
| [index.md](./../../reference/.github/agents/index.md) | required |
| .docs/reference/.github/agents/performance-researcher.agent.md.ref.md | required |
| [rename-history.md](./rename-history.md) | required |

## P1-07 Agent Rename

Execution Status: Applied 2026-04-02

| Old Name | New Name |
|---|---|
| debug | defect-debugger |

| File | Scope |
|---|---|
| [copilot-instructions.md](./../../../.github/copilot-instructions.md) | required |
| [README.md](./../../../.github/agents/README.md) | required |
| .github/agents/debug.agent.md | required |
| [orchestrator.agent.md](./../../../.github/agents/orchestrator.agent.md) | required |
| .github/agents/performance-researcher.agent.md | required |
| [security-researcher.agent.md](./../../../.github/agents/security-researcher.agent.md) | required |
| [naming-conventions.instructions.md](./../../../.github/instructions/naming-conventions.instructions.md) | required |
| [SKILL.md](./../../../.github/skills/writing-plans/SKILL.md) | required |
| .docs/_workspace-file-inventory.txt | required |
| [agent-routing-guide.md](./../../agent-routing-guide.md) | required |
| [inventory-first-technical-reference-plan-v1.md](./../../plans/inventory-first-technical-reference-plan-v1.md) | required |
| [customization-taxonomy-v1.md](./../../reference/customization-taxonomy-v1.md) | required |
| [coverage-report.md](./../../reference/coverage-report.md) | required |
| [index.md](./../../reference/.github/agents/index.md) | required |
| .docs/reference/.github/agents/debug.agent.md.ref.md | required |
| [rename-history.md](./rename-history.md) | required |

## P1-08 Agent Rename

Execution Status: Applied 2026-04-02

| Old Name | New Name |
|---|---|
| architecture | architecture-designer |

| File | Scope |
|---|---|
| [copilot-instructions.md](./../../../.github/copilot-instructions.md) | required |
| [README.md](./../../../.github/agents/README.md) | required |
| .github/agents/architecture.agent.md | required |
| [csharp-engineer.agent.md](./../../../.github/agents/csharp-engineer.agent.md) | required |
| [orchestrator.agent.md](./../../../.github/agents/orchestrator.agent.md) | required |
| .github/agents/performance-researcher.agent.md | required |
| .github/agents/project-setup.agent.md | required |
| [security-researcher.agent.md](./../../../.github/agents/security-researcher.agent.md) | required |
| [naming-conventions.instructions.md](./../../../.github/instructions/naming-conventions.instructions.md) | required |
| [curate-copilot.prompt.md](./../../../.github/prompts/curate-copilot.prompt.md) | required |
| .github/prompts/project-setup.prompt.md | required |
| [review-technical-docs.prompt.md](./../../../.github/prompts/review-technical-docs.prompt.md) | required |
| [SKILL.md](./../../../.github/skills/write-technical-docs/SKILL.md) | required |
| [agent-routing-guide.md](./../../agent-routing-guide.md) | required |
| [customization-taxonomy-v1.md](./../../reference/customization-taxonomy-v1.md) | required |
| [coverage-report.md](./../../reference/coverage-report.md) | required |
| [index.md](./../../reference/.github/agents/index.md) | required |
| .docs/reference/.github/agents/architecture-and-ddd.agent.md.ref.md | required |
| [rename-history.md](./rename-history.md) | required |
| [architecture.instructions.md](./../../../.github/instructions/architecture.instructions.md) | conditional: instruction asset name may remain unchanged |
| [write-component-docs.prompt.md](./../../../.github/prompts/write-component-docs.prompt.md) | conditional: contains generic tag example, not necessarily agent reference |

## Batch Totals

| Batch | Renames | Estimated Required File Touches |
|---|---:|---:|
| P1 | 8 | 130 |

## Implementation Note

Before applying each rename, run a final exact-string diff check to validate no additional files entered scope since this checklist was generated.
