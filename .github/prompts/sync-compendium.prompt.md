---
name: sync-compendium
description: URL-first explicit-approval compendium sync. Operator provides only a GitHub repository URL; workflow derives commit/version/paths and executes plan and apply with approval gates.
---

# Sync Compendium

Route this request to `orchestrator`.

Use the `sync-compendium` skill as the primary workflow.

## Required Input

Provide only:
- `source_repository_url`: GitHub repository URL (for example `https://github.com/sextondjc/agentic`)

Optional for interrogation-only mode:
- `mode`: `interrogate` (collect candidates and evidence only; no apply)
- `workstream_id`: Traceable planning/workstream identifier
- `engineering_owner`: Named approver for engineering
- `delivery_owner`: Named approver for product/delivery
- `security_signoff_reference`: Security evidence or approval reference
- `rollback_reference`: Rollback runbook/reference identifier

Everything else is derived automatically.

## Automation Contract

The agent derives and uses these defaults without asking the user:
- `target_repo_root`: current workspace root
- `target_index_path`: `.github/skills/sync-compendium/references/.compendium/artifact-index.json`
- `plan_out_path`: `.github/skills/sync-compendium/references/.compendium/latest-plan.json`
- `sync_report_path`: `.github/skills/sync-compendium/references/.compendium/latest-sync-report.json`

The agent resolves source metadata from GitHub automatically:
- Normalize owner/repo from `source_repository_url`
- Fetch latest commit SHA from GitHub API
- Resolve `source_version` from source `version.json` when available
- Build source artifact catalog from repository tree when no manifest file is provided

## Execution Contract

1. Normalize owner/repo from `source_repository_url`.
2. Fetch latest commit SHA from GitHub.
3. Compare source latest commit against local `.github/skills/sync-compendium/references/.compendium/version.json` hash for freshness messaging.
4. Initialize state in target repo with `Initialize-CompendiumImport.ps1` when lock/index do not exist.
5. Generate dry-run plan with `Invoke-CompendiumSyncPlan.ps1` using default paths and derived source metadata.
6. Review plan using `sync-decision-matrix.md`; require explicit approval for every non-noop action.
7. Apply only approved add/update actions using `Apply-CompendiumSync.ps1`.
8. If `hold + missing-in-source` actions exist, cleanup is mandatory in the same flow: require approved removals and run prune workflow in that same execution.
9. Validate outputs: lock file, artifact index, sync report, and prune report when hold items were present.

## One-Command Wrapper

Legacy bootstrap (one-time for callers on old sync engine):

```powershell
./.github/skills/sync-compendium/references/scripts/Bootstrap-CompendiumSyncEngine.ps1 \
	-SourceRepositoryUrl https://github.com/sextondjc/agentic
```

Preferred execution entrypoint:

```powershell
./.github/skills/sync-compendium/references/scripts/Invoke-CompendiumSync.ps1 \
	-SourceRepositoryUrl https://github.com/sextondjc/agentic
```

Interrogate external source without cloning/importing:

```powershell
./.github/skills/sync-compendium/references/scripts/Invoke-CompendiumSourceInterrogation.ps1 \
	-SourceRepositoryUrl https://github.com/github/awesome-copilot \
	-WorkstreamId WS-EXT-INTAKE-001 \
	-EngineeringOwner eng-owner \
	-DeliveryOwner delivery-owner \
	-SecuritySignOffReference SEC-REF-123 \
	-RollbackReference RB-PLAYBOOK-01
```

Apply approved actions:

```powershell
./.github/skills/sync-compendium/references/scripts/Invoke-CompendiumSync.ps1 \
	-SourceRepositoryUrl https://github.com/sextondjc/agentic \
	-Apply \
	-ApprovedActions .github/agents/architecture-designer.agent.md \
	-Prune \
	-ApprovedRemovals .github/skills/old-renamed-skill/SKILL.md
```

Mandatory gate behavior:
- If plan contains `hold + missing-in-source` actions, `-Apply` fails unless `-Prune` is set.
- `-ApprovedRemovals` must include every hold artifactId in that plan.

Bootstrap outcome:
- Refreshes the sync engine scripts/prompt/skill files in-place from the source commit.
- After bootstrap, run the normal `Invoke-CompendiumSync.ps1` flow.

## Required Outputs

1. Dry-run plan at `.github/skills/sync-compendium/references/.compendium/latest-plan.json`.
2. Approval table with per-artifact disposition.
3. Applied-change summary with preserved/held/manual-review counts.
4. Updated lock metadata at `.github/skills/sync-compendium/references/.compendium/lock.json`.
5. Sync report at `.github/skills/sync-compendium/references/.compendium/latest-sync-report.json`.

For `mode=interrogate`:

1. Candidate manifest at `.github/skills/sync-compendium/references/.compendium/external-intake/latest-candidate-manifest.json`.
2. Evidence bundle at `.github/skills/sync-compendium/references/.compendium/external-intake/latest-evidence-bundle.json`.
3. Decision record using `external-ingestion-decision-template.md` under the skill references.

## Verification Checklist

- [ ] No root-level `.compendium` paths are created or referenced.
- [ ] No root-level `.artifacts` paths are used.
- [ ] Every artifact has `source` attribution.
- [ ] No `local` ownership artifact is overwritten.
- [ ] No apply action runs without explicit approval evidence.
- [ ] Plan source version and lock metadata source version are consistent.
