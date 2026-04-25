# .github Customization Hub

This README is the entry point for workspace customization assets. Use this page to discover where canonical inventories live and which files to update when assets change.

## Quick Navigation

| Topic | Canonical File | Purpose |
|---|---|---|
| Top-level folder index | [INDEX.md](./INDEX.md) | Generated navigation for `.github` docs and subfolders. |
| Workspace behavior hub | [copilot-instructions.md](./copilot-instructions.md) | Global operating model, routing policy, preferred agents and skills. |
| Agents inventory | [agent-lifecycle-catalog.md](./agent-lifecycle-catalog.md) | Canonical lifecycle ownership and rationale for agent assets. |
| Instructions inventory | [instruction-lifecycle-catalog.md](./instructions/instruction-lifecycle-catalog.md) | Canonical lifecycle ownership and rationale for instruction files. |
| Prompts inventory | [prompt-lifecycle-catalog.md](./prompts/prompt-lifecycle-catalog.md) | Canonical lifecycle ownership and rationale for prompt assets. |
| Skills discovery | [skill-discovery-index.md](./skills/skill-discovery-index.md) | Canonical skill lookup table and lane mapping. |
| PowerShell scripts catalog | [README.md](./scripts/powershell/README.md) | Script inventory and usage guidance. |

## Inventory Snapshot

These counts are current for the repository state as of this documentation refresh.

| Category | Count |
|---|---:|
| Agents (`*.agent.md`) | 18 |
| Instructions (`*.instructions.md`) | 21 |
| Prompts (`*.prompt.md`) | 21 |
| Skills (`**/SKILL.md`) | 145 |
| PowerShell scripts (`*.ps1`) | 28 |
| GitHub workflows (`*.yml`) | 2 |

## Maintenance Notes

1. Keep discovery data in catalogs and indexes, not in this README.
2. If an asset is added, removed, or renamed, update the matching lifecycle catalog in the same change.
3. Regenerate or refresh [INDEX.md](./INDEX.md) when top-level markdown or folder structure changes.
4. Run `.github/scripts/powershell/test-governance-link-graph.ps1` after documentation edits to confirm link integrity.

## Related Assets

| File | Role |
|---|---|
| [agent-lifecycle-catalog.md](./agent-lifecycle-catalog.md) | Agent lane ownership and rationale. |
| [instruction-lifecycle-catalog.md](./instructions/instruction-lifecycle-catalog.md) | Instruction lane ownership and rationale. |
| [prompt-lifecycle-catalog.md](./prompts/prompt-lifecycle-catalog.md) | Prompt lane ownership and rationale. |
| [skill-discovery-index.md](./skills/skill-discovery-index.md) | Skill selection and lane mapping. |
| [copilot-instructions.md](./copilot-instructions.md) | Workspace routing, standards, and bundle guidance. |



