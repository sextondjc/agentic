---
name: sync-compendium
description: Use when importing or updating this compendium in target repositories with explicit approval gates, source attribution, and bespoke-safe merge behavior. Handles lock file initialization, dry-run planning, artifact decision logic, and approval-gated apply.
---

# Sync Compendium

## Specialization

Apply compendium updates to external repositories using explicit approval checkpoints, source attribution, safe handling of bespoke local customizations, and immutable lock file provenance tracking.

This skill is intentionally narrow: sync automation only, not governance audits or broad workspace reviews.

## Trigger Conditions

Use this skill when:

- A target repository needs to import this compendium for the first time (run `Initialize-CompendiumImport.ps1` first).
- A target repository needs to update from one compendium version to another (lock.version < source_version).
- Teams must confirm provenance (source repo, version, commit SHA) for imported assets.
- Sync operations must preserve local bespoke customizations (ownership_mode=local never overwritten).
- Approval evidence must be recorded immutably in lock metadata.

## Required Inputs

- `source_repository_url`: GitHub URL for the source compendium (for example `https://github.com/sextondjc/agentic`)

Derived automatically (user does not supply):
- `target_repo_root`: current workspace root
- `target_index_path`: `.github/skills/sync-compendium/references/.compendium/artifact-index.json`
- `plan_out_path`: `.github/skills/sync-compendium/references/.compendium/latest-plan.json`
- `sync_report_path`: `.github/skills/sync-compendium/references/.compendium/latest-sync-report.json`
- `source_repo`, `source_version`, `source_commit`: from GitHub API and source `version.json`

The skill reads `.github/skills/sync-compendium/references/.compendium/version.json` to compare stored commit hash with latest source hash.

## Required Outputs

1. **Dry-run plan** (JSON): Classified per-artifact actions (update-candidate, add-candidate, manual-review, hold, preserve, noop, reject) written to caller-specified path
2. **Decision review table**: Grouped actions ready for human approval (one row per action group)
3. **Lock metadata update**: `.github/skills/sync-compendium/references/.compendium/lock.json` with sourceRepo, version, commit, approvedBy, approvedAt, planId
4. **Sync report** (JSON): Applied/skipped/not-approved/manual-review/held/rejected counts; written to caller-specified path; immutable audit trail

## Safety Rules (Non-Negotiable)

- **Explicit approval mandatory**: No auto-apply; human sign-off required for every non-noop action group
- **Local ownership preserved**: Any artifact with `source: local` or `ownershipMode: local` is never overwritten
- **External source preserved**: Any artifact with `source != sextondjc/agentic` is preserved by default (excluded from overwrite)
- **Extended mode requires manual review**: `ownershipMode=extended` with source changes must trigger manual-merge, not blind replace
- **Plan-first, no blind apply**: No apply step permitted until dry-run plan exists, has been reviewed, and approval is recorded
- **Mandatory same-flow cleanup**: If plan contains `hold + missing-in-source`, apply must include approved prune removals in the same run
- **Lock immutability**: Lock file serves as proof of import state and enables idempotent re-runs

## Workflow (7 Steps)

### Step 0: GitHub Hash Check (Automated)
Before any user input collection, the agent checks GitHub sextondjc/agentic main branch:
- Query GitHub API for latest commit SHA
- Read `.github/skills/sync-compendium/references/.compendium/version.json` from skill
- Compare stored hash with live hash
- **If match**: Tell user "Up-to-date"; ask if they want to continue anyway
- **If mismatch**: Proceed to user input collection; will sync to bring skill current

### Step 1: Initialize (First Import Only)
Execute `Initialize-CompendiumImport.ps1` in target repository.
- Creates `.github/skills/sync-compendium/references/.compendium/lock.json` with source metadata
- Creates `.github/skills/sync-compendium/references/.compendium/artifact-index.json` as an empty array when missing
- Idempotent; safe to re-run
- Required: `source_repo`, `source_version`, `source_commit`

### Step 2: Generate Dry-Run Plan
Execute `Invoke-CompendiumSyncPlan.ps1` with:
- `TargetIndexPath`: Path to `.github/skills/sync-compendium/references/.compendium/artifact-index.json` in target repo
- `SourceManifestPath`: Optional local manifest path. If omitted/unavailable, the script builds source items directly from GitHub repository tree.
- `SourceRepository`: Repository slug or GitHub URL
- `SourceVersion`, `SourceCommit`: From GitHub API (automated, not user-supplied)
- `PlanOutPath`: `.github/skills/sync-compendium/references/.compendium/latest-plan.json`
- Output: JSON plan written to caller-specified path

