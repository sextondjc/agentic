# Librarian and Skill-Review Governance Conflict Report

| Metric | Value |
|---|---|
| Audit Date | 2026-04-09 |
| Scope | librarian, skill-review, dependent governance scripts and prompts |
| Conflict Status | Open |
| Severity | High |
| Disposition | FAILED |

## Conflict Summary Grid

| ID | Area | Finding | Severity |
|---|---|---|---|
| GOV-CON-001 | Policy | `librarian` and global naming guidance prohibit date-prefixed files and hyphenated folder levels inside `.docs`, while `skill-review` mandates `.docs/changes/skill-reviews/<skill-name>/` and dated review artifacts. | High |
| GOV-CON-002 | Automation | `skill-review` scripts and governance overview scripts generate, read, or rewrite the prohibited `skill-reviews` path and `YYYYMMDD-review.md` filenames. | High |
| GOV-CON-003 | Propagation | Upstream governance skills and prompts still instruct users and automation to produce artifacts in the conflicting legacy locations. | Medium |

## Evidence Grid

| Source | Evidence | Conflict Signal |
|---|---|---|
| [SKILL.md](./../../../../.github/skills/librarian/SKILL.md) | `Date prefixes PROHIBITED. No exceptions.` and `Folder names: single word per level. No hyphens` for `.docs` corpus curation. | Establishes the active naming policy for documentation artifacts. |
| [naming-conventions.instructions.md](./../../../../.github/instructions/naming-conventions.instructions.md) | `No date prefixes — ever` and `Single word per folder level`, with `skill-reviews/` explicitly corrected to `skill/reviews/`. | Confirms the policy is not local to `librarian`; it is workspace-wide for `.docs` and `.archive`. |
| [SKILL.md](./../../../../.github/skills/skill-review/SKILL.md) | `Per-skill review files MUST be stored under .docs/changes/skill-reviews/<skill-name>/.` and conflict docs at `.docs/changes/skill-conflicts/`. | Mandates paths that violate the current `.docs` naming rules. |
| [skill-audit.prompt.md](./../../../../.github/prompts/skill-audit.prompt.md) | Writes per-skill reports to `.docs/changes/skill-reviews/<skill-name>/review.md` and aggregate output to `.docs/changes/skill-reviews/full-skill-review-grid.md`. | User-facing workflow still instructs the legacy compound folder pattern. |
| [generate-full-skill-audit.ps1](./../../../../.github/skills/skill-review/references/scripts/generate-full-skill-audit.ps1) | Uses `.docs/changes/skill-reviews` as report root and writes `$compactDate-review.md`. | Automation directly creates date-prefixed files in the prohibited folder tree. |
| [generate-baseline-skill-reviews.ps1](./../../../../.github/skills/skill-review/references/scripts/generate-baseline-skill-reviews.ps1) | Sets reports directory to `.docs/changes/skill-reviews` and names reports `{date}-review.md`. | Repeats the same forbidden pattern in the baseline generator. |
| [generate-targeted-skill-reviews.ps1](./../../../../.github/skills/skill-review/references/scripts/generate-targeted-skill-reviews.ps1) | Writes `.docs/changes/skill-reviews/$skill/$date-review.md`. | Confirms the issue is systemic across targeted reruns too. |
| [refresh-history-index-and-grid.ps1](./../../../../.github/skills/skill-review/references/scripts/refresh-history-index-and-grid.ps1) | Scans `.docs/changes/skill-reviews` for `$compactDate-review.md`. | The history/index rebuild step depends on the conflicting naming model. |
| [invoke-governance-health-overview.ps1](./../../../../.github/scripts/powershell/invoke-governance-health-overview.ps1) | Reads `.docs/changes/skill-reviews/$skillReviewDate-full-skill-review-grid.md` and rewrites report links from that root. | Governance aggregation depends on the same deprecated artifact scheme. |
| [SKILL.md](./../../../../.github/skills/governance-health-overview/SKILL.md) | Requires fresh outputs under `.docs/changes/governance-audits/`, `.docs/changes/skill-reviews/`, and `.docs/changes/customization-reviews/`. | Broader governance workflow still points at compound folder names now disallowed by policy. |
| [condense-dated-docs.ps1](./../../../../.github/scripts/powershell/condense-dated-docs.ps1) | Uses `.docs/changes/skill-reviews` and archives files matching `^\d{8}.*\.md$`. | A cleanup script institutionalizes the date-prefixed pattern instead of removing the policy conflict. |

## Impact Grid

