---
name: validate-customization
description: Use when evaluating .instructions.md or .agent.md files against quality standards, detecting conflicts between customizations, and producing remediation recommendations.
---

# Customization Review

## Singular Purpose

Evaluate `.instructions.md` and `.agent.md` files against defined quality standards and produce review outcomes that determine whether an artifact passes, requires update, or enters conflict resolution.

This skill has one purpose: customization quality review and follow-up governance.

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

## Review Standards — Agent Files

| ID | Standard | Type | Pass Criteria | Failure Action |
|---|---|---|---|---|
| AGR-M1 | Singular purpose | MUST | Agent scope maps to one role lane only. | Mark failed; recommend scope split. |
| AGR-M2 | Valid frontmatter | MUST | `name` and `description` present; valid YAML. | Mark failed; provide exact frontmatter fix. |
| AGR-M3 | Singular purpose section present | MUST | `## Singular Purpose` section exists and names what the agent does and does not do. | Mark failed; provide section guidance. |
| AGR-M4 | No instruction file restatement | MUST | Agent body references instruction files rather than restating their content inline. | Mark failed; recommend replacing inline rules with references. |
| AGR-S1 | Companion skills declared | SHOULD | `## Preferred Companion Skills` is present with at least one entry. | Record advisory; recommend companion skill list. |
| AGR-S2 | No conflict with other agents | SHOULD NOT conflict | No role overlap or contradictory routing boundaries with other agent files. | Start conflict workflow; document resolution plan. |

---

## Trigger Conditions

Invoke this skill when any of the following is true:

- A new `.instructions.md` or `.agent.md` is created.
- An existing instructions or agent file is modified.
- A periodic quality audit of customizations is requested.
- An instruction or agent fails discovery, invocation, or behavior expectations.
- Two customization artifacts appear to overlap or contradict each other.

## Inputs

Required:
- Target artifact name or explicit file path.
- Review date (YYYY-MM-DD).

Optional:
- Previous review artifact path if already known.
- Change request or incident context.

## Required Outputs

- A per-artifact review report using [customization-review-report-template.md](references/customization-review-report-template.md).
- A conflict report when needed using [customization-conflict-report-template.md](references/customization-conflict-report-template.md).
- Review result summaries MUST be returned in Markdown grid format (tables), not prose lists.
- Aggregate multi-artifact results MUST include at least one consolidated grid with per-artifact outcomes.
- Per-artifact review files MUST be stored under `.docs/changes/customization-reviews/<artifact-name>/`.

## Workflow

1. Resolve target artifact(s) and read current file content.
2. Determine artifact type: instruction file or agent file.
3. Apply the applicable INR-M* / INR-S* or AGR-M* / AGR-S* standards with evidence.
4. Evaluate each standard against the file content; record pass, fail, or advisory outcome.
5. If conflict is detected:
   - Document conflict using the conflict report template.
   - Recommend one or more concrete resolution options.
   - Work with the user to choose and confirm the resolution.
6. Produce the review report and store it at the required path.
7. Route any required fixes to `customization-authoring`.