### Step 3: Review Dry-Run with Decision Matrix
Use [sync-decision-matrix.md](./references/sync-decision-matrix.md) to classify actions:
- Group by action type: update-candidate, add-candidate, manual-review, hold, preserve, noop
- For each group: decide approve, request-info, or reject
- Identify manual-review items requiring human merge (ownership_mode=extended + source-changed, or managed + local-drift)
- Treat `hold` + `missing-in-source` items as mandatory decommission actions that must be approved and executed in the same sync apply flow

### Step 4: Explicit Approval Checkpoint
Record approval evidence:
- `approvedBy`: User/role approving the sync
- `approvedAt`: Timestamp (ISO 8601)
- `planId`: From dry-run plan (links approval to specific plan)
- Link approval to plan by action group (e.g., "approve all update-candidates", "manual-review extended-mode artifacts separately")

### Step 5: Apply Approved Actions Only
Execute `Apply-CompendiumSync.ps1` with:
- `PlanPath`: Path to JSON dry-run plan (from Step 2)
- `TargetRepoRoot`: Target repo root
- `ApprovedActions`: Comma-separated list of approved artifact IDs or action groups
- `ApprovedRemovals`: Comma-separated list of approved `hold + missing-in-source` artifact IDs (required when hold items exist)
- `SyncReportPath`: `.github/skills/sync-compendium/references/.compendium/latest-sync-report.json`
- Output: Downloads and writes approved `add-candidate`/`update-candidate` artifacts from source, updates lock file and artifact index, writes sync report
- Safety: Rejects unapproved actions; records not-approved in sync report; hard-fails apply when hold items exist without same-flow prune approvals

### Step 6: Validation
Confirm applied state matches plan:
- Verify lock.version matches plan.sourceVersion
- Check sync report shows expected applied/preserved/manual-review counts
- Inspect the sync report written to the `SyncReportPath` from Step 5 for rejection or manual-review flags
- If manual-review items exist, require separate merge prior to next sync

## Decision Logic (8 Rules, Implemented in Invoke-CompendiumSyncPlan.ps1)

| Condition | Decision | Reason |
|-----------|----------|--------|
| source=local | preserve | Never overwrite local ownership |
| ownershipMode=local | preserve | Protected by definition |
| source ≠ source_repo | preserve | Non-compendium source; external artifact |
| managed + no-drift + source-unchanged | noop | No action needed |
| managed + local-drift detected | manual-review | Local changes present; requires merge review |
| managed + source-changed | update-candidate | Eligible for update after approval |
| ownershipMode=extended + source-changed | manual-review | Extended mode + source change requires manual merge |
| missing-in-source | hold | Candidate for explicit prune workflow (`prune-sync-assets`) |
| new-in-source | add-candidate | New artifact from source; eligible for add after approval |

## Companion Scripts

- [Bootstrap-CompendiumSyncEngine.ps1](./references/scripts/Bootstrap-CompendiumSyncEngine.ps1): One-time bootstrap for legacy callers; updates sync engine files from source so subsequent sync runs are fully automated.
- [Invoke-CompendiumSync.ps1](./references/scripts/Invoke-CompendiumSync.ps1): URL-first orchestration wrapper; generates plan and enforces mandatory same-flow prune cleanup when hold items exist.
- [Initialize-CompendiumImport.ps1](./references/scripts/Initialize-CompendiumImport.ps1): First-import setup; creates lock + artifact index stub
- [Invoke-CompendiumSyncPlan.ps1](./references/scripts/Invoke-CompendiumSyncPlan.ps1): Non-interactive; generates deterministic dry-run plan
- [Apply-CompendiumSync.ps1](./references/scripts/Apply-CompendiumSync.ps1): Executes approved actions; updates lock + index; writes audit report

### Legacy Bootstrap Path

If a target repository still uses an older sync engine that cannot apply source file updates, run bootstrap once:

```powershell
./.github/skills/sync-compendium/references/scripts/Bootstrap-CompendiumSyncEngine.ps1 \
	-SourceRepositoryUrl https://github.com/sextondjc/agentic
```

Then execute normal sync using `Invoke-CompendiumSync.ps1`.

## Schemas & Reference Docs

- [artifact-source-schema.md](./references/artifact-source-schema.md): JSON schema for artifact records, lock metadata, field definitions, and validation rules
- [sync-decision-matrix.md](./references/sync-decision-matrix.md): Approval workflow, sync report fields, rejection conditions, and per-action audit trail

## Recommended Prompt Entry

Use [sync-compendium.prompt.md](../../prompts/sync-compendium.prompt.md) as the operator-facing invocation form for target repositories.

## Traceability

- Lock metadata links each sync to source repo, version, commit, approval evidence, and plan ID
- Sync reports (immutable, timestamped) provide per-artifact audit trail
- Artifact index contentHash fields enable integrity checks across imports
