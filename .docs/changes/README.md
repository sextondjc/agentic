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
| `item` | e.g., `governance-audit`, `csharp-engineer` | Must exactly match the canonical asset name. See naming rule below. |

## Naming Rule for `<item>` Folders

An `<item>` folder that corresponds to a workspace skill, agent, instruction, or prompt **must exactly match** that asset's canonical name as it appears in the relevant lifecycle catalog:

- Skills → [skills-discovery-index.md](../../.github/catalogs/skills-discovery-index.md)
- Agents → [agents-discovery-index.md](../../.github/catalogs/agents-discovery-index.md)
- Instructions → [instructions-discovery-index.md](../../.github/catalogs/instructions-discovery-index.md)
- Prompts → [prompts-discovery-index.md](../../.github/catalogs/prompts-discovery-index.md)

When an asset is renamed, its `<item>` folder must be renamed in the same change.

## Orphan Policy

An `<item>` folder with no matching asset in the corresponding catalog is an orphan. Orphans must be archived according to the current `.docs/archive/` structure (do not assume legacy subpaths) and must not accumulate. Run the `prune-doc-artifacts` skill to identify and action orphans.

## File Conventions

- Each item folder should contain an `INDEX.md` (auto-generated) and at least one artifact file (`review.md`, `history.md`, `findings.md`, etc.).
- File names must be lowercase kebab-case with a `.md` extension.
- `INDEX.md` and `README.md` are reserved names and must not be used for arbitrary content.
