# Naming Taxonomy Review
**Date:** 2026-04-15  
**Scope:** All customization assets (agents, instructions, skills, prompts) and `.docs` corpus  
**Methodology:** Taxonomy skill four-layer model (Type → Lane → Domain → Function), naming-conventions policy, and automated conformance scan  
**Artifact counts at review:** 58 skills · 17 instructions · 15 agents · 18 prompts · 210 .docs files

---

## Assessment Scorecard

| Scope | Pattern Conformance | Lane/Vocab Alignment | Domain Clarity | Orphan/Drift Risk | Overall |
|---|---|---|---|---|---|
| Skills (`/skills/`) | ✅ Pass (58/58) | ✅ Pass (documented exceptions) | ✅ Pass | ⚠️ Advisory | **Strong** |
| Instructions (`/instructions/`) | ✅ Pass (17/17) | ✅ Pass | ✅ Pass | ✅ None | **Strong** |
| Agents (`/agents/`) | ✅ Pass (15/15) | ✅ Pass | ✅ Pass | ✅ None | **Strong** |
| Prompts (`/prompts/`) | ✅ Pass (18/18) | ✅ Pass | ✅ Pass | ✅ None | **Strong** |
| `.docs` files | ✅ Pass (0 violations) | N/A | ✅ Pass | ✅ None | **Strong** |
| `.docs` folders | ⚠️ All multi-word folders violate "one word per level" | N/A | N/A | 🔴 14 orphan review folders | **Weak** |

---

## Strengths

### 1. Regex-clean asset names across all customization types
Every one of the 58 skill directories, 17 instruction files, 15 agent files, and 18 prompt files conforms to the canonical `^[a-z]+(-[a-z]+)*` pattern. This is a strong baseline that most workspaces do not achieve.

### 2. Mature four-layer taxonomy model with authoritative references
The taxonomy system defines Type, Lane, Domain, and Function layers with explicit machine-readable configuration in [naming-conventions.json](./../../.github/skills/taxonomy-tag-registry/references/naming-conventions.json). This is well above average and enables automated audit and deterministic naming during authoring.

### 3. Vocabulary drift is documented, not ignored
Known exceptions (`write-technical-docs`, `delivery-status-grid`, `branch-completion`, `librarian`, `current-test-coverage`) are explicitly documented in [lane-intent.md](./../../.github/skills/taxonomy-tag-registry/references/lane-intent.md) with justification. This prevents silent drift from becoming technical debt.

### 4. Lifecycle catalogs are complete and consistent
All four asset types have maintained catalogs with primary/secondary lane assignments: [agent-lifecycle-catalog.md](./../../.github/agent-lifecycle-catalog.md), [instruction-lifecycle-catalog.md](./../../.github/instructions/instruction-lifecycle-catalog.md), [prompt-lifecycle-catalog.md](./../../.github/prompts/prompt-lifecycle-catalog.md), and [skill-discovery-index.md](./../../.github/skills/skill-discovery-index.md). All 108 assets are catalogued — no omissions.

### 5. Naming policy is separated from authoring guidance
[governance-naming-conventions.instructions.md](./../../.github/instructions/governance-naming-conventions.instructions.md) is policy-only and routes to authoring skills instead of duplicating procedural detail. This is the correct structural choice.

### 6. Governance report names are canonically mapped
Legacy governance file names (`audit.md`, `optimization-factor.md`, etc.) are explicitly mapped to their canonical names in the JSON configuration. This prevents the "every run produces a new filename" anti-pattern.

---

## Weaknesses

### W1. `.docs` folder naming rule is unenforceable as written (Critical)
**Policy rule:** "Folder names must be lowercase and one word per level."  
**Reality:** The entire review corpus under `.docs/changes/skill/reviews/` uses hyphenated multi-word names (e.g., `agent-authoring`, `api-design`, `async-programming`). All 72 review sub-folders violate the rule by its literal text.  
**Root cause:** The rule is borrowed from a convention designed for generic documentation folders, not for review artifact folders whose names must mirror skill names (which _legitimately_ use hyphens). The policy has no explicit exception for artifact-mirroring folders.

