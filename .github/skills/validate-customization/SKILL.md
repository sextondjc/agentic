---
name: validate-customization
description: Use when evaluating .instructions.md, .agent.md, or .prompt.md files against quality standards, detecting conflicts between customizations, and producing remediation recommendations.
---

# Customization Review

## Specialization

Evaluate `.instructions.md`, `.agent.md`, and `.prompt.md` files against defined quality standards and produce review outcomes that determine whether an artifact passes, requires update, or enters conflict resolution.

This skill has one purpose: customization quality review and follow-up governance.

## Review Mode

- Default mode is report-only.
- Do not modify customization artifacts during review unless the user explicitly asks for remediation edits.

## Normative Language

- MUST: Mandatory requirement. Failure means the reviewed artifact fails.
- SHOULD: Advisory requirement. Failure does not auto-fail, but requires recommendation and tracking.

---

## Review Standards — Instruction Files

| ID | Standard | Type | Pass Criteria | Failure Action |
|---|---|---|---|---|
| INR-M1 | Singular policy domain | MUST | File scope maps to one policy domain only. | Mark failed; recommend domain split or refocus. |
| INR-M2 | Valid frontmatter | MUST | `name`, `description`, and `applyTo` present; valid YAML. | Mark failed; provide exact frontmatter fix. |
| INR-M3 | `applyTo` is appropriately scoped | MUST | Pattern is not broader than the policy requires. Global `**` only for truly global rules. | Mark failed; recommend tighter pattern. |
| INR-M4 | No task workflow content | MUST | No multi-step decision trees or procedures. Policy mandates only. | Mark failed; recommend migrating workflow to a skill. |
| INR-S1 | No conflict with other instruction files | SHOULD NOT conflict | No harmful overlap or contradictory rules with other active instruction files. | Start conflict workflow; document resolution plan. |
| INR-S2 | Rationale present for non-obvious rules | SHOULD | Non-obvious mandates include a brief rationale comment. | Record advisory finding; recommend rationale addition. |
| INR-S3 | No conflict with agent or skill boundaries | SHOULD NOT conflict | Instruction behavior does not contradict active agent personas or skill boundaries. | Start conflict workflow; document boundary resolution options. |
| INR-S4 | Brevity | SHOULD | Instruction wording is economical, avoids duplication, and does not include narrative padding beyond what policy clarity requires. | Record advisory finding; recommend concise reductions through this skill. |

## Review Standards — Agent Files

| ID | Standard | Type | Pass Criteria | Failure Action |
|---|---|---|---|---|
| AGR-M1 | Specialization | MUST | Agent scope is hyper-specialized to one role lane only. | Mark failed; recommend scope split. |
| AGR-M2 | Valid frontmatter | MUST | `name` and `description` present; valid YAML. | Mark failed; provide exact frontmatter fix. |
| AGR-M3 | Specialization section present | MUST | `## Specialization` section exists and names what the agent does and does not do. | Mark failed; provide section guidance. |
| AGR-M4 | No instruction file restatement | MUST | Agent body references instruction files rather than restating their content inline. | Mark failed; recommend replacing inline rules with references. |
| AGR-S1 | Companion skills declared | SHOULD | `## Preferred Companion Skills` is present with at least one entry. Companion skill entries are declarative only; agents MUST NOT embed cross-skill workflow steps that delegate execution to a named skill inside `## Preferred Companion Skills` or any other section. | Record advisory; recommend companion skill list and verified declarative-only pattern. |
| AGR-S2 | No conflict with other agents | SHOULD NOT conflict | No role overlap or contradictory routing boundaries with other agent files. | Start conflict workflow; document resolution plan. |
| AGR-S3 | Brevity | SHOULD | Agent wording is economical, avoids duplication, and does not include narrative padding beyond what role clarity requires. | Record advisory finding; recommend concise reductions through this skill. |

## Review Standards — Prompt Files

