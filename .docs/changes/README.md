# Changes Directory

Entry-point guide for the `.docs/changes/` artifact corpus.

## Path Schema

```
.docs/changes/<artifact-type>/<artifact-class>/<item>/
```

| Segment | Allowed values | Rule |
|---|---|---|
| `artifact-type` | `skill`, `agent`, `instruction`, `prompt`, `adr` | Lowercase single word. Must match an asset type category. |
| `artifact-class` | e.g., `reviews`, `changes`, `findings` | Lowercase single word describing the artifact class. |
| `item` | e.g., `audit-governance`, `csharp-engineer` | Must exactly match the canonical asset name. See naming rule below. |

## Naming Rule for `<item>` Folders

An `<item>` folder that corresponds to a workspace skill, agent, instruction, or prompt **must exactly match** that asset's canonical name as it appears in the relevant lifecycle catalog:

- Skills → [skill-discovery-index.md](../../.github/skills/skill-discovery-index.md)
- Agents → [agent-lifecycle-catalog.md](../../.github/agent-lifecycle-catalog.md)
- Instructions → [instruction-lifecycle-catalog.md](../../.github/instructions/instruction-lifecycle-catalog.md)
- Prompts → [prompt-lifecycle-catalog.md](../../.github/prompts/prompt-lifecycle-catalog.md)

When an asset is renamed, its `<item>` folder must be renamed in the same change.

## Orphan Policy

An `<item>` folder with no matching asset in the corresponding catalog is an orphan. Orphans must be archived to `.docs/archive/changes/` and must not accumulate. Run the `prune-doc-artifacts` skill to identify and action orphans.

## File Conventions

- Each item folder should contain an `INDEX.md` (auto-generated) and at least one artifact file (`review.md`, `history.md`, `findings.md`, etc.).
- File names must be lowercase kebab-case with a `.md` extension.
- `INDEX.md` and `README.md` are reserved names and must not be used for arbitrary content.
