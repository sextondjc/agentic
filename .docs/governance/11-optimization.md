# 11 · Optimization Governance

**Lane:** Review  
**Primary Asset:** `optimize-customizations/SKILL.md`  
**Back to:** [Executive Summary](./executive-summary.md) · [INDEX](./INDEX.md)

---

## Purpose

Evaluate and improve the authoring quality of agents, instructions, prompts, and skills — focusing on clarity, brevity, determinism, and cross-asset consistency. Optimization governance is distinct from compliance governance: it does not check whether assets follow mandatory standards (that is the job of the type-level audit skills), but whether they are written *well* within those standards.

---

## Why It Exists

Assets can be technically compliant yet still be poorly authored — vague triggers that cause underutilization, non-deterministic wording that produces different outputs across runs, role bleed that causes agents to drift into adjacent responsibilities, or cross-skill delegation that creates hidden dependency chains. Optimization governance catches these quality signals before they accumulate into systemic problems.

---

## Mandatory Standards (OPR-M\*)

| ID | Rule |
|---|---|
| OPR-M1 | **Scope purity** — one primary objective, no role bleed between responsibilities |
| OPR-M2 | **Deterministic wording** — directives are testable and concrete, not aspirational or ambiguous |
| OPR-M3 | **Non-contradiction** — content does not conflict with active governance instructions or catalogs |
| OPR-M4 | **No cross-skill delegation** in SKILL.md bodies — same as SKR-M4, enforced at the optimization level |

## Advisory Standards (OPR-S\*)

| ID | Rule |
|---|---|
| OPR-S1 | **Brevity** — economical wording; no redundant prose or duplicated content |
| OPR-S2 | **Reuse over duplication** — prefer referencing existing patterns to re-implementing them |
| OPR-S3 | **Output clarity** — required outputs are explicit and easily validated |

---

## What Is Evaluated

### Scope Purity (OPR-M1)
An agent or skill that performs two unrelated functions should be split. A skill that attempts to plan AND execute AND review in the same document has a scope purity failure. The check looks for multiple competing primary objectives within one asset.

### Deterministic Wording (OPR-M2)
Wording like "consider checking" or "may be useful to" produces non-deterministic outputs across runs. Optimized wording is specific: "check X using Y and record the result in Z." This standard is the authoring equivalent of the governance system's deterministic-by-default execution policy.

### Cross-Asset Consistency (OPR-M3)
An asset that defines a term differently from how the governance system defines it, or prescribes behavior that contradicts an active instruction file, is a contradiction violation. This catches drift between assets as the workspace evolves.

### Cross-Skill Delegation (OPR-M4)
Repeated from SKR-M4 because delegation errors are the most common quality gap and the most consequential: a skill that calls another skill creates a hidden dependency chain. Optimization governance enforces self-containment as both a compliance standard (SKR-M4) and a quality standard (OPR-M4).

---

## Workflow

1. Load the optimization factor template from `./references/optimization-factor-template.md`
2. For each asset in scope: apply OPR-M1 through OPR-M4, then OPR-S1 through OPR-S3
3. For each finding: record severity (MUST / SHOULD), file path, specific wording location, and recommended improvement
4. Produce the optimization factor output artifact

---

## Output Artifact

**Path:** `.docs/changes/customization/reviews/governance-audit-types-optimization.md`

**Template:** `./references/optimization-factor-template.md`

This artifact is one of the four required source artifacts consumed by `execute-customization-audit` and `governance-health-overview`. If it is absent or stale, those skills return PROVISIONAL-FAILED.

---

## Relationship to Type-Level Audit

Optimization governance runs alongside `audit-customization-types` as a companion — not a replacement. The type-level audit checks compliance (does the asset meet its type's mandatory standards?). Optimization checks quality (is it well-written within those standards?). Both outputs feed into the executive audit layer.

---

## Integration Points

| Governance Type | Connection |
|---|---|
| [Customization Types](./02-customization-types.md) | OPR-M4 duplicates SKR-M4 — both enforce self-containment |
| [Health & Audit Overview](./10-health-audit.md) | Optimization output is one of four required inputs to `governance-health-overview` |
| [Cadenced Audits](./12-cadenced-audits.md) | Quarterly full audit includes an optimization and drift audit section |
| [Naming & Taxonomy](./03-naming-taxonomy.md) | OPR-M3 contradiction check covers naming drift as a consistency violation |
