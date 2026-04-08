# Skill Maintenance Summary — 2026-04-01

## Overview

| Field | Value |
|---|---|
| Run Date | 2026-04-01 |
| Skill | sync-skills |
| Sources Evaluated | 4 |
| Sources Updated | 4 |
| Skills Updated | 1 (skills-authoring) |
| New Skills Registered | 2 (delivery-status-grid, branch-completion) |
| Post-Update Review Outcome | All Pass |

## Source Evaluation Results

| Source | Status | Delta |
|---|---|---|
| agentskills.io/home | Current | Adoption list expanded; Discord server added. No authoring spec changes. |
| anthropics/skills | Current | Auto-sync active; last commit last week. No structure changes. |
| Claude Support: How to Create Custom Skills | Current | Confirmed description max is 200 chars on Claude platform (vs 1024 on VS Code). Platform-divergence noted in catalog. |
| VS Code Agent Skills Documentation | Current | **Updated 2026-04-01.** New optional frontmatter fields documented: `argument-hint`, `user-invocable`, `disable-model-invocation`. Personal skill path `~/.copilot/skills/` confirmed. Name max 64 chars, description max 1024 chars confirmed. Chat Customizations editor (Preview) and `/create-skill` AI generation added. |

## Skill Changes

### skills-authoring — Updated

| Change | Detail |
|---|---|
| Personal skill directories | Added `~/.copilot/skills/` for Copilot to the directory list. |
| `name` field constraint | Clarified max 64 characters; made explicit it must be lowercase and match the parent directory name. |
| `description` field constraint | Separated to own bullet with max 1024 chars (200 chars on Claude platform noted). |
| New optional VS Code/Copilot fields | Added documentation for `argument-hint`, `user-invocable`, and `disable-model-invocation`. |
| Example name casing | Fixed example `Skill-Name-With-Hyphens` → `skill-name-with-hyphens` to match lowercase requirement. |

### delivery-status-grid — Registered (new)

Added to:
- [README.md](./../../../../../README.md) discovery index (Review / Planning lanes)
- Skill history and index already created in the 2026-04-01 full audit.

### branch-completion — Registered (index gap)

Was present in `copilot-instructions.md` but missing from [README.md](./../../../../README.md). Added.

## Post-Update Validation

Targeted skill-review rerun confirmed all three skills pass all MUST and SHOULD standards after changes.

| Skill | Outcome | Report |
|---|---:|---|
| skills-authoring | Pass | [20260401-review.md](./../reviews/skills-authoring/history.md) |
| delivery-status-grid | Pass | [20260401-review.md](./../reviews/delivery-status-grid/history.md) |
| branch-completion | Pass | [20260401-review.md](./../reviews/branch-completion/history.md) |


