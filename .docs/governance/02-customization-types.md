# 02 · Customization Type Governance

**Lane:** Review  
**Primary Assets:** `audit-agent`, `audit-instructions`, `audit-skill`, `audit-prompts`, `audit-customization-types`  
**Back to:** [Executive Summary](./executive-summary.md) · [INDEX](./INDEX.md)

---

## Purpose

Evaluate the quality, boundary compliance, and correctness of every customization asset in the workspace: agents (`.agent.md`), instructions (`.instructions.md`), skills (`SKILL.md`), and prompts (`.prompt.md`). Each type has its own mandatory standards and audit skill; a fifth skill audits cross-type interactions.

---

## The Five Audit Skills

### 2.1 Agent Governance — `audit-agent`

Agents are specialist personas with a singular role, hard constraints, and a discovery-focused description.

**Output paths:**
- Per-agent review: `.docs/changes/agent/reviews/<agent-name>/review.md`
- Per-agent history: `.docs/changes/agent/history/<agent-name>-history.md`
- Conflict artifacts: `.docs/changes/agent/conflicts/`

**Mandatory standards (AGR-M\*):**

| ID | Rule |
|---|---|
| AGR-M1 | Singular role — one responsibility, no mixed functions |
| AGR-M2 | Valid YAML frontmatter with `name` and `description`; `## Specialization` section present |
| AGR-M3 | `description` is third-person, invocation-focused — not a workflow summary |
| AGR-M4 | `## Hard Constraints` section present; explicitly defines what the agent will not do |

**Advisory standards (AGR-S\*):**

| ID | Rule |
|---|---|
| AGR-S1 | All required sections present: Specialization, Focus Areas, Standards, Hard Constraints, Preferred Companion Skills |
| AGR-S2 | No hardcoded cross-agent delegation or required-sub-agent directives |
| AGR-S3 | No harmful role overlap or contradictory behavior with sibling agents |
| AGR-S4 | Growth governance alignment: reuse-before-create, anti-duplication |
| AGR-S5 | Platform currency: frontmatter aligned with current VS Code custom agent spec |

**Audit workflow:**
1. Collect agent files in scope
2. Load per-agent history file; build deny-list from rejected recommendations
3. Re-evaluate source catalog (BLOCKING — must precede findings)
4. Run all AGR-M*/AGR-S* checks
5. Update history file
6. Produce review report

**Critical rule:** The source catalog (`./references/source-catalog.md`) must be read BEFORE producing any platform-specific findings. This prevents recommendations from drifting against actual current VS Code agent behavior.

---

### 2.2 Instruction Governance — `audit-instructions`

Instructions are always-on policy rules. They must never contain workflow procedures.

**Output paths:**
- Per-instruction review: `.docs/changes/instruction/reviews/<instruction-name>/review.md`
- Per-instruction history: `.docs/changes/instruction/history/<instruction-name>-history.md`

**Mandatory standards (INR-M\*):**

| ID | Rule |
|---|---|
| INR-M1 | Singular policy domain — one subject area per file |
| INR-M2 | Valid frontmatter with `name`, `description`, `applyTo` |
| INR-M3 | `applyTo` not broader than policy requires; `**` only for truly global rules that need global enforcement |
| INR-M4 | No task workflow content — multi-step procedures belong in skills |

**Advisory standards (INR-S\*):**

| ID | Rule |
|---|---|
| INR-S1 | No conflict with other instruction files |
| INR-S2 | Non-obvious rules include a brief rationale |
| INR-S3 | No conflict with agent or skill boundaries |
| INR-S4 | Economical wording — brevity |
| INR-S5 | Growth governance alignment |

**Key design rule:** Three instruction files intentionally use `applyTo: '**'` (global scope): `governance-release`, `request-economy`, and `secure-coding`. Each file includes an explicit rationale for why narrower scoping would create enforcement gaps. This is a deliberate design decision, documented and reviewable.

---

### 2.3 Skill Governance — `audit-skill`

Skills are self-contained workflow documents for one specific objective.

**Output paths:**
- Per-skill review: `.docs/changes/skill/reviews/<skill-name>/review.md`
- Per-skill history: `.docs/changes/skill/history/<skill-name>-history.md`

**PowerShell script support:**
- `generate-audit-skill-baseline.ps1`
- `get-audit-skill-metadata.ps1`
- `generate-audit-skill-targeted.ps1`
- `refresh-audit-skill-history.ps1`

**Mandatory standards (SKR-M\*):**

