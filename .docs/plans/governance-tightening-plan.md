<!-- markdownlint-disable-file -->
# Governance Tightening Implementation Plan

> **For agentic workers:** REQUIRED WORKFLOW: Load and follow the `orchestrator` agent for intake, then hand off to `csharp-engineer` (scripts), the relevant authoring skill for SKILL.md edits, or `task-execution` for pure markdown/config tasks. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Close the governance gaps identified in the April 2026 deep review by adding missing audit entry points, formalizing prompt quality standards, extending automation coverage, and adding quantifiable metrics for utilization and temporal drift across all customization types.

**Architecture:** Nine independent workstreams ordered by priority. WS-01 through WS-03 are low-effort, high-impact authoring changes. WS-04 and WS-05 add new GOV-S* standards and PowerShell scripts. WS-06 and WS-07 extend existing scripts. WS-08 wires governance into CI. WS-09 tightens the health overview partial-run protocol. All workstreams are independently executable; P1 workstreams have no dependencies.

**Tech Stack:** Markdown (SKILL.md, .prompt.md, .instructions.md), PowerShell 7, GitHub Actions YAML.

---

## Required Grid A: Intent and Scope

| Plan ID | Goal | In Scope | Out of Scope | Assumptions | Constraints |
|---|---|---|---|---|---|
| PLAN-20260410-001 | Close governance gaps from April 2026 deep review | New audit prompts, PRR-M\*/PRR-S\* standards, violation legends, GOV-S9/S10 checks, naming scripts, source-catalog freshness script, CI workflow, partial-run protocol | Broad refactor of existing skill content beyond identified gaps | Existing governance layer (GOV-M\*, GOV-S\*, SKR-\*, INR-\*, AGR-\*, OPR-\*) is correct and remains unchanged | No existing artifact names may break |

---

## Required Grid B: Parallel Workstreams

| Workstream ID | Rec # | Title | Lane | Skill/Agent | Inputs | Outputs | Dependencies | Parallel Group |
|---|---|---|---|---|---|---|---|---|
| WS-01 | Rec 3 | Add violation legend to all audit output specs | Execution | skills-authoring / task-execution | 5 SKILL.md files | Legend grid in each skill's Required Outputs | None | P1 |
| WS-02 | Rec 1 | Create `agents-audit.prompt.md` | Execution | skills-authoring / task-execution | validate-customization SKILL.md, prompt-lifecycle-catalog.md | New .prompt.md + catalog row | None | P1 |
| WS-03 | Recs 2 & 4 | Create `prompts-audit.prompt.md` + PRR standards | Execution | skills-authoring / task-execution | optimize-customizations SKILL.md, prompt-lifecycle-catalog.md | New .prompt.md, PRR-M\*/S\* in validate-customization, catalog row | None | P1 |
| WS-04 | Rec 5 | Add GOV-S9 utilization check + script | Execution | csharp-engineer / task-execution | audit-governance SKILL.md, scripts/powershell/ | New test-utilization-coverage.ps1, GOV-S9 row in audit-governance | None | P1 |
| WS-05 | Rec 6 | Add GOV-S10 review recency check + script | Execution | csharp-engineer / task-execution | audit-governance SKILL.md, scripts/powershell/ | New test-review-recency.ps1, GOV-S10 row in audit-governance | None | P1 |
| WS-06 | Rec 7 | Extend naming conformance to `.github` assets | Execution | csharp-engineer / task-execution | test-naming-conformance.ps1, naming-conventions policy | Extended or new test-asset-naming.ps1, README update | None | P1 |
| WS-07 | Rec 8 | Script source catalog freshness validation | Execution | csharp-engineer / task-execution | sync-customizations + sync-skills source-catalog.md paths | New test-source-catalog-freshness.ps1, GOV-S advisory in audit-governance | None | P1 |
| WS-08 | Rec 9 | Create CI governance cadence workflow | Execution | task-execution | All test-*.ps1 scripts, governance-cadence.prompt.md | .github/workflows/governance-cadence.yml | WS-04, WS-05, WS-06, WS-07 must exist first | P2 |
| WS-09 | Rec 10 | Partial-run protocol for health overview | Execution | skills-authoring / task-execution | governance-health-overview SKILL.md | Updated Decision Rules section with PROVISIONAL-FAILED table | None | P1 |