### W2. 14 orphan review folders have no matching skill (High)
Review artifact folders persist for skills that have been renamed, merged, or removed. These create false discovery signals and catalog noise.

| Orphan folder | Likely cause |
|---|---|
| `agent-customization` | Renamed → `governance-validate-customization` |
| `benchmarkdotnet-performance-testing` | Renamed → `perf-benchmark` |
| `condense-skill` | Renamed → `execute-condense` (prompt) or removed |
| `customization-review` | Renamed → `governance-validate-customization` |
| `customization-routing-decision` | Renamed → `route-customization` |
| `dotnet-modernization` | Renamed → `dotnet-refactor` |
| `finishing-a-development-branch` | Renamed → `branch-completion` |
| `keeping-customizations-current` | Renamed → `governance-sync-customizations` |
| `keeping-skills-current` | Renamed → `sync-skills` |
| `powershell-script-review` | Renamed → `audit-powershell` |
| `receiving-code-review` | Renamed → `remediate-review` |
| `requesting-code-review` | Renamed → `request-code-review` |
| `subagent-driven-development` | Skill removed (no replacement) |
| `technical-documentation` | Renamed → `write-technical-docs` |

### W3. `execute-` prefix creates an inconsistent sub-taxonomy (Medium)
14 of 58 skills (24%) use the `execute-` prefix. The intent was to signal Execution lane ownership via vocabulary, but this produces unbalanced naming: `governance-audit` (Review lane, no prefix) vs. `governance-sync-customizations` (Execution lane, with prefix). Other Execution-lane skills (`build-maui-apps`, `scaffold-dotnet`, `docker-dotnet`, `librarian`) do not use the prefix. The inconsistency reduces discoverability and makes the lane signal unreliable.

### W4. No naming rule for `.docs/changes` sub-path structure (Medium)
The `.docs` rules define file and folder naming but do not specify the canonical path depth or segment meaning for the `changes/` hierarchy. The current structure uses `changes/<type>/<artifact-class>/<item>` but this is implicit and unenforced. Adding a second subdomain (e.g., agent reviews, instruction changes) would likely produce ad-hoc divergence.

### W5. Skill name length policy is advisory only (Low)
The 12–20 character target length is advisory. Several current skill names exceed it (`design-usability-testing-scripts` = 33 chars, `powershell-script-library` = 33 chars) with no documented exception. Length violations are not tracked in the catalog.

### W6. `adr-generator` / `prd-generator` use `-generator` but no other planning asset does (Low)
The `-generator` suffix is used for two Planning-lane skills but is not in the naming formula or vocabulary table. It works but is an undocumented exception that future authors could replicate inconsistently (e.g., `readme-generator`, `plan-generator`).

---

## Recommendations

### Priority grid

| # | Recommendation | Impact | Effort | Lane | Priority |
|---|---|---|---|---|---|
| R1 | Revise the `.docs` folder rule to permit hyphens in artifact-mirroring paths | Eliminates W1 false violations | Low | Execution | 🔴 High |
| R2 | Prune the 14 orphan review folders via `prune-doc-artifacts` skill | Removes W2 catalog noise and false signals | Medium | Review | 🔴 High |
| R3 | Document the canonical `.docs/changes` path schema with explicit depth rules | Eliminates W4 structural ambiguity | Low | Execution | 🟡 Medium |
| R4 | Standardize `execute-` prefix: either apply it consistently to all Execution-lane skills or remove it and rely on function vocabulary alone | Resolves W3 inconsistency | High | Execution | 🟡 Medium |
| R5 | Add length exceptions to the catalog for skills > 20 chars, with a rationale note | Resolves W5 untracked drift | Low | Execution | 🟢 Low |
| R6 | Add `-generator` as an explicit Planning vocabulary noun-form in [function-vocabulary.md](./../../.github/skills/taxonomy-tag-registry/references/function-vocabulary.md) | Resolves W6 undocumented suffix | Low | Execution | 🟢 Low |

---

## Recommendation Detail

