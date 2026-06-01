---
name: audit-skill
description: Use when evaluating one or more workspace skills for skill-specific quality signals such as trigger clarity, self-containment, and reference integrity, then recording remediation recommendations.
---

# Audit Skill

## Specialization

Evaluate skills against skill-governance standards and produce review outcomes (Pass, Pass With Advisories, Fail, Blocked) centered on reusable workflow quality. Scope is singular: skill quality review and follow-up governance.

## Trigger Conditions

Invoke this skill when any condition below is true:

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
- Evaluation date in ISO format (`YYYY-MM-DD`) for review freshness tracking.
- Source catalog file path (default: `./references/source-catalog.md`).
- Maximum age threshold in days for source freshness (default: 30).

## Required Outputs

- A per-skill review report in workspace docs using template path: [audit-skill-report-template.md](./references/audit-skill-report-template.md).
- A conflict report is not produced by this skill; conflict detection across skills is a type-governance concern.
- Updated per-skill history at: `.docs/changes/skill/history/<skill-name>-history.md`.
- Review result summaries MUST be returned in Markdown grid format (tables), not prose lists.
- Aggregate multi-skill results MUST include at least one consolidated grid with per-skill outcomes.
- Per-skill review files MUST be stored under .docs/changes/skill/reviews/<skill-name>/.
- Reasoning package per reviewed skill: assumptions, trade-offs, blockers, and one recommendation.
- Source-governance summary when maintenance validation is requested.
- Updated [source-catalog.md](./references/source-catalog.md) when source tracking changes are made.

#### Violation Code Legend

| Code Prefix | Standard | Type | Skill Source |
|---|---|---|---|
| SKR-M* | Mandatory skill quality check | MUST | audit-skill |
| SKR-S* | Advisory skill quality check | SHOULD | audit-skill |

## Assets

- Script assets are available at path: [README.md](./references/scripts/README.md).
- Source catalog is available at path: [source-catalog.md](./references/source-catalog.md).
- A dedicated `references/` folder is optional for reviewed skills; do not recommend it by default when the artifact is already self-contained.
- For concision-focused remediation, include exact rewrite recommendations directly in the report.
- Use script assets as follows: `generate-audit-skill-baseline.ps1` (full baseline + history), `get-audit-skill-metadata.ps1` (quick metadata checks), `generate-audit-skill-targeted.ps1` (targeted reruns), `refresh-audit-skill-history.ps1` (history index + aggregate grid).

## Workflow

1. Resolve target skills and collect current SKILL.md files and related assets.
2. Load the per-skill history file from `.docs/changes/skill/history/` before analysis.
3. Build a recommendation deny-list from history entries marked Rejected, Removed, or Illegitimate.
4. Re-evaluate tracked sources in [source-catalog.md](./references/source-catalog.md) for freshness and relevance.
5. Build coverage across mandatory branches: format, triggers, self-containedness, links, and history alignment.
6. Verify growth-governance alignment: duplication control, reuse-before-create, delta-first edits, and explicit review outputs.
7. Re-evaluate maintenance assumptions against active standards and source context when requested.
8. Evaluate all SKR-M* and SKR-S* checks with evidence.
9. Validate markdown link integrity in SKILL.md from on-disk context (reject placeholder `#` and unresolved local paths).
10. Prefer workspace-root-relative markdown links to reduce virtual-buffer resolution mismatch in IDE diagnostics.
11. Validate self-containedness semantically: required execution context must be explicit and not rely on unstated assumptions, using canonical sections or clearly labeled equivalents.
12. Validate brevity: wording should be economical, without obvious duplication or narrative padding.
13. Produce pass or fail for MUST standards and advisory outcome for SHOULD standards.
14. For each failed or advisory check, record assumptions, trade-offs, blockers, and one recommendation.
15. If advisory findings are primarily concision-related, include rewrite-ready text in the report before finalizing remediation wording.
16. Update the skill history file with findings, decisions, and recommendation statuses.
17. Confirm deterministic coverage: each requested outcome is mapped to a report artifact or explicit decision.

## Done Criteria

A review is complete only when:

- All MUST and SHOULD checks were executed with evidence.
- Required report artifacts were written.
- History was updated for every reviewed skill.
- Conflicts were either resolved with user confirmation or explicitly marked Blocked.
- Reasoning package entries are present for failed and advisory findings.
- Maintenance assumptions are freshness-checked when maintenance validation is in scope.
- Source-catalog freshness was checked before final recommendations were issued.

## Execution Context

### Input Context

- Request objective and scope boundary.
- Applicable constraints and required outputs.

### Process Context

- Follow this skill's deterministic workflow from intake to closure.
- Record ownership and decisions for required outputs.

### Output Context

- Deliverables with explicit completion status.
- Residual risks and next actions.
## References Assets

- [Reference assets](./references/README.md)
