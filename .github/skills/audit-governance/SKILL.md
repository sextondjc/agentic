---
name: audit-governance
description: Use when assessing the workspace governance layer as a whole — describing what governance is in place, identifying weaknesses and risks across instructions, agents, skills, prompts, and catalog integrity, and producing ranked remediation recommendations.
---

# Audit Governance

## Singular Purpose

Assess the workspace governance system holistically and produce a structured health report covering coverage, coherence, catalog integrity, traceability, and cadence risk.

This skill has one purpose: workspace-level governance health assessment. It does not audit individual artifacts in isolation — use `skill-review` for individual skills and `validate-customization` for individual instruction or agent files.

## Normative Language

- MUST: Mandatory check included in every governance audit run.
- SHOULD: Advisory check included unless explicitly scoped out.

---

## Review Standards

| ID | Standard | Type | Pass Criteria | Failure Action |
|---|---|---|---|---|
| GOV-M1 | Lane coverage complete | MUST | All three lifecycle lanes (Planning, Execution, Review) have at least one agent and at least one skill assigned. | Record coverage gap; map what is missing per lane. |
| GOV-M2 | Instruction frontmatter valid | MUST | Every `.instructions.md` file has a valid opening `---` delimiter, `name`, `description`, and `applyTo` fields. | Record broken file(s) with exact fix. |
| GOV-M3 | Catalog integrity | MUST | Every agent in `.github/agents/`, skill in `.github/skills/`, instruction in `.github/instructions/`, and prompt in `.github/prompts/` has a corresponding row in its README catalog. No orphaned assets or stale catalog rows exist. | Record mismatches with add/remove recommendations. |
| GOV-M4 | Governance instruction coverage | MUST | `lifecycle-governance.instructions.md` `applyTo` pattern covers the primary governed output paths — `.docs/**/*.md` plan and change artifacts must be in scope. | Recommend corrected `applyTo` pattern. |
| GOV-S1 | Traceability ID usage | SHOULD | At least one plan artifact under `.docs/plans/` uses the defined ID scheme (`PLAN-*`, `WS-*`, `DEC-*`). | Record advisory; recommend traceability ID adoption. |
| GOV-S2 | ADR directory exists | SHOULD | `.docs/adr/` directory exists with at least a README. | Record advisory; recommend creating the directory. |
| GOV-S3 | Change history is indexed | SHOULD | `.docs/changes/` has a README or index linking its subdirectories. | Record advisory; recommend creating an index. |
| GOV-S4 | Review cadence mechanism | SHOULD | A CI workflow, scheduled prompt, or dated audit artifact triggers periodic skill and instruction review. | Record advisory; recommend cadence artifact. |
| GOV-S5 | Taxonomy currency | SHOULD | `customization-taxonomy-v1.md` (or equivalent) is not in draft status and is consistent with README catalog lane assignments. | Record advisory; recommend taxonomy promotion or catalog alignment. |
| GOV-S6 | No orphaned governance documents | SHOULD | All governance reference documents under `.docs/reference/` and `.docs/` are linked from at least one catalog or index. | Record advisory for each unlinked document. |
| GOV-S7 | Hub file freshness | SHOULD | `copilot-instructions.md` preferred agent and skill lists match the current contents of `.github/agents/` and `.github/skills/`. | Record advisory with diverging entries. |

---

## Trigger Conditions

Invoke this skill when any of the following is true:

- A user asks to describe, assess, or audit the workspace governance.
- A user asks what governance is available and requests identification of weaknesses or risks.
- After a major workspace restructuring (new agents, bulk skill changes, instruction merges).
- Periodically as part of governance maintenance cadence.
- Before importing external assets to understand current health baseline.

---

## Inputs

Required:
- Workspace root path.
- Audit date (YYYY-MM-DD).

Optional:
- Scope filter: `instructions`, `agents`, `skills`, `prompts`, `catalogs`, `traceability`, or `all` (default `all`).
- Previous audit report path for regression comparison.

---

## Required Outputs

- A governance health report stored at `.docs/changes/governance-audits/YYYYMMDD-governance-audit.md`.
- Summary grid with one row per GOV-M* and GOV-S* standard showing: Standard ID, Check, Outcome, Evidence, Severity.
- Coverage grid showing per-lane agent and skill counts.
- Catalog integrity grid showing asset counts per type with orphan/stale row counts.
- Ranked recommendations table with: Recommendation ID, Action, Fixes, Priority.
- All grids produced before any narrative text.

---

## Workflow

1. Resolve workspace root and collect asset inventory:
   - List all files in `.github/agents/`, `.github/instructions/`, `.github/skills/`, `.github/prompts/`.
   - Read README catalogs: `.github/agents/README.md`, `.github/skills/README.md`, `.github/instructions/README.md`, `.github/prompts/README.md`.
   - Read `copilot-instructions.md`.
   - Read `.docs/reference/planning-execution-review-governance.md` for traceability ID scheme.
   - Read `.docs/reference/customization-taxonomy-v1.md` for classification reference.
2. Evaluate GOV-M* standards first (mandatory coverage, frontmatter, catalog integrity, applyTo scope).
3. Evaluate GOV-S* standards (traceability, directories, cadence, taxonomy, hub freshness).
4. For each failing MUST check, record severity as **High**.
5. For each advisory SHOULD check, record severity as **Medium** or **Low** based on impact.
6. Produce the governance health report in the required output format.
7. Present results with grids first, followed by concise narrative.

---

## Output Format Rules

- MUST return results in Markdown grid format.
- MUST present a consolidated standards grid with columns: `ID`, `Standard`, `Outcome`, `Evidence`, `Severity`.
- MUST present a ranked recommendations table with columns: `ID`, `Action`, `Fixes`, `Priority`.
- SHOULD present a coverage grid before the standards grid.
- SHOULD include an aggregate metrics row at the end of the standards grid: total MUST Pass, MUST Fail, SHOULD Pass, SHOULD Advisory.
- Keep narrative after grids and concise.

---

## Storage Rules

- Store governance audit reports under `.docs/changes/governance-audits/`.
- Use file naming format: `YYYYMMDD-governance-audit.md`.
- Retain prior governance audits; do not overwrite.

---

## Companion Skills

- `validate-customization` — for per-artifact instruction and agent file review when GOV-M2 or GOV-M4 failures are found.
- `skill-review` — for per-skill review when catalog integrity gaps or invocation failures are found.
- `sync-customizations` — for remediating stale customization content identified by GOV-S7.
- `sync-skills` — for remediating stale skill content identified by GOV-S1 or GOV-S4.
- `customization-authoring` — for fixing frontmatter defects identified by GOV-M2.

---

## Done Criteria

An audit is complete only when:

- All GOV-M* and GOV-S* checks were executed with evidence.
- The governance health report was written to the required path.
- Every MUST failure has an explicit recommendation with priority.
- Every SHOULD advisory has a recommendation or an explicit acceptance note.