---

## Required Grid C: Acceptance and Governance

| Workstream ID | Acceptance Criteria | Validation Evidence | Review Gate | Exit Decision ID |
|---|---|---|---|---|
| WS-01 | Legend grid present in Required Outputs of all 5 target skills | Manual inspection of audit-governance, skill-review, validate-customization, optimize-customizations, governance-health-overview SKILL.md | Required | DEC-01 |
| WS-02 | `agents-audit.prompt.md` exists; prompt-lifecycle-catalog.md has new row; AGR-M\*/S\* scope restrictions are explicit | File exists at `.github/prompts/agents-audit.prompt.md`; catalog row present | Required | DEC-02 |
| WS-03 | `prompts-audit.prompt.md` exists; PRR-M1–M4 and PRR-S1–S2 defined in validate-customization; catalog row present | File exists; standards table present; catalog row present | Required | DEC-03 |
| WS-04 | `test-utilization-coverage.ps1` exits 0/1 correctly; GOV-S9 row in audit-governance; scripts README updated | Run script from workspace root; inspect SKILL.md and README | Required | DEC-04 |
| WS-05 | `test-review-recency.ps1` exits 0/1 correctly; GOV-S10 row in audit-governance; scripts README updated | Run script from workspace root; inspect SKILL.md and README | Required | DEC-05 |
| WS-06 | Script validates `.github` asset names against naming-conventions patterns; emits per-violation grid; exits 1 on violations | Run script; verify it detects known good and known bad name patterns | Required | DEC-06 |
| WS-07 | `test-source-catalog-freshness.ps1` detects stale rows correctly; GOV advisory wired into audit-governance | Run script; inspect SKILL.md advisory addition | Required | DEC-07 |
| WS-08 | Workflow triggers on monthly schedule; runs all test-*.ps1 scripts; fails on exit 1 | Inspect YAML; validate workflow runs in Actions | Required | DEC-08 |
| WS-09 | Partial-run decision table present in governance-health-overview Decision Rules; PROVISIONAL-FAILED disposition defined for N-of-4 failures | Inspect SKILL.md Decision Rules section | Required | DEC-09 |

---

## Required Grid D: Session Survival Handoff

| Workstream ID | Status | Next Action | Blockers | Resume Prompt |
|---|---|---|---|---|
| WS-01 | Completed | No action required | None | "Run governance-health-overview to verify violation legend rendering" |
| WS-02 | Completed | No action required | None | "Run agents-audit.prompt.md to validate aggregate grid output" |
| WS-03 | Completed | No action required | None | "Run prompts-audit.prompt.md to validate PRR standards coverage" |
| WS-04 | Completed | No action required | None | "Execute test-utilization-coverage.ps1 during governance cadence" |
| WS-05 | Completed | No action required | None | "Execute test-review-recency.ps1 during governance cadence" |
| WS-06 | Completed | No action required | None | "Execute test-asset-naming.ps1 during governance cadence" |
| WS-07 | Completed | No action required | None | "Execute test-source-catalog-freshness.ps1 during governance cadence" |
| WS-08 | Completed | No action required | None | "Trigger .github/workflows/governance-cadence.yml manually for baseline evidence" |
| WS-09 | Completed | No action required | None | "Run governance-health-overview and verify partial-run disposition behavior" |

---

## Workstream Detail

---

### WS-01 — Violation Code Legend in All Audit Outputs

**Files to modify:**
- `.github/skills/audit-governance/SKILL.md` — Required Outputs section
- `.github/skills/skill-review/SKILL.md` — Required Outputs section
- `.github/skills/validate-customization/SKILL.md` — Required Outputs section
- `.github/skills/optimize-customizations/SKILL.md` — Required Outputs section
- `.github/skills/governance-health-overview/SKILL.md` — Required Outputs section

