# P1-01 Execution Checklist

Status: Completed (2026-04-02)
Date: 2026-04-02
Rename: request-review -> request-code-review
Batch Reference: P1-01 in `.docs/changes/customization-renames/rename-history.md`

## Objective
Execute one rename safely with deterministic ordering, complete traceability, and explicit post-change verification.

## Preconditions

1. Do not start if any other rename in P1 is in progress.
2. Keep all edits in one change set.
3. Update both active assets and historical review artifacts in the same pass.
4. Preserve meaning in historical reviews; only rename tokens and paths.

## Ordered Edit Plan

1. Rename skill folder path.
   - `.github/skills/request-review/` -> `.github/skills/request-code-review/`
2. Update skill identity in skill file.
   - `.github/skills/request-code-review/SKILL.md`
3. Update direct skill references in active catalogs and orchestration docs.
   - `.github/skills/README.md`
   - `.github/copilot-instructions.md`
   - `.github/prompts/curate-copilot.prompt.md`
   - `.github/skills/task-execution/SKILL.md`
   - `.github/skills/task-execution/code-quality-reviewer-prompt.md`
   - `.github/skills/current-test-coverage/SKILL.md`
4. Update skill-local references.
   - `.github/skills/request-code-review/references/README.md`
5. Update skill-review history index and dedicated history page.
   - `.github/skills/skill-review/references/history/index.md`
   - `.github/skills/skill-review/references/history/request-review-history.md`
6. Update taxonomy and change-history artifacts.
   - `.docs/reference/customization-taxonomy-v1.md`
   - `.docs/changes/skill-reviews/20260329-full-skill-review-grid.md`
   - `.docs/changes/skill-reviews/20260401-full-skill-review-grid.md`
   - `.docs/changes/skill-reviews/request-review/20260329-review.md`
   - `.docs/changes/skill-reviews/request-review/20260401-review.md`
7. Update rename ledger entry status.
   - `.docs/changes/customization-renames/rename-history.md`

## Required Content Updates

1. Replace all token references:
   - `request-review` -> `request-code-review`
2. Replace all skill path references:
   - `.github/skills/request-review/SKILL.md` -> `.github/skills/request-code-review/SKILL.md`
   - `request-review/code-reviewer.md` -> `request-code-review/code-reviewer.md`
3. Update headings/titles that include the old name.

## Verification Queries

Run these after edits and before marking applied.

1. Old token should have no matches in active customization scope.
   - Query: `request-review`
   - Scope: `.github/**`
2. New token should appear in expected active files.
   - Query: `request-code-review`
   - Scope: `.github/**`
3. Old path should have no matches.
   - Query: `.github/skills/request-review/`
   - Scope: `.github/**,.docs/**`
4. New path should resolve in catalogs and history.
   - Query: `.github/skills/request-code-review/`
   - Scope: `.github/**,.docs/**`
5. Rename ledger P1-01 row should be updated from Planned to Applied.

## Ledger Update Rules (P1-01)

When implementation completes:

1. In `.docs/changes/customization-renames/rename-history.md` set P1-01 `Status` to `Applied`.
2. Keep `Backward-Compat Alias` as `request-review -> request-code-review` until transition window closes.
3. Add an Alias Registry row:
   - Alias Name: `request-review`
   - Canonical Name: `request-code-review`
   - Introduced: `2026-04-02`
   - Planned Removal: set by follow-up decision
   - Status: `active`

## Exit Criteria

1. All required files updated.
2. Verification queries pass.
3. Ledger updated to Applied with alias tracked.
4. No unintended changes outside P1-01 scope.
