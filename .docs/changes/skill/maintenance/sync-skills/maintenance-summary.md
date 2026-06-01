# Skill Maintenance Summary

## Run Metadata

| Field | Value |
|---|---|
| Skill | sync-skills |
| Target | all |
| Evaluation Date | 2026-06-01 |
| Source Catalog | .github/skills/sync-skills/references/source-catalog.md |
| Freshness Threshold | 30 days |
| Primary Lane | Review |
| Intake Route | orchestrator -> sync-skills |

## Sources Re-evaluated

| Source | In Use | Last Evaluated | Current Status | Evidence Delta |
|---|---|---|---|---|
| Agent Skills | Yes | 2026-06-01 | Current | Confirmed open standard posture, progressive loading model, and active community/governance references. |
| Anthropic Skills Repository | Yes | 2026-06-01 | Current | Confirmed active maintenance and continued value of template/spec/example surfaces. |
| Claude Support: How to Create Custom Skills | Yes | 2026-06-01 | Current | Confirmed refreshed guidance this week, focused-skill recommendations, metadata constraints, packaging/testing and security guidance. |
| VS Code Agent Skills Documentation | Yes | 2026-06-01 | Current | Confirmed 2026-05-28 doc revision and continued support for required fields, optional frontmatter controls, and progressive loading behavior. |

## Concrete Deltas Affecting Workspace Skills

1. No source deprecations were identified in this run.
2. Source freshness was renewed for all in-use entries; no source moved to Needs Review.
3. VS Code documentation now explicitly highlights the experimental `context` frontmatter field; this should be treated as opt-in only and documented as experimental whenever used.
4. Cross-platform limit handling remains divergent between ecosystems (for example, Claude Help Center guidance vs VS Code limits). Skills should continue using concise descriptions and avoid platform-specific overfitting.

## Implementation-Ready Change List (Target: all skills)

1. Add a periodic check to each skills maintenance wave that flags any `SKILL.md` description exceeding 200 characters as cross-platform risk (advisory), while keeping VS Code compliance checks at 1024 characters.
2. Add an explicit "experimental feature" note in any skill that introduces `context: fork`, including fallback behavior expectations.
3. Add a lightweight validation pass in maintenance scripts to verify every linked local reference in `SKILL.md` files resolves within the skill directory.
4. For high-advisory skill families from the latest governance review, prioritize tightening trigger conditions and keeping workflows deterministic and self-contained.

## Impacted Skill Files

| Scope | Files |
|---|---|
| Updated now | .github/skills/sync-skills/references/source-catalog.md |
| Prepared change list (not yet applied) | all .github/skills/*/SKILL.md files |

## Validation Checklist

| Check | Outcome |
|---|---|
| Every in-use source has updated Last Evaluated date | Pass |
| Any stale source marked Needs Review or Deprecated | Pass (none stale) |
| Source catalog remains markdown grid with required columns | Pass |
| Concrete, implementation-ready change list produced | Pass |
| Brevity expectations evaluated and captured | Pass |
| Maintenance summary includes date and impacted skills | Pass |

## Outcome Summary

This maintenance pass completed successfully for target `all` with no deprecated sources and no stale entries. The source catalog is current as of 2026-06-01, and a concrete change list is recorded for next execution wave across the skill set.
