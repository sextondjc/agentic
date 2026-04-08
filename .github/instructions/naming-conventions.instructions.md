---
name: naming-conventions
description: 'Asset naming standards for agents, instructions, skills, and prompts to ensure consistency, discoverability, and cross-project portability.'
applyTo: '.github/**/*.md'
---

# Naming Conventions for Customization Assets

## Overview

Clear, concise, and predictable naming improves discoverability, memory retention, and cross-project adoption. This document establishes mandatory naming standards for all customization artifacts in `.github/`.

## Core Principles

1. **Brevity:** Target 12–20 characters (max 24). Names truncate in UI lists; shorter names are visually scannable.
2. **Pattern Consistency:** Use recognizable naming patterns so developers can predict asset names.
3. **Clarity:** Domain intent must be unambiguous; avoid abbreviations, "and" conjunctions, and compound qualifiers.
4. **Portability:** Names should remain semantically meaningful when ported across projects and workspaces.

---

## Naming Patterns

### Skills (SKILL.md files)

**Pattern:** `<verb>-<domain>` or `<noun>-<domain>`

Skills are reusable workflows—think of them as capabilities you invoke.

**Verb Pattern (preferred for actions):**
- `audit-powershell` ← What you do (audit) + domain (PowerShell)
- `write-technical-docs` ← What you do (write) + domain (technical docs)
- `sync-skills` ← What you do (sync) + domain (skills)
- `remediate-review` ← What you do (apply) + domain (review)
- `branch-completion` ← What you do (complete) + domain (branch)

**Noun Pattern (acceptable for tools/generators):**
- `adr-generator` ← artifact type (ADR) + noun (generator)
- `prd-generator` ← artifact type (PRD) + noun (generator)
- `critical-thinking` ← capability name
- `api-design` ← domain

**Anti-patterns:**
- ❌ `keeping-customizations-current` (gerund + too long, 29 chars)
- ❌ `customization-routing-decision` (compound + too long, 29 chars)
- ❌ `subagent-driven-development` (too vague, 26 chars)
- ❌ `finishing-a-development-branch` (wordy, 29 chars)

**Length guide:** Most skills 12–20 characters.

---

### Instructions (.instructions.md files)

**Pattern:** `<domain>` or `<domain>-<policy>`

Instructions are always-on policies applied by filename pattern (`applyTo`). Keep names short and domain-focused.

**Single-Domain (preferred):**
- `architecture.instructions.md` ← Clean, clear domain
- `csharp.instructions.md` ← Language domain
- `syrx.instructions.md` ← Specific technology
- `ci-cd.instructions.md` ← Operational domain
- `prd.instructions.md` ← Artifact type

**Domain + Policy (when needed):**
- `lifecycle-governance.instructions.md` ← Distinguishes from operational policies
- `security-and-secure-coding.instructions.md` ← Paired concepts essential to meaning

**Anti-patterns:**
- ❌ `architecture-ddd-and-domain.instructions.md` (redundant; DDD is inherent, 35 chars)
- ❌ `csharp-development-and-standards.instructions.md` ("development" redundant, 42 chars)
- ❌ `data-access-and-syrx.instructions.md` (should be just `syrx`, unclear scope)
- ❌ `github-actions-ci-cd-best-practices.instructions.md` (too literal, 50 chars)
- ❌ `documentation-and-specifications.instructions.md` (too generic, 46 chars)

**Length guide:** Most instructions ≤ 25 characters.

---

### Agents (.agent.md files)

**Pattern:** `<domain>-<specialist>`

Agents are specialist roles invoked explicitly by name. They apply deep expertise to a phase or domain.

**Patterns:**
- `csharp-engineer` ← Developer specialist agent
- `code-reviewer` ← Review specialist
- `powershell-reviewer` ← Review specialist
- `security-researcher` ← Research specialist
- `architecture-designer` ← Unified specialist (compound domain acceptable when specialization remains narrow)

**Modern examples:**
- `orchestrator` ← Router/dispatcher (no domain needed; meta-level)
- `defect-debugger` ← Single-word imperative (ultra-specific task)
- `sql-dba` ← Database specialist (DBA understood in context)

**Anti-patterns:**
- ❌ `benchmark-researcher` (too long, 35 chars; consider `perf-researcher`)
- ❌ `plan-researcher` (too generic; reassess scope)

**Length guide:** Most agents 12–25 characters.

---

### Prompts (.prompt.md files)

**Pattern:** `<verb>-<domain>` or `<domain>-<action>`

Prompts are interaction templates for specific workflows. Keep names task-focused and memorable.

**Patterns:**
- `write-component-docs` ← What you create (action)
- `generate-readme` ← Artifact + generation
- `security-research` ← Domain + action (research)
- `testing-xunit` ← Domain + test framework
- `syrx-validation` ← Domain-specific validation

**Length guide:** Most prompts ≤ 30 characters (longer is acceptable for narrative clarity).

---

### Catalogs And Indexes (.md files)

**Pattern:** `<domain>-catalog`, `<domain>-index`, or `<domain>-guide`

Catalog and index documents are navigational assets. They must use filenames that describe their function.

**Rules:**
- Use `README.md` only for a true folder entry-point guide.
- Use `*-catalog.md` for lifecycle mappings and canonical listings.
- Use `*-index.md` for discovery surfaces and inventories.
- Do not name a catalog or index `README.md` just because it lives at a folder root.