### R1 — Revise the `.docs` folder rule (High)
In [governance-naming-conventions.instructions.md](./../../.github/instructions/governance-naming-conventions.instructions.md), change:
> "Folder names must be lowercase and one word per level."

To:
> "Folder names must be lowercase kebab-case. Multi-word names use hyphens only. Folder names that mirror a skill, agent, instruction, or prompt name must exactly match that asset's canonical name."

This brings policy in sync with practice without requiring a mass rename.

### R2 — Prune orphan review folders (High)
Invoke `prune-doc-artifacts` scoped to `.docs/changes/skill/reviews/`. Target the 14 folders listed in W2. Archive rather than delete — move to `.docs/archive/changes/skill/reviews/` to preserve history. Add a policy note that review folders must be renamed in the same change that renames the skill.

### R3 — Document `.docs/changes` schema (Medium)
Add a section to [technical-docs.instructions.md](./../../.github/instructions/technical-docs.instructions.md) or create `.docs/changes/README.md` (as a legitimate entry-point guide) specifying:
- Depth schema: `changes/<artifact-type>/<artifact-class>/<item>/`
- Allowed artifact-type values: `skill`, `agent`, `instruction`, `prompt`, `adr`
- Naming rule: item folder must exactly match the asset's canonical name

### R4 — Standardize `execute-` prefix (Medium)
Two viable options:
- **Option A (Remove prefix):** Rename `execute-*` skills to their domain verb only (e.g., `plans` → `run-plans` or `dotnet-refactor` → `refactor-dotnet`). Relies on function vocabulary alone for lane signaling. Requires catalog and reference updates.
- **Option B (Formalize prefix):** Document `execute-` as a required prefix for all Execution-lane skills that implement a specific technology pattern, and rename non-prefixed Execution skills (`build-maui-apps` → `execute-maui-apps`, etc.). Higher rename surface area.

**Recommendation:** Option A. It removes redundancy, is consistent with how Review-lane skills are named (`audit-*`, `validate-*`), and leaves lane signal to the function vocabulary where the taxonomy already defines it.

### R5 — Track length exceptions (Low)
In [naming-conventions.json](./../../.github/skills/taxonomy-tag-registry/references/naming-conventions.json), add a `lengthExceptions` array under `scopes.customizations` with a `justification` field per entry. Apply to the two current violations.

### R6 — Add `-generator` to Planning vocabulary (Low)
In [function-vocabulary.md](./../../.github/skills/taxonomy-tag-registry/references/function-vocabulary.md), add `-generator` as an accepted noun-form suffix under the Planning table with a note: "Acceptable for skills that produce a structured document artifact as the primary output."

---

## Suggested Execution Sequence

1. **R1** — Policy text fix, single file edit, no renames required.  
2. **R3** — Schema documentation, single file addition.  
3. **R6** → **R5** — Low-effort vocabulary and config additions.  
4. **R2** — Invoke `prune-doc-artifacts`, approval-gated archive.  
5. **R4** — Requires a plan (use `writing-plans` skill) before execution due to the rename surface area.

---

## Policy Alignment Map

| Finding | Policy Source |
|---|---|
| W1 | [governance-naming-conventions.instructions.md](./../../.github/instructions/governance-naming-conventions.instructions.md) — `.docs` folder rule |
| W2 | [governance-naming-conventions.instructions.md](./../../.github/instructions/governance-naming-conventions.instructions.md) — "File names must reflect the actual content domain" |
| W3 | [function-vocabulary.md](./../../.github/skills/taxonomy-tag-registry/references/function-vocabulary.md) — Lane vocabulary consistency |
| W4 | [technical-docs.instructions.md](./../../.github/instructions/technical-docs.instructions.md) — missing `.docs/changes` schema |
| W5 | [governance-naming-conventions.instructions.md](./../../.github/instructions/governance-naming-conventions.instructions.md) — 12–20 char target |
| W6 | [function-vocabulary.md](./../../.github/skills/taxonomy-tag-registry/references/function-vocabulary.md) — Planning vocabulary table |

---

*Report generated by: taxonomy skill (v2.0) + critical-thinking + delivery-status-grid + governance-optimize-customizations*