| Area | Impact |
|---|---|
| Governance integrity | The workspace simultaneously declares the naming pattern invalid and uses automation that regenerates it. |
| Review accuracy | `skill-review` can pass `librarian` while writing artifacts that `librarian` would flag as violations, creating false governance confidence. |
| Automation drift | Cleanup and refresh workflows oscillate between canonical nested paths and legacy compound paths, causing repeated churn in indexes and reports. |
| User experience | Operators receive contradictory instructions depending on whether they follow the naming policy or the review/governance scripts. |

## Root Cause Grid

| Cause | Description |
|---|---|
| Policy precedence is undefined | The workspace never resolved whether `.docs` naming rules or review-automation storage rules are authoritative when they conflict. |
| Legacy automation remained active | Scripts and prompts retained older `skill-reviews`, `skill-conflicts`, and dated-file conventions after newer naming rules were introduced. |
| Companion governance assets drifted together | `skill-review`, governance overview, audit prompts, and history tooling all evolved around the same outdated artifact contract. |

## Remediation Recommendations Grid

| Priority | Recommendation | Expected Fix |
|---|---|---|
| P0 | Declare the canonical rule that `.docs` naming policy wins for generated governance artifacts. | Removes ambiguity and gives all downstream assets one source of truth. |
| P0 | Update `skill-review` storage rules from `.docs/changes/skill-reviews/<skill-name>/` to `.docs/changes/skill/reviews/<skill-name>/`, and conflict docs from `.docs/changes/skill-conflicts/` to `.docs/changes/skill/conflicts/`. | Aligns skill guidance with workspace naming policy. |
| P0 | Replace date-prefixed generated filenames with stable names such as `review.md`, `full-skill-review-grid.md`, and history files that keep dates in content only. | Eliminates the direct contradiction with `librarian` and naming conventions. |
| P1 | Update all dependent scripts to write canonical paths, but read legacy paths during a short migration window. | Prevents breakage while retiring old artifacts and references. |
| P1 | Update `governance-health-overview`, `audit-governance`, `skill-audit.prompt.md`, and related prompts/docs to reference canonical nested paths only. | Stops the conflict from re-entering through higher-level orchestration. |
| P2 | Add one governance regression check that fails when scripts or prompts emit `.docs/changes/*-*` folder levels or `YYYYMMDD-*.md` under `.docs`. | Prevents recurrence after remediation. |

## Resolution Options Grid

| Option | Description | Pros | Cons |
|---|---|---|---|
| OPT-1 | Standardize on `librarian` and naming-conventions rules for all `.docs` artifacts, then migrate `skill-review` and dependent governance automation. | One coherent `.docs` policy, lowest long-term maintenance cost, matches current canonical folder structure already used in the workspace. | Requires coordinated edits across skills, prompts, scripts, and history references. |
| OPT-2 | Carve out an exception so governance-generated review artifacts may keep `skill-reviews` and dated filenames. | Smaller immediate edit set. | Directly weakens the documented naming policy, introduces exceptions, and leaves duplicate canonical vs legacy paths in circulation. |
| OPT-3 | Move all generated review artifacts outside `.docs` into a separate exempt location. | Preserves strict `.docs` rules without changing some naming logic. | Larger structural change, breaks many existing assumptions, and still requires script/prompt rewrites. |

## Recommended Resolution

| Field | Value |
|---|---|
| Recommendation | OPT-1 |
| Rationale | The workspace already converged operationally toward canonical nested folders such as `skill/reviews` and `governance/audits`. The remaining conflict is caused by stale governance instructions and generators, so the cleanest fix is to align those assets to the already-declared `.docs` naming policy instead of introducing exceptions. |

## Follow-Up Actions Grid

| Order | Action |
|---|---|
| 1 | Update [SKILL.md](./../../../../.github/skills/skill-review/SKILL.md) storage and conflict workflow paths to canonical nested folders and stable filenames. |
| 2 | Update the `skill-review` script library to stop producing date-prefixed filenames and legacy compound folders. |
| 3 | Update [SKILL.md](./../../../../.github/skills/governance-health-overview/SKILL.md), [SKILL.md](./../../../../.github/skills/audit-governance/SKILL.md), and [skill-audit.prompt.md](./../../../../.github/prompts/skill-audit.prompt.md) to consume canonical paths. |
| 4 | Add a regression script or audit check so this conflict becomes machine-detectable in future governance runs. |

## Closure

| Field | Value |
|---|---|
| Status | Open |
| Blocking Condition | Governance assets still produce or depend on artifact paths that violate active `.docs` naming policy. |