**Legend grid to add to each (edit codes to match the skill's own emitted codes):**

```markdown
#### Violation Code Legend

| Code Prefix | Standard | Type | Skill Source |
|---|---|---|---|
| GOV-M* | Mandatory governance check | MUST | audit-governance |
| GOV-S* | Advisory governance check | SHOULD | audit-governance |
| GOV-SK | Skill quality aggregate | Aggregate | skill-review |
| GOV-CUS | Customization quality aggregate | Aggregate | validate-customization |
| GOV-OPT | Optimization factor coverage | Aggregate | optimize-customizations |
| SKR-M* | Mandatory skill quality check | MUST | skill-review |
| SKR-S* | Advisory skill quality check | SHOULD | skill-review |
| INR-M* | Mandatory instruction quality check | MUST | validate-customization |
| INR-S* | Advisory instruction quality check | SHOULD | validate-customization |
| AGR-M* | Mandatory agent quality check | MUST | validate-customization |
| AGR-S* | Advisory agent quality check | SHOULD | validate-customization |
| PRR-M* | Mandatory prompt quality check | MUST | validate-customization |
| PRR-S* | Advisory prompt quality check | SHOULD | validate-customization |
| OPR-M* | Mandatory optimization quality check | MUST | optimize-customizations |
| OPR-S* | Advisory optimization quality check | SHOULD | optimize-customizations |
```

- [ ] Open `audit-governance/SKILL.md` and locate the **Required Outputs** section. Add the legend grid after the last output bullet.
- [ ] Open `skill-review/SKILL.md` and locate the **Required Outputs** section. Add the legend grid after the last output bullet.
- [ ] Open `validate-customization/SKILL.md` and locate the **Required Outputs** section. Add the legend grid after the last output bullet.
- [ ] Open `optimize-customizations/SKILL.md` and locate the **Required Outputs** section. Add the legend grid after the last output bullet.
- [ ] Open `governance-health-overview/SKILL.md` and locate the **Required Outputs** section. Add the legend grid after the last output bullet.
- [ ] Verify no existing legend conflicts; confirm all five files are updated.
- [ ] Mark WS-01 complete in Grid D.

---

### WS-02 — `agents-audit.prompt.md`

**Files to create:**
- `.github/prompts/agents-audit.prompt.md`

**Files to modify:**
- `.github/prompts/prompt-lifecycle-catalog.md` — add one row

**agents-audit.prompt.md content pattern:**

```markdown
---
name: agents-audit
description: 'Prompt for a deep review of all workspace agents against AGR standards, with per-agent reports and an aggregate grid result.'
---

# Full Workspace Agents Audit Prompt

Use the `validate-customization` skill to perform a deep review of every agent under `.github/agents/`.

## Scope

- Review all agents found in `.github/agents/*.agent.md`.
- Review date: today's date in `YYYY-MM-DD` format.
- Apply AGR-M* and AGR-S* standards only.

## Required Actions

1. Load and follow [SKILL.md](./../skills/validate-customization/SKILL.md) before beginning.
2. For each agent file:
   - Evaluate all AGR-M* (MUST) and AGR-S* (SHOULD) standards with evidence.
   - Write a per-agent review report to `.docs/changes/customization/reviews/agents/<agent-name>/review.md`.
   - Append a history row to `.docs/changes/customization/reviews/audit-history.md`.
3. After all agents are reviewed, produce the aggregate grid output in chat.

## Output Requirements

Return the following in chat, in this order:

### Aggregate Outcome Grid

| Metric | Value |
|---|---|
| Review Date | YYYY-MM-DD |
| Total Agents Reviewed | N |
| Pass | N |
| Pass With Advisories | N |
| Fail | N |
| Total MUST Failures | N |
| Total SHOULD Advisories | N |

### Per-Agent Results Grid

| Agent | Outcome | MUST Failures | SHOULD Advisories | Conflict Status | Report |
|---|---|---:|---:|---|---|
| <agent-name> | Pass/Pass With Advisories/Fail | N | N | None/Detected/Resolved | <report-path> |

- Grids only. No per-agent prose summaries.
- If any agent fails, list actionable remediation steps below the grid.
- Include the Violation Code Legend from the validate-customization skill output spec.

## Artifact Locations

| Artifact | Location |
|---|---|
| Per-agent reports | `.docs/changes/customization/reviews/agents/<agent-name>/review.md` |
| Aggregate history | `.docs/changes/customization/reviews/audit-history.md` |
```

- [ ] Create `.github/prompts/agents-audit.prompt.md` with the above content.
- [ ] Add the following row to the prompt mapping table in `prompt-lifecycle-catalog.md`:
  ```
  | `agents-audit` | `agents-audit.prompt.md` | Review | Planning | Runs a deep, report-only audit of agent files against AGR standards with per-agent reports and aggregate grid. |
  ```
- [ ] Verify the catalog file entry is syntactically valid.
- [ ] Mark WS-02 complete in Grid D.

---

### WS-03 — `prompts-audit.prompt.md` + PRR-M\*/S\* Standards

**Files to create:**
- `.github/prompts/prompts-audit.prompt.md`

**Files to modify:**
- `.github/skills/validate-customization/SKILL.md` — add PRR-M\*/S\* standards table
- `.github/prompts/prompt-lifecycle-catalog.md` — add one row

**PRR standards table to add to validate-customization SKILL.md (after the AGR standards table, before Trigger Conditions):**

```markdown
## Review Standards — Prompt Files

| ID | Standard | Type | Pass Criteria | Failure Action |
|---|---|---|---|---|
| PRR-M1 | Singular purpose | MUST | Prompt targets one repeatable workflow task only. | Mark failed; recommend purpose split. |
| PRR-M2 | Valid frontmatter | MUST | `name` and `description` present; valid YAML. | Mark failed; provide exact frontmatter fix. |
| PRR-M3 | Output format declared | MUST | Required output structure is explicitly defined in the prompt body. | Mark failed; recommend adding output requirements section. |
| PRR-M4 | Skill routing present | MUST | Prompt explicitly routes to a named skill via `Load and follow [SKILL.md]` or equivalent. | Mark failed; recommend adding a skill routing directive. |
| PRR-S1 | No conflict with other prompts | SHOULD NOT conflict | No harmful overlap or duplicate trigger conditions with other active prompts. | Start conflict workflow; document resolution plan. |
| PRR-S2 | Brevity | SHOULD | Wording is economical; no narrative padding beyond routing and output clarity. | Record advisory finding; recommend concise reductions. |
```

**prompts-audit.prompt.md content pattern:**

```markdown
---
name: prompts-audit
description: 'Prompt for a deep review of all workspace prompts against PRR standards, with per-prompt reports and an aggregate grid result.'
---

# Full Workspace Prompts Audit Prompt

Use the `validate-customization` skill to perform a deep review of every prompt under `.github/prompts/`.

## Scope

- Review all prompts found in `.github/prompts/*.prompt.md`.
- Review date: today's date in `YYYY-MM-DD` format.
- Apply PRR-M* and PRR-S* standards only.

## Required Actions

1. Load and follow [SKILL.md](./../skills/validate-customization/SKILL.md) before beginning.
2. For each prompt file:
   - Evaluate all PRR-M* (MUST) and PRR-S* (SHOULD) standards with evidence.
   - Write a per-prompt review report to `.docs/changes/customization/reviews/prompts/<prompt-name>/review.md`.
   - Append a history row to `.docs/changes/customization/reviews/audit-history.md`.
3. After all prompts are reviewed, produce the aggregate grid output in chat.

## Output Requirements

Return the following in chat, in this order:

### Aggregate Outcome Grid

| Metric | Value |
|---|---|
| Review Date | YYYY-MM-DD |
| Total Prompts Reviewed | N |
| Pass | N |
| Pass With Advisories | N |
| Fail | N |
| Total MUST Failures | N |
| Total SHOULD Advisories | N |

### Per-Prompt Results Grid

| Prompt | Outcome | MUST Failures | SHOULD Advisories | Conflict Status | Report |
|---|---|---:|---:|---|---|
| <prompt-name> | Pass/Pass With Advisories/Fail | N | N | None/Detected/Resolved | <report-path> |

- Grids only. No per-prompt prose summaries.
- If any prompt fails, list actionable remediation steps below the grid.
- Include the Violation Code Legend from the validate-customization skill output spec.

## Artifact Locations

| Artifact | Location |
|---|---|
| Per-prompt reports | `.docs/changes/customization/reviews/prompts/<prompt-name>/review.md` |
| Aggregate history | `.docs/changes/customization/reviews/audit-history.md` |
```

- [ ] Add the PRR-M\*/S\* standards table to `validate-customization/SKILL.md` between the AGR standards table and the Trigger Conditions section.
- [ ] Update the `validate-customization/SKILL.md` Trigger Conditions to include: "A new `.prompt.md` is created or modified" and "A periodic quality audit of prompts is requested."
- [ ] Create `.github/prompts/prompts-audit.prompt.md` with the above content.
- [ ] Add the following row to `prompt-lifecycle-catalog.md`:
  ```
  | `prompts-audit` | `prompts-audit.prompt.md` | Review | Planning | Runs a deep, report-only audit of prompt files against PRR standards with per-prompt reports and aggregate grid. |
  ```
- [ ] Verify all modified files are syntactically valid.
- [ ] Mark WS-03 complete in Grid D.

---

### WS-04 — GOV-S9 Utilization Check + `test-utilization-coverage.ps1`

**Files to create:**
- `.github/scripts/powershell/test-utilization-coverage.ps1`

**Files to modify:**
- `.github/skills/audit-governance/SKILL.md` — add GOV-S9 to Standards section and Script Integration
- `.github/scripts/powershell/README.md` — add script row

**Script behavior:**
1. Discover all skill names from `skill-discovery-index.md` (parse the `| Skill |` column).
2. For each skill, search for references in `.github/agents/*.agent.md`, `.github/prompts/*.prompt.md`, and `.github/skills/*/SKILL.md` (excluding the skill's own SKILL.md).
3. Emit a PSCustomObject grid: `[SkillName, ReferenceCount, ReferencedBy, Status]` where Status is `In Use` (≥1) or `Orphaned` (0).
4. Exit 1 if any skills are Orphaned; exit 0 otherwise.

**GOV-S9 entry to add in audit-governance SKILL.md Standards section:**
```
- GOV-S9: utilization coverage — every skill in skill-discovery-index.md is referenced by at least one agent or prompt outside its own SKILL.md
```

- [ ] Write `test-utilization-coverage.ps1` per the behavior above. Use `[ValidateSet]` on any parameters. Target <50 lines. Output PSCustomObject per script standards.
- [ ] Add GOV-S9 to the Standards section in `audit-governance/SKILL.md`.
- [ ] Add `test-utilization-coverage.ps1` to the Script Integration list in `audit-governance/SKILL.md`.
- [ ] Add the script row to `scripts/powershell/README.md`.
- [ ] Run the script from workspace root and verify exit code and output format are correct.
- [ ] Mark WS-04 complete in Grid D.

---

### WS-05 — GOV-S10 Review Recency Check + `test-review-recency.ps1`

**Files to create:**
- `.github/scripts/powershell/test-review-recency.ps1`

**Files to modify:**
- `.github/skills/audit-governance/SKILL.md` — add GOV-S10 to Standards section and Script Integration
- `.github/scripts/powershell/README.md` — add script row

**Script behavior:**
1. Accept `-ThresholdDays` parameter (default: 90).
2. Discover per-skill history files at `.github/skills/skill-review/references/history/<skill>-history.md`.
3. For each history file, parse the last review date from the most recent row.
4. Compute days since last review; flag as `Overdue` if > threshold.
5. Emit a grid: `[Asset, Type, LastReviewDate, DaysSinceReview, Status]`.
6. Exit 1 if any assets are Overdue; exit 0 otherwise.

**GOV-S10 entry to add in audit-governance SKILL.md:**
```
- GOV-S10: review recency — no skill or agent history file has a last review date older than 90 days
```

- [ ] Write `test-review-recency.ps1` per the behavior above. Target <50 lines. Output PSCustomObject per script standards.
- [ ] Add GOV-S10 to the Standards section in `audit-governance/SKILL.md`.
- [ ] Add `test-review-recency.ps1` to the Script Integration list in `audit-governance/SKILL.md`.
- [ ] Add the script row to `scripts/powershell/README.md`.
- [ ] Run the script from workspace root and verify output format is correct.
- [ ] Mark WS-05 complete in Grid D.

---

### WS-06 — Extend Naming Conformance to `.github` Assets

**Files to create:**
- `.github/scripts/powershell/test-asset-naming.ps1`

**Files to modify:**
- `.github/scripts/powershell/README.md` — add script row

**Script behavior:**
1. Accept `-AssetType` parameter with `[ValidateSet('skills', 'agents', 'instructions', 'prompts', 'all')]` (default: `all`).
2. Per type, validate names against the naming-conventions policy patterns:
   - skills: `^[a-z]+(-[a-z]+)+$` (verb-domain or noun-domain, lowercase kebab)
   - agents: `^[a-z]+(-[a-z]+)+$` (domain-specialist, lowercase kebab)
   - instructions: `^[a-z]+(-[a-z]+)*\.instructions\.md$` (domain or domain-policy)
   - prompts: `^[a-z]+(-[a-z]+)+\.prompt\.md$` (verb-domain or domain-action)
3. Emit a PSCustomObject grid: `[AssetType, AssetName, Pattern, Status, Violation]`.
4. Exit 1 if any naming violations are found; exit 0 otherwise.

- [ ] Write `test-asset-naming.ps1` per the behavior above. Target <60 lines. Output PSCustomObject per script standards.
- [ ] Add `test-asset-naming.ps1` to `scripts/powershell/README.md` in the Script Catalog table.
- [ ] Run the script against the workspace and verify existing assets pass and that the script correctly identifies a deliberately bad test name.
- [ ] Mark WS-06 complete in Grid D.

---

### WS-07 — Source Catalog Freshness Script

**Files to create:**
- `.github/scripts/powershell/test-source-catalog-freshness.ps1`

**Files to modify:**
- `.github/skills/audit-governance/SKILL.md` — add GOV-S advisory for this check
- `.github/scripts/powershell/README.md` — add script row

**Script behavior:**
1. Accept `-ThresholdDays` parameter (default: 30).
2. Locate source catalog files at:
   - `.github/skills/sync-customizations/references/source-catalog.md`
   - `.github/skills/sync-skills/references/source-catalog.md`
3. For each catalog, parse `Last Evaluated` column from all rows.
4. Flag rows with a date older than threshold as `Needs Review`; flag missing file as a `Missing Catalog` violation.
5. Emit a grid: `[Catalog, Source, LastEvaluated, DaysOverdue, Status]`.
6. Exit 1 if any rows are stale or a catalog is missing; exit 0 otherwise.

- [ ] Write `test-source-catalog-freshness.ps1` per the behavior above. Target <60 lines.
- [ ] Add a GOV-S advisory note to `audit-governance/SKILL.md` stating: "Use `test-source-catalog-freshness.ps1` to verify sync-customizations and sync-skills source catalogs have no rows exceeding the 30-day freshness threshold."
- [ ] Add the script row to `scripts/powershell/README.md`.
- [ ] Run the script and verify exit code behavior is correct.
- [ ] Mark WS-07 complete in Grid D.

---

### WS-08 — CI Governance Cadence Workflow

**Files to create:**
- `.github/workflows/governance-cadence.yml`

**Workflow behavior:**
- Trigger: `schedule` (first day of each month at 08:00 UTC) + `workflow_dispatch` for manual runs.
- Runs on: `ubuntu-latest` or `windows-latest` (prefer windows-latest since scripts are PowerShell 7).
- Steps:
  1. Checkout repository.
  2. Run each governance script in sequence from workspace root; fail fast on any non-zero exit.
  3. Upload script output as a workflow artifact named `governance-report`.

**Scripts to run in sequence:**
1. `test-frontmatter-validity.ps1 -AssetType 'all'`
2. `test-catalog-integrity.ps1 -AssetType 'all'`
3. `test-hub-file-sync.ps1`
4. `test-governance-link-graph.ps1`
5. `test-governance-artifact-contract.ps1`
6. `test-governance-optimization-factor.ps1`
7. `test-naming-conformance.ps1`
8. `test-asset-naming.ps1` _(added by WS-06)_
9. `test-utilization-coverage.ps1` _(added by WS-04)_
10. `test-review-recency.ps1` _(added by WS-05)_
11. `test-source-catalog-freshness.ps1` _(added by WS-07)_

> **Dependency:** WS-04, WS-05, WS-06, WS-07 must all be complete before WS-08. The YAML references these new scripts.

- [ ] Verify all scripts from WS-04 through WS-07 are present and exit-code-correct before authoring the workflow.
- [ ] Create `.github/workflows/governance-cadence.yml` with the schedule trigger, sequential script execution, and artifact upload.
- [ ] Validate YAML is syntactically correct (use `actionlint` or equivalent if available; otherwise inspect manually).
- [ ] Update `governance-cadence.prompt.md` to remove the "CI-based trigger is on the backlog" note and replace it with a reference to the new workflow file.
- [ ] Mark WS-08 complete in Grid D.

---

### WS-09 — Partial-Run Protocol for Health Overview

**Files to modify:**
- `.github/skills/governance-health-overview/SKILL.md` — extend Decision Rules section

**Content to add in Decision Rules:**

```markdown
### Partial-Run Decision Table

| Sub-Skills Completed | Disposition | Action Required |
|---|---|---|
| 4 of 4 | Normal PASSED or FAILED based on MUST/conflict rules | None |
| 3 of 4 | PROVISIONAL-FAILED | Report which sub-skill failed; cite its blocker; do not aggregate from missing output |
| 2 of 4 | PROVISIONAL-FAILED | Same as above; escalate if core governance (audit-governance) is the missing sub-skill |
| 1 of 4 | PROVISIONAL-FAILED | Triage environment issue before retry |
| 0 of 4 | Not reported | Abort run; report tool failure to user before producing any output |

- A PROVISIONAL-FAILED disposition does not imply quality failure; it signals incomplete evidence.
- Retry with `fresh-run required` after resolving the blocker before promoting to a final disposition.
- If `audit-governance` fails, the overall run always emits PROVISIONAL-FAILED regardless of other sub-skill outcomes.
```

- [ ] Open `governance-health-overview/SKILL.md` and locate the **Decision Rules** section.
- [ ] Add the Partial-Run Decision Table after the existing bullet rules.
- [ ] Verify the table renders correctly in markdown; confirm no existing rules were removed or altered.
- [ ] Mark WS-09 complete in Grid D.

---

## Governance Notes

- This plan is owned by the **Execution** lane with **Review** gate at each workstream exit.
- Update Grid D (workstream status) at the start of each session to reflect completed items before executing the next step.
- WS-08 is the only workstream with strict upstream dependencies; all others can execute in parallel.
- Use `task-execution` or direct `csharp-engineer` routing for each workstream. Do not batch across workstream boundaries in one session without confirming all prior completion criteria.
- After all workstreams complete, run `governance-cadence.prompt.md` to confirm the governance layer passes the full check cycle with the new additions in place.
