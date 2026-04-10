---
name: skill-review
description: Use when evaluating one or more workspace skills against mandatory quality standards, tracking review history, and producing remediation recommendations.
---

# Skill Review

## Specialization

Evaluate skills against defined quality standards and produce review outcomes that determine whether a skill passes, requires update, or enters conflict resolution.

This skill has one purpose only: skill quality review and follow-up governance.

## Normative Language

- MUST: Mandatory requirement. Failure means the reviewed skill fails.
- SHOULD: Advisory requirement. Failure does not auto-fail, but requires recommendation and tracking.

## Review Standards

Use these standards exactly:

| ID | Standard | Type | Pass Criteria | Failure Action |
|---|---|---|---|---|
| SKR-M1 | Specialization | MUST | Skill scope is hyper-specialized to one objective only. | Mark as failed and recommend scope split or refocus. |
| SKR-M2 | Valid format | MUST | Valid YAML front matter and valid Markdown structure for Copilot skill loading. | Mark as failed and provide exact formatting fix. |
| SKR-M3 | Triggers | MUST | Clear discovery triggers in description and body with concrete use conditions. | Mark as failed and provide trigger rewrite guidance. |
| SKR-S1 | Assets | SHOULD | Skill uses concrete references or reusable assets when they materially improve execution support; a `references/` directory is optional when the skill is already self-contained. | Record advisory finding only when missing assets cause ambiguity, duplication, or weak reuse. |
| SKR-S2 | No conflict | SHOULD NOT conflict | No harmful overlap or contradictory behavior with other skills. | Start conflict workflow and document resolution plan. |
| SKR-S3 | Link integrity | SHOULD | Markdown links are resolvable, non-placeholder, and aligned with referenced assets/docs, including valid fragment anchors when present. Validate from the on-disk workspace file context. | Record advisory finding and recommend target fixes or valid replacements. |
| SKR-S4 | Self-contained | SHOULD | Skill guidance is operational without hidden dependencies, with explicit execution context for inputs, outputs, and process. Canonical sections (`Inputs`, `Required Outputs`, `Workflow`) OR clearly labeled equivalent sections are acceptable when semantics are preserved. | Record advisory finding and recommend restoring missing execution context using canonical sections or clear equivalents. |
| SKR-S5 | Brevity | SHOULD | Skill wording is economical for context efficiency, avoids obvious duplication or narrative padding, and preserves clarity without unnecessary verbosity. | Record advisory finding and recommend concise reductions through the appropriate authoring skill. |

## Trigger Conditions

Invoke this skill when any of the following is true:

- A new skill is created.
- An existing skill is modified.
- Periodic quality audit of skills is requested.
- A skill fails discovery, invocation, or behavior expectations.
- Two skills appear to overlap or contradict each other.

## Inputs

Required inputs:

- Target skill name or explicit list of target skills.
- Workspace skill root path.
- Review date.

Optional inputs:

- Previous review artifact path if already known.
- Change request or incident context.

## Required Outputs

- A per-skill review report in workspace docs using template path: [skill-review-report-template.md](./references/skill-review-report-template.md).
- A conflict report when needed using template path: [skill-conflict-report-template.md](./references/skill-conflict-report-template.md).
- Updated per-skill history using path: [README.md](./references/history/README.md).
- Review result summaries MUST be returned in Markdown grid format (tables), not prose lists.
- Aggregate multi-skill results MUST include at least one consolidated grid with per-skill outcomes.
- Per-skill review files MUST be stored under .docs/changes/skill/reviews/<skill-name>/.

#### Violation Code Legend

| Code Prefix | Standard | Type | Skill Source |
|---|---|---|---|
| SKR-M* | Mandatory skill quality check | MUST | skill-review |
| SKR-S* | Advisory skill quality check | SHOULD | skill-review |
| GOV-SK | Skill quality aggregate | Aggregate | governance-health-overview |

## Assets