| ID | Standard | Type | Pass Criteria | Failure Action |
|---|---|---|---|---|
| PRR-M1 | Singular purpose | MUST | Prompt targets one repeatable workflow task only. | Mark failed; recommend purpose split. |
| PRR-M2 | Valid frontmatter | MUST | `name` and `description` present; valid YAML. | Mark failed; provide exact frontmatter fix. |
| PRR-M3 | Output format declared | MUST | Required output structure is explicitly defined in the prompt body. | Mark failed; recommend adding output requirements section. |
| PRR-M4 | Skill routing present | MUST | Prompt explicitly routes to a named skill via `Load and follow [SKILL.md]` or equivalent. | Mark failed; recommend adding a skill routing directive. |
| PRR-S1 | No conflict with other prompts | SHOULD NOT conflict | No harmful overlap or duplicate trigger conditions with other active prompts. | Start conflict workflow; document resolution plan. |
| PRR-S2 | Brevity | SHOULD | Wording is economical; no narrative padding beyond routing and output clarity. | Record advisory finding; recommend concise reductions. |

---

## Trigger Conditions

Invoke this skill when any of the following is true:

- A new `.instructions.md` or `.agent.md` is created.
- A new `.prompt.md` file is created.
- An existing instructions, agent, or prompt file is modified.
- A periodic quality audit of customizations is requested.
- A periodic quality audit of prompts is requested.
- An instruction or agent fails discovery, invocation, or behavior expectations.
- A prompt fails discovery, invocation, or behavior expectations.
- Two customization artifacts appear to overlap or contradict each other.
- A deep review of `*.instructions.md` files is requested for duplicates, contradictions, or boundary conflicts with agents and skills.

## Inputs

Required:
- Target artifact name or explicit file path.
- Review date (YYYY-MM-DD).

Optional:
- Previous review artifact path if already known.
- Change request or incident context.

## Required Outputs

- A customization review report using [customization-review-report-template.md](./references/customization-review-report-template.md).
- A conflict report when needed using [customization-conflict-report-template.md](./references/customization-conflict-report-template.md).
- Review result summaries MUST be returned in Markdown grid format (tables), not prose lists.
- Aggregate multi-artifact results MUST include at least one consolidated grid with per-artifact outcomes.
- Review reports MUST be stored at `.docs/changes/customization/reviews/governance-type-audit-customizations.md`.
- Review history MUST be appended to `.docs/changes/customization/reviews/audit-history.md` as one row per reviewed artifact.

#### Violation Code Legend

| Code Prefix | Standard | Type | Skill Source |
|---|---|---|---|
| INR-M* | Mandatory instruction quality check | MUST | validate-customization |
| INR-S* | Advisory instruction quality check | SHOULD | validate-customization |
| AGR-M* | Mandatory agent quality check | MUST | validate-customization |
| AGR-S* | Advisory agent quality check | SHOULD | validate-customization |
| PRR-M* | Mandatory prompt quality check | MUST | validate-customization |
| PRR-S* | Advisory prompt quality check | SHOULD | validate-customization |
| GOV-CUS | Customization quality aggregate | Aggregate | governance-health-overview |

## Workflow

1. Resolve target artifact(s) and read current file content.
2. Determine artifact type: instruction file, agent file, or prompt file.
3. Apply the applicable INR-M* / INR-S*, AGR-M* / AGR-S*, or PRR-M* / PRR-S* standards with evidence.
4. Evaluate each standard against the file content; record pass, fail, or advisory outcome.
5. Validate brevity explicitly: wording should be economical, without obvious duplication or narrative padding.
6. For instruction-focused audits, perform cross-artifact checks:
   - detect duplicate and conflicting instruction guidance,
   - verify alignment with active agent personas,
   - verify alignment with active skill boundaries.
   - flag any skill referenced in an agent or instruction file that itself violates SKR-M4 (cross-skill references); route the finding to skill-review.
7. If conflict is detected:
   - Document conflict using the conflict report template.
   - Recommend one or more concrete resolution options.
   - Work with the user to choose and confirm the resolution.
8. Produce the review report and store it at `.docs/changes/customization/reviews/governance-type-audit-customizations.md`.
9. Append history rows for all reviewed artifacts to `.docs/changes/customization/reviews/audit-history.md`.
10. Route any required fixes to this skill or this skill based on artifact type.

