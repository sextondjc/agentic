# Taxonomy References

This folder stores configurable naming conventions used by the `asset-naming-taxonomy` skill.

## Files

| File | Purpose |
|---|---|
| [naming-conventions.json](./naming-conventions.json) | Configurable patterns, lane vocabulary, domain categories, ontology, and governance-report canonical mappings. |
| [lane-intent.md](./lane-intent.md) | Lane definitions, clarification prompts, synonyms, and known vocabulary exceptions for naming decisions. |
| [function-vocabulary.md](./function-vocabulary.md) | Full verb/noun vocabulary per lane, drift detection guide, and naming formula. |

## Usage

- `naming-conventions.json` is the source of truth for automated naming checks and convergence plans. Keep patterns deterministic and regex-safe.
- `lane-intent.md` is used by the taxonomy skill when the correct lane for a new asset is ambiguous. Update it when new vocabulary exceptions are accepted.
- `function-vocabulary.md` is used during authoring and audit to select conformant name verbs and detect drift. Update it when new verb patterns become canonical.
- Update all three files together when workspace naming policy evolves.