**Examples:**
- `agent-lifecycle-catalog.md`
- `instruction-lifecycle-catalog.md`
- `prompt-lifecycle-catalog.md`
- `skill-discovery-index.md`

**Anti-patterns:**
- ❌ `README.md` for a lane catalog
- ❌ `README.md` for a discovery index
- ❌ `README.md` for an asset inventory table

---

## Consolidation Rules

When Domain Overlap Exists:
1. **Single canonical source wins.** Don't create parallel skills, agents, and instructions for the same domain.
2. **Agent is the invocable entry point.** If a specialized agent exists (e.g., `security-researcher`), the corresponding skill (e.g., `security-research`) is a supporting workflow, not a duplicate.
3. **Instructions apply automatically.** Instructions never duplicate agent or skill logic; they set policy boundaries.
4. **Names must disambiguate.** If both agent and skill exist, their names must signal their layer:
   - Agent: `powershell-reviewer` (agent form; implies expertise/review)
   - Skill: `audit-powershell` (skill form; implies reusable workflow)

---

## Naming Checklist

Before creating a new asset, verify:

- [ ] **Length:** ≤ 20 chars for skills/instructions; ≤ 25 chars for agents
- [ ] **Pattern:** Matches the domain type (verb-domain, noun-domain, or domain)
- [ ] **Clarity:** Domain and intent unambiguous without consulting frontmatter
- [ ] **No conjunctions:** No "and" or compound "or" patterns (exception: `security-and-secure-coding` where both terms are essential)
- [ ] **No redundancy:** Not duplicating existing agent/skill/instruction with slightly different name
- [ ] **Portability:** Name remains meaningful in a different workspace/project
- [ ] **Consistency:** Not inventing a new pattern; aligns with peer artifacts in same layer

---

## Migration Guide

When consolidating existing assets:

1. **Rename files first.** Update folder and `.md` filename.
2. **Update frontmatter.** Change `name:` field to match new filename.
3. **Update all references.**
   - catalog/index files ([skill-discovery-index.md](./../skills/skill-discovery-index.md), [instruction-lifecycle-catalog.md](./instruction-lifecycle-catalog.md), [agent-lifecycle-catalog.md](./../agents/agent-lifecycle-catalog.md), [prompt-lifecycle-catalog.md](./../prompts/prompt-lifecycle-catalog.md))
   - `copilot-instructions.md` preferred lists
   - Internal skill references and `applyTo` patterns
   - Documentation links
4. **Verify language server indexing.** Wait a few seconds for rename to propagate, then check link references.
5. **Test retrieval.** Use assistant to invoke by new name; ensure no ambiguity.

---

## Examples: Before and After

| Asset Type | Before | After | Improvement |
|---|---|---|---|
| Skill | `benchmarkdotnet-performance-testing` | `perf-benchmark` | 20 chars → 14 chars; verb-domain clarity |
| Skill | `keeping-customizations-current` | `sync-customizations` | Gerund → action verb; 29 → 20 chars |
| Instruction | `architecture-ddd-and-domain.instructions.md` | `architecture.instructions.md` | Removes redundancy; 35 chars → 22 chars |
| Instruction | `csharp-development-and-standards.instructions.md` | `csharp.instructions.md` | "Development" implied by "standards"; 42 → 16 chars |
| Skill | `finishing-a-development-branch` | `branch-completion` | Wordy → concise action; 29 → 15 chars |
| Skill | `subagent-driven-development` | `task-execution` | Vague → clear intent; 26 → 14 chars |

---

## Documentation Corpus Naming (`.docs/`)

These rules apply to **all files and folders under `.docs/` and `.archive/`** in addition to `.github/` assets.

### Absolute Prohibitions

| Rule | Violation | Correct |
|---|---|---|
| **No date prefixes — ever** | `20260407-governance-audit.md` | `governance-audit.md` |
| **No date prefixes in folder names** | `20260408-dated-condense/` | `condense/` |
| **No hyphens in folder names** | `docs-archive/` | `archive/` |
| **Single word per folder level** | `skill-reviews/` | `skill/reviews/` |
| **File name must reflect content** | `README.md` used for a policy guide | `guide.md`, `policy.md`, or similar |

Date metadata belongs **inside** the file (frontmatter `date:` field or first-line heading), never in the filename or folder name. This rule has no exceptions, including archive folders.

### Reserved File Names

| Name | Permitted use |
|---|---|
| `README.md` | Folder entry-point guide only (what this folder is for, how to use it). |
| `INDEX.md` | Auto-generated corpus index. Do not edit manually. |

Any file that is a report, policy, plan, audit, or research record must have a descriptive kebab-case name, not `README.md`.

---

## References

- Skill discovery: [skill-discovery-index.md](./../skills/skill-discovery-index.md)
- Instruction catalog: [instruction-lifecycle-catalog.md](./instruction-lifecycle-catalog.md)
- Agent catalog: [agent-lifecycle-catalog.md](./../agents/agent-lifecycle-catalog.md)
- Prompt catalog: [prompt-lifecycle-catalog.md](./../prompts/prompt-lifecycle-catalog.md)
- Lifecycle governance: `lifecycle-governance.instructions.md`






