---
name: curate-copilot
description: Prompt for discovering imported customizations and updating copilot-instructions.md to leverage them.
---

# Curating Copilot Instructions

Route this request to `orchestrator`.

Use the `curate-copilot-instructions` skill as the primary workflow.

Update `copilot-instructions.md` so imported skills, agents, and instructions are discoverable and new contributors can pick the right tool quickly.

Use this prompt when importing customizations, setting up a workspace, adding assets, or cleaning stale references.

## Required Inputs

Collect and confirm these before execution:

- `workspace_name` (required)
- `project_type` (required)
- `catalogue_source` (required)
- `recently_imported` (optional)
- `unused_customizations` (optional)

Ask for missing required inputs before continuing.

## Execution Contract

Run the full curation workflow from [SKILL.md](./../skills/curate-copilot-instructions/SKILL.md) and keep this prompt as a routing and output contract only.

Required outputs:

1. Updated `copilot-instructions.md` with discoverable preferred agents/skills.
2. Explicit classification of assets as `FEATURE`, `REFERENCE`, or `ARCHIVE`.
3. Discoverability validation that a new contributor can choose the right agent/skill quickly.
4. Verification that listed assets exist, links resolve, and no stale references remain.

## Verification Checklist

- [ ] Every listed agent/skill file exists in the workspace.
- [ ] Descriptions match frontmatter semantics.
- [ ] No duplicate entries across sections.
- [ ] Links to [skill-discovery-index.md](./../skills/skill-discovery-index.md) are valid.
- [ ] No references to removed or renamed assets.

## Success Criteria

- `copilot-instructions.md` reflects current workspace scope and defaults.
- Curated assets are discoverable and non-duplicative.
- All verification checks pass.