| ID | Rule |
|---|---|
| SKR-M1 | Hyper-specialized to one objective only |
| SKR-M2 | Valid YAML frontmatter and Markdown structure |
| SKR-M3 | Clear discovery triggers in description and body |
| SKR-M4 | **Self-containment: no cross-skill references** — no invocations, delegations, or required-sub-skill directives to named sibling skills |

**Advisory standards (SKR-S\*):**

| ID | Rule |
|---|---|
| SKR-S1 | Supporting assets present when they materially improve execution |
| SKR-S3 | Markdown links are resolvable and non-placeholder |
| SKR-S4 | Growth governance alignment |
| SKR-S5 | Economical wording; no duplication or narrative padding |

**The most distinctive constraint — SKR-M4:** Skills must be fully self-contained. They cannot depend on other named skills. If shared logic is needed, it must be inlined into the skill body, or an explicit orchestrator skill must be created as the indirection layer. This design eliminates hidden dependency chains where breaking one skill silently breaks others.

---

### 2.4 Prompt Governance — `audit-prompts`

Prompts are thin workflow entry points. They route to skills; they do not contain skill logic.

**Output paths:**
- Per-prompt review: `.docs/changes/prompt/reviews/<prompt-name>/review.md`
- Per-prompt history: `.docs/changes/prompt/history/<prompt-name>-history.md`

**Mandatory standards (PRR-M\*):**

| ID | Rule |
|---|---|
| PRR-M1 | Singular purpose — one repeatable workflow task |
| PRR-M2 | Valid frontmatter with `name` and `description` |
| PRR-M3 | Required output structure explicitly defined in body |
| PRR-M4 | Skill routing present when driving a reusable workflow |

**Advisory standards (PRR-S\*):**

| ID | Rule |
|---|---|
| PRR-S1 | No conflict with other prompts |
| PRR-S2 | Brevity — no narrative padding beyond routing and output clarity |
| PRR-S3 | Growth governance alignment |

**Design principle:** Prompts are entry points; skills hold executable logic. PRR-M4 enforces this: a prompt that drives a reusable workflow must reference the named skill — it does not re-implement the workflow.

---

### 2.5 Type-Level and Cross-Type Governance — `audit-customization-types`

This skill evaluates governance at the type layer — cross-type interaction failures, type-level conflict detection, and boundary clarity across all four types simultaneously.

**Output path:** `.docs/changes/governance/type-audits/audit-customization-types.md`

**PowerShell script:** `test-type-interaction-matrix.ps1`

**Mandatory standards (TYP-M\*):**

| ID | Rule |
|---|---|
| TYP-M1 | Type coverage completeness — all in-scope types explicitly covered |
| TYP-M2 | Interaction matrix completeness — every type pair has an explicit result |
| TYP-M3 | Evidence traceability — failed findings link to file paths and check IDs |
| TYP-M4 | Deterministic disposition contract — derived from defined rule set |
| TYP-M5 | Severity mapping consistency — one explicit mapping table applied consistently |

**Advisory standards (TYP-S\*):**

| ID | Rule |
|---|---|
| TYP-S1 | Same-type artifacts do not conflict |
| TYP-S2 | Cross-type artifacts do not conflict |
| TYP-S3 | Boundary clarity — responsibilities explicit, no duplication |
| TYP-S4 | Catalog and taxonomy parity |
| TYP-S5 | Brevity |
| TYP-S6 | Growth governance alignment |

**Required output grids (produced in order):**
1. Type Scope Grid
2. Standards Outcome Grid
3. Same-Type Interaction Grid
4. Cross-Type Interaction Grid
5. Severity Mapping Grid
6. Failure Detail Grid
7. Ranked Recommendations Grid
8. Disposition Grid

---

## History and Deny-List Loop

All five audit skills maintain history files and build deny-lists at the start of each run. This ensures:
- Recommendations deliberately rejected in prior cycles are not re-raised
- Audit cycles do not loop over the same suggestions indefinitely
- Governance has institutional memory independent of conversation history

---

## Integration Points

| Governance Type | Connection |
|---|---|
| [Health & Audit Overview](./10-health-audit.md) | Item-level audits feed into `governance-audit` → `governance-health-overview` |
| [Optimization Governance](./11-optimization.md) | `optimize-customizations` runs alongside type-level audit as a companion check |
| [Naming & Taxonomy](./03-naming-taxonomy.md) | TYP-S4 checks catalog and taxonomy parity |
| [Lifecycle & Lanes](./04-lifecycle-lanes.md) | GOV-M3 (catalog integrity) is a direct dependency of type audits |
