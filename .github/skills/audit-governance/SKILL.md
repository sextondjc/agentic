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

Governance audit standards are organized in three groups: **Core Governance (GOV-M*/S*)**, **Skill Quality (GOV-SK*)**, and **Customization Quality (GOV-CUS*)**.

### Core Governance Standards

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

### Skill Quality Standards (Integrated from skill-review)

| ID | Standard | Type | Applies To | Pass Criteria | Failure Action |
|---|---|---|---|---|---|
| GOV-SK1 | Skill singular purpose | MUST | All skills | Skill scope maps to one objective only. | Record failed skill and recommend scope split. |
| GOV-SK2 | Skill format and frontmatter | MUST | All skills | Valid YAML frontmatter with name, description; Markdown structure is valid. | Record failed skill and provide exact fix. |
| GOV-SK3 | Skill invocation clarity | MUST | All skills | Clear discovery triggers and concrete use conditions in description and body. | Record failed skill and provide trigger rewrite. |
| GOV-SK4 | Skill references | SHOULD | All skills | Skill has concrete references or reusable assets referenced for execution support. | Record advisory; recommend adding asset references. |

### Customization Quality Standards (Integrated from validate-customization)

| ID | Standard | Type | Applies To | Pass Criteria | Failure Action |
|---|---|---|---|---|---|
| GOV-CUS1 | Instruction domain singular | MUST | All `.instructions.md` files | Single policy domain per file; no mixed concerns. | Record failed file; recommend domain split. |
| GOV-CUS2 | Instruction frontmatter complete | MUST | All `.instructions.md` files | `name`, `description`, `applyTo` present and valid YAML. | Record failed file; provide frontmatter fix. |
| GOV-CUS3 | Instruction applyTo properly scoped | MUST | All `.instructions.md` files | Pattern is not broader than policy requires. | Record failed file; recommend tighter pattern. |
| GOV-CUS4 | No task workflow in instructions | MUST | All `.instructions.md` files | No multi-step decision trees; policy mandates only. | Record failed file; recommend migrating to skill. |
| GOV-CUS5 | Agent singular purpose | MUST | All `.agent.md` files | Agent scope maps to one role lane only. | Record failed file; recommend scope split. |
| GOV-CUS6 | Agent frontmatter complete | MUST | All `.agent.md` files | `name` and `description` present; valid YAML. | Record failed file; provide frontmatter fix. |
| GOV-CUS7 | Agent has singular purpose section | MUST | All `.agent.md` files | `## Singular Purpose` section exists and declares what the agent does and does not do. | Record failed file; provide section guidance. |
| GOV-CUS8 | No instruction restatement in agents | MUST | All `.agent.md` files | Agent body references instruction files rather than restating their content inline. | Record failed file; recommend replacing inline rules with references. |
| GOV-CUS9 | Instruction or agent conflicts | MUST | All customizations | No harmful overlap or contradictory guidance with other active customizations. | Record conflict and start resolution workflow. |
| GOV-CUS10 | Agent companion skills declared | SHOULD | All `.agent.md` files | `## Preferred Companion Skills` section present with at least one entry. | Record advisory; recommend companion skill list. |

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

1. **Core governance audit** (existing):
   - Resolve workspace root and collect asset inventory.
   - List all files in `.github/agents/`, `.github/instructions/`, `.github/skills/`, `.github/prompts/`.
   - Read README catalogs and `copilot-instructions.md`.
   - Read [planning-execution-review-governance.md](./../../../.docs/reference/planning-execution-review-governance.md) and [customization-taxonomy-v1.md](./../../../.docs/reference/customization-taxonomy-v1.md).
   - Evaluate GOV-M* standards first (mandatory coverage, frontmatter, catalog integrity, applyTo scope).
   - Evaluate GOV-S* standards (traceability, directories, cadence, taxonomy, hub freshness).

2. **Skill quality audit** (new):
   - List all skills in `.github/skills/` (directories and SKILL.md files).
   - For each skill, check GOV-SK1 through GOV-SK4 standards.
   - Record pass/fail outcome per skill.
   - Collect all skills with GOV-SK failures for detailed reporting.

3. **Customization quality audit** (new):
   - List all `.instructions.md` files in `.github/instructions/`.
   - List all `.agent.md` files in `.github/agents/`.
   - For instruction files, check GOV-CUS1 through GOV-CUS9 standards.
   - For agent files, check GOV-CUS5 through GOV-CUS10 standards.
   - Detect potential conflicts between customizations (GOV-CUS9).
   - Record pass/fail outcome per customization artifact.
   - Collect all customizations with GOV-CUS failures for detailed reporting.

4. **Severity classification**:
   - For each failing MUST check, record severity as **High**.
   - For each advisory SHOULD check, record severity as **Medium** or **Low** based on impact.
   - If any skill or customization fails a GOV-SK or GOV-CUS MUST check, mark the overall audit as **Failed** with collected evidence.

5. Produce the governance health report in the required output format (see Output Format Rules).

---

## Automation via Script Library

Use reusable scripts from `.github/scripts/powershell/` to avoid redundant audit code:

- **`get-lane-counts.ps1`**: Count agents/skills per lane; use for GOV-M1 coverage verification.
- **`test-catalog-integrity.ps1`**: Detect catalog mismatches; use for GOV-M3 integrity check.
- **`test-frontmatter-validity.ps1`**: Validate instruction frontmatter; use for GOV-M2 check.
- **`test-hub-file-sync.ps1`**: Verify copilot-instructions.md alignment; use for GOV-S7.

All scripts must be invoked from workspace root. Use `Push-Location` before calling scripts.

---

## Output Format Rules

- MUST return results in Markdown grid format.
- MUST present a consolidated standards grid with columns: `ID`, `Standard`, `Outcome`, `Evidence`, `Severity` for **Core Governance** (GOV-M*, GOV-S*).
- MUST present a **Skill Quality Summary Grid** with columns: `Skill`, `Outcome`, `Failures`, `Advisories` — listing only skills with non-passing outcomes.
- MUST present a **Customization Quality Summary Grid** with columns: `Artifact`, `Type`, `Outcome`, `Failures`, `Advisories` — listing only customizations with non-passing outcomes.
- SHOULD present a coverage grid before the standards grid showing agents/skills per lane.
- SHOULD include an aggregate metrics row summarizing: Audit Date, total GOV-M Pass/Fail, total GOV-S Pass/Advisory, total GOV-SK Pass/Fail, total GOV-CUS Pass/Fail.
- SHOULD include failure details grid for each non-passing skill and customization, showing which specific checks failed and why.
- Keep narrative after grids and concise.
- **Critical**: If any GOV-SK or GOV-CUS MUST check fails, the audit outcome is **FAILED** — record this explicitly in the disposition.

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
- All GOV-SK* checks were executed against every workspace skill with evidence.
- All GOV-CUS* checks were executed against every workspace instruction and agent file with evidence.
- The governance health report was written to the required path.
- Every MUST failure (GOV-M*, GOV-SK*, GOV-CUS*) has explicit evidence and is included in recommendations.
- Every SHOULD advisory has a recommendation or an explicit acceptance note.
- Skill and customization quality summary grids list only non-passing outcomes with failure details.
- Overall audit outcome correctly reflects: **PASSED** if all MUST checks pass across all three audit groups, or **FAILED** if any MUST check fails.
