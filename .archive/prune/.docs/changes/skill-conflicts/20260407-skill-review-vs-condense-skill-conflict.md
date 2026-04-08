# Skill Conflict Report

## Metadata

- Date: 2026-04-07
- Conflict ID: CON-SKILL-20260407-001
- Skill A: skill-review
- Skill B: condense-skill
- Reported By: skill-review

## Conflict Description

SKR-S4 enforcement in skill-review automation required exact section headings (Inputs, Required Outputs, Workflow), while condense-skill supports concise rewrites that preserve semantics and may use equivalent labels. This created false-positive advisories for skills that remained operational and self-contained.

## Evidence

- Skill A Evidence: .github/skills/skill-review/SKILL.md (SKR-S4 prior wording required exact sections).
- Skill B Evidence: .github/skills/condense-skill/SKILL.md (concision workflow preserves intent and structure).
- Impact Evidence: .github/skills/skill-review/references/scripts/generate-full-skill-audit.ps1 (exact-heading checks) and .docs/changes/skill-reviews/20260407-full-skill-review-grid.md (advisories concentrated on SKR-S4).

## Impact Assessment

- Severity: Medium
- Affected Workflows: Full skill audits, targeted skill audits, remediation planning
- User Impact: Generated remediation noise, reduced trust in advisories, and unnecessary churn against economically condensed skills.

## Resolution Options

| Option | Description | Pros | Cons |
|---|---|---|---|
| OPT-1 | Keep strict exact-heading enforcement | Deterministic heading checks | Conflicts with condense outcomes and causes false advisories |
| OPT-2 | Evaluate SKR-S4 semantically with canonical-or-equivalent section labeling | Preserves self-contained guarantees while supporting economical wording | Slightly broader matching logic in automation |

## Recommended Resolution

- Recommendation: OPT-2
- Rationale: Maintains self-contained safeguards while preventing false positives introduced by purely syntactic section-name checks.

## Human Collaboration Record

- User Decision: OPT-2
- Decision Date: 2026-04-07
- Decision Notes: User requested conflict be highlighted, reported, and prevented.

## Closure

- Status: Resolved
- Follow-up Actions:
  1. Align SKR-S4 wording in skill-review and condense-skill with semantic execution-context requirements.
  2. Update full-audit automation to recognize canonical and equivalent section labels.
