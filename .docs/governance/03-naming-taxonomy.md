# 03 · Naming & Taxonomy Governance

**Lane:** Execution  
**Primary Assets:** `governance-naming-conventions.instructions.md`, `asset-naming-taxonomy/SKILL.md`  
**Back to:** [Executive Summary](./executive-summary.md) · [INDEX](./INDEX.md)

---

## Purpose

Ensure every asset in the workspace is consistently named, classifiable, and discoverable. Inconsistent naming breaks catalog lookups, routing determinism, and agentic discovery. A new team member or agent must be able to find assets by lane and domain without reading every catalog table.

---

## The Four-Layer Classification Model

Every asset is classified across four layers:

| Layer | What It Classifies | Examples |
|---|---|---|
| **Type** | Structural form (path + extension) | Agent (`.agent.md`), Instruction (`.instructions.md`), Prompt (`.prompt.md`), Skill (`SKILL.md`) |
| **Lane** | Lifecycle phase | Planning, Execution, Review |
| **Domain** | Subject area | Governance, Engineering, Mobile, Data, DevOps, Documentation, Meta-workflow |
| **Function** | Action/verb aligned to lane | Review-lane verbs: audit, evaluate, assess · Execution-lane verbs: build, implement, scaffold |

---

## Naming Rules by Asset Type

### Skills
**Pattern:** `<verb>-<domain>` or `<noun>-<domain>`

Examples:
- `audit-agent` (verb: audit, domain: agent)
- `release-readiness` (noun: release, domain: readiness)
- `governance-delivery` (noun: governance, domain: delivery)

### Instructions
**Pattern:** `<domain>` or `<domain>-<policy>`

Examples:
- `governance-lifecycle`
- `governance-release`
- `secure-coding`
- `csharp`

### Agents
**Pattern:** `<domain>-<specialist>` (unless a single meta-role name is already unambiguous)

Examples:
- `architecture-designer`
- `security-researcher`
- `governance-briefer`
- `orchestrator` (single meta-role, name is unambiguous)

### Prompts
**Pattern:** `<verb>-<domain>` or `<domain>-<action>`

Examples:
- `audit-customization-types`
- `execute-customization-audit`
- `governance-audit-types`

### Documents and Folders
- **`.docs` paths:** lowercase kebab-case only
- **Date prefixes:** prohibited in file and folder names (dates go in content metadata, not filenames — prevents accumulation of `2026-01-15-report.md` style artifacts)
- **`README.md`:** reserved for true folder entry-point guidance only
- **`INDEX.md`:** reserved for generated navigable indexes

### Catalog and Index Files
Descriptive names; never use `README.md` for inventory or mapping content.

### `.docs/changes/` Folders
Folders under `.docs/changes/` that represent a skill, agent, instruction, or prompt must exactly match that asset's canonical catalog name.

---

## Vocabulary Drift

A name whose leading verb does not align with its catalog lane is a **vocabulary drift signal**. This is not automatically a violation, but requires:
1. Justification for the misalignment
2. Recording in `lane-intent.md`

**Example:** A skill named `generate-report` assigned to the Review lane would be a vocabulary drift signal — `generate` is an Execution-lane verb. The naming should either be changed to `evaluate-report` (review-lane verb) or the lane intent should be documented.

---

## Asset Naming Taxonomy Skill

The `asset-naming-taxonomy` skill enforces naming conventions across governance reports, customizations, documentation, and code artifacts.

**Trigger:** Defining or enforcing consistent naming taxonomy and conventions; onboarding new asset types; audit of existing asset naming health.

**Output:** Three artifacts:
1. **Naming taxonomy assessment grid** — every asset with current name, classification, and pass/fail
2. **Canonical naming map** — legacy name → canonical name for any misnamed assets
3. **Vocabulary drift signals table** — assets where leading verb and catalog lane do not align

---

## Governance Naming Conventions Instruction

`governance-naming-conventions.instructions.md` applies to `.github/**/*.md` — the specific subdirectory containing all customization assets.

**Instruction scope rationale:** This instruction targets `.github/**/*.md` (not `**`) because naming rules for customization assets differ from naming rules for documentation, code, or scripts. The instruction is domain-specific.

**Mandatory before creating new assets:** The instruction is flagged as requiring review before creating new agents, instructions, skills, or prompts. This prevents naming decisions from being made inconsistently in isolation.

---

## Integration Points

| Governance Type | Connection |
|---|---|
| [Customization Types](./02-customization-types.md) | TYP-S4 checks catalog and taxonomy parity as part of cross-type audit |
| [Lifecycle & Lanes](./04-lifecycle-lanes.md) | Vocabulary drift detection requires lane knowledge from catalogs |
| [Health & Audit Overview](./10-health-audit.md) | `test-naming-conformance.ps1` runs as part of `governance-audit` |
| [Cadenced Audits](./12-cadenced-audits.md) | Naming conformance is included in monthly light audit scope |