- Script assets are available at path: [README.md](./references/scripts/README.md).
- A dedicated `references/` folder is optional for reviewed skills; do not recommend it by default when the artifact is already self-contained.
- For skill artifacts, use `skills-authoring` for concision-focused remediation when wording reductions are needed.
- For non-skill customization artifacts, use `agent-authoring` or `instructions-authoring` for concision-focused remediation when wording reductions are needed.
- Use [customization-generation-template.md](./../instructions-authoring/references/customization-generation-template.md) as an optional reference for concision baselines, while verifying reviewed skills remain self-contained.
- Use generate-baseline-skill-reviews.ps1 to run full baseline audits and history updates.
- Use get-skill-metadata-audit.ps1 for quick frontmatter/trigger/reference checks.
- Use generate-targeted-skill-reviews.ps1 for focused remediation reruns on selected skills.
- Use refresh-history-index-and-grid.ps1 to rebuild history index and the aggregate grid.
- External copilot-skill mirrors used for evidence capture are stored at path: [README.md](./references/mirrors/README.md).

## Workflow

1. Resolve target skills and collect current SKILL.md files and related assets.
2. Load the per-skill history file from references/history before analysis.
3. Build a recommendation deny-list from history entries marked Rejected, Removed, or Illegitimate.
4. Evaluate all SKR-M* and SKR-S* standards with evidence.
5. Validate markdown link integrity in SKILL.md from the on-disk workspace file context (for example, reject placeholder `#` links and unresolved local paths).
6. Prefer workspace-root-relative markdown links to reduce virtual-buffer resolution mismatch in IDE diagnostics.
7. Validate self-containedness semantically: required execution context must be explicit and not rely on unstated assumptions, using canonical section names or clearly labeled equivalent sections.
8. Validate brevity: wording should be economical for context efficiency, without obvious duplication or narrative padding.
9. Produce pass or fail for MUST standards and advisory outcome for SHOULD standards.
10. If advisory findings are primarily concision-related, route rewrite recommendations through `skills-authoring`, `agent-authoring`, or `instructions-authoring` based on artifact type before finalizing remediation wording.
11. If conflict is detected:
   - Document conflict using workspace documentation standards.
   - Recommend one or more concrete resolution options.
   - Work with the human user to choose and confirm the resolution.
12. Update the skill history file with findings, decisions, and recommendation statuses.

## Output Format Rules

- MUST return review outcomes in Markdown grid format.
- MUST present aggregate results using a single consolidated grid with these columns:
   - Skill
   - Outcome
   - MUST Failures
   - SHOULD Advisories
   - Conflict Status
   - Report
- SHOULD include a small aggregate metrics grid for totals (Pass, Pass With Advisories, Fail, Blocked).
- SHOULD keep narrative concise and place it after the grids.

## Storage Rules

- Store each skill review under .docs/changes/skill/reviews/<skill-name>/.
- Use descriptive file names: `review.md`. Use versioned names (for example, `review-v2.md`) to disambiguate repeated runs.
- Keep aggregate cross-skill summaries in .docs/changes/skill/reviews/.

## Conflict Workflow (Mandatory When Conflict Exists)

When a conflict exists, this skill MUST:

1. Document the conflict in a workspace document at .docs/changes/skill/conflicts/ using the conflict template.
2. Provide recommendations to resolve the conflict.
3. Collaborate with the human user to select and confirm the final resolution.

Do not auto-resolve without explicit user direction.

## History Management Rules

- Keep one history file per reviewed skill in references/history.
- Use filename format: <skill-name>-history.md.
- Append new review entries; never rewrite prior decisions.
- Track each recommendation with status: Proposed, Accepted, Rejected, Removed, Implemented.
- Before publishing recommendations, remove any item that matches prior Rejected or Removed entries unless the user explicitly re-opens it.

## Decision Gates

## Done Criteria

A review is complete only when:

- All MUST and SHOULD checks were executed with evidence.
- Required report artifacts were written.
- History was updated for every reviewed skill.
- Conflicts were either resolved with user confirmation or explicitly marked Blocked.
