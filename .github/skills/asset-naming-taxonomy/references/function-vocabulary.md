# Function Vocabulary Reference

Use this table to select a name verb that signals the correct lane, or to detect vocabulary drift in existing names.

## Vocabulary by Lane

### Planning

Verbs and noun-form equivalents that signal Planning intent.

| Verb / Noun-form | Meaning in context | Example usage |
|---|---|---|
| `plan` | Define a structured work intent | `writing-plans` |
| `design` | Produce an architecture, interaction, or structural blueprint | `api-design`, `domain-design` |
| `research` | Gather and synthesise authoritative evidence before deciding | `task-research`, `security-research`, `performance-research` |
| `analyze` | Examine inputs to form a reasoned conclusion | _(use as modifier, not standalone)_ |
| `route` | Classify and direct work to the correct specialist or lane | `route-customization` |
| `refine` | Iteratively sharpen a raw idea or requirement | `refine-ideas` |
| `learn` | Build structured mastery of a topic with source traceability | `learn-topics` |
| `draft` | Produce an initial, non-final version | _(use as modifier)_ |
| `define` | Establish authoritative rules or contracts | _(use as modifier)_ |
| `generate` / `-generator` suffix | Produce a structured planning document; `-generator` suffix is acceptable when the skill's primary output is a structured document artifact (ADR, PRD, or equivalent) | `adr-generator`, `prd-generator` |

**Noun-form Planning names** (no explicit verb): `critical-thinking`, `writing-plans`, `task-research`

**Recognized suffix**: `-generator` is an accepted Planning suffix for document-generation skills. Justify any new `-generator` skill in [lane-intent.md](./lane-intent.md) under Known Vocabulary Exceptions.

---

### Execution

Verbs and noun-form equivalents that signal Execution intent.

| Verb / Noun-form | Meaning in context | Example usage |
|---|---|---|
| `build` | Construct an end-to-end artifact or system | `build-maui-apps` |
| `execute` | Run an approved plan or procedure | `plans`, `task-execution` |
| `scaffold` | Generate a standard project or folder skeleton | `scaffold-dotnet` |
| `sync` | Bring one artifact to match another authoritative source | `sync-customizations`, `sync-skills`, `sync-editorconfig` |
| `author` | Create or substantially rewrite a structured artifact | `agent-authoring`, `skills-authoring`, `instructions-authoring` |
| `index` | Build or refresh a navigable catalogue artifact | `index-docs` |
| `implement` | Translate a specification into working code | _(use as modifier)_ |
| `create` | Bring a new artifact into existence | _(use as modifier; prefer domain-specific verbs)_ |
| `write` | Produce a documentation artifact (known exception — see lane-intent.md) | `write-technical-docs` |
| `curate` | Maintain and organise an existing artifact collection | `curate-copilot-instructions` |
| `docker` | Container-scope indicator noun | `docker-dotnet` |

**Noun-form Execution names**: `task-execution`, `branch-completion`, `librarian`, `asset-naming-taxonomy`

---

### Review

Verbs and noun-form equivalents that signal Review intent.

| Verb / Noun-form | Meaning in context | Example usage |
|---|---|---|
| `audit` | Comprehensive systematic assessment of governance or structure | `governance-audit`, `audit-powershell` |
| `review` | Targeted evaluation of one artifact or set against standards | `skill-review`, `request-code-review`, `remediate-review` |
| `validate` | Confirm an artifact conforms to a schema or contract | `syrx-validation` |
| `assess` | Form a judgment on quality, risk, or fitness | _(use as modifier)_ |
| `benchmark` | Measure and compare performance metrics | `perf-benchmark` |
| `summarize` | Synthesise a large artifact set into a concise briefing | `governance-summarize` |
| `prune` | Identify and remove stale or redundant artifacts | `prune-doc-artifacts` |
| `remediate` | Apply targeted fixes based on review findings | `remediate-review` |
| `deliver` (status) | Report completion or progress state | `delivery-status-grid` |
| `optimize` | Evaluate and improve quality factors | `optimize-customizations` |

**Noun-form Review names**: `delivery-status-grid`, `current-test-coverage`, `execute-customization-audit`, `performance-research`, `security-research`

---

## Vocabulary Drift Detection

A vocabulary drift signal exists when an asset's leading verb belongs to a different lane than its catalog assignment.

| Signal type | Example | Correct action |
|---|---|---|
| Execution verb in Planning lane | _(hypothetical: `build-plan`)_ | Check if the output is actually a plan; if so, rename to `draft-plan` or `writing-plans` |
| Planning verb in Execution lane | _(hypothetical: `design-scaffold`)_ | Check if the asset produces a working scaffold; if so rename to `scaffold-*` |
| Review verb in Execution lane | _(hypothetical: `audit-config`)_ | Check if the asset applies config changes vs. only reports findings; split if needed |
| Noun-form with no clear lane | _(e.g. `librarian`)_ | Accept if catalog assignment is authoritative and justification is documented in [lane-intent.md](./lane-intent.md) |

## Naming Formula

When creating a new asset, combine:

```
[lane-vocabulary-verb] + [-] + [domain-noun]
```

Examples:
- Planning + Engineering → `design-api`, `research-dotnet-upgrade`
- Execution + DevOps → `scaffold-pipeline`, `sync-editorconfig`
- Review + Governance → `governance-audit`, `audit-agent`, `audit-instructions`, `audit-prompts`

For noun-form names (where a role or artefact noun is clearer than a verb): document the justification in [lane-intent.md](./lane-intent.md) under Known Vocabulary Exceptions.

