# Governed External Repository Interrogation

## Overview

This package extends the `sync-compendium` skill to safely interrogate external repositories (like [github/awesome-copilot](https://github.com/github/awesome-copilot)) without cloning or direct import behavior.

## What It Does

1. **Reads candidates from external source via GitHub API** — No clone required
2. **Pins discovery to immutable commit SHA** — Audit trail and reproducibility
3. **Scores and filters candidates** — Artifact type ranking to keep top N items
4. **Generates durable evidence bundle** — Approval chain, security sign-off, and rollback references embedded
5. **Produces decision record template** — Structured Adopt / Adapt / Reject intake process
6. **Blocks promotion without governance** — Release cannot proceed until all evidence gates are satisfied

## Usage

### Step 1: Invoke Interrogation

Use the GitHub Actions workflow for visibility and artifact retention:

**Via UI:** Go to Actions → Governed Compendium Interrogation → Run Workflow

**Via CLI:**
```powershell
gh workflow run governed-compendium-interrogation.yml \
  -f source_repository_url=https://github.com/github/awesome-copilot \
  -f workstream_id=WS-EXT-INTAKE-001 \
  -f engineering_owner=your-name \
  -f delivery_owner=product-owner \
  -f security_signoff_reference=SEC-REVIEW-001 \
  -f rollback_reference=RB-PLAYBOOK-001
```

### Step 2: Review Candidates

Artifacts are downloaded from the workflow:

- `latest-candidate-manifest.json` — Discovered artifacts, scored and sorted by relevance
- `latest-evidence-bundle.json` — Approval metadata, checks status, promotion readiness flag

### Step 3: Record Decision

1. Copy [external-ingestion-decision-template.md](./external-ingestion-decision-template.md) to `__DOCS_ROOT__/changes/external-intake/` with a unique name.
2. For each artifact type group (agents, instructions, skills, prompts, scripts), choose **Adopt**, **Adapt**, or **Reject**.
3. Record rationale and follow-up work items.
4. Obtain sign-offs from all approvers listed in the template.

### Step 4: Implement Approved Items

**Do NOT copy external artifacts verbatim.**

For **Adopt** candidates:
- External artifact is accepted as-is (rare; reserved for stable, un-customized reference content).

For **Adapt** candidates:
- External artifact informs a local implementation aligned with your governance model.
- Create a task in `__DOCS_ROOT__/plans` and implement locally with proper lane ownership, instruction compliance, and naming conventions.
- Update relevant catalogs.

For **Reject** candidates:
- No action required.

### Step 5: Release

When all Adapt implementations are complete and approved by review:

1. Ensure the decision record is signed off by all parties.
2. Evidence bundle `promotionReadiness.isReady` must be `true`.
3. Include the decision record ID in release notes.
4. Include rollback reference in release notes.
5. Execute release following normal governance gates.

## Files Added/Modified

| File | Purpose |
|---|---|
| [Invoke-CompendiumSourceInterrogation.ps1](./references/scripts/Invoke-CompendiumSourceInterrogation.ps1) | Core interrogation script; GitHub API-driven, no clone |
| [external-ingestion-decision-template.md](./references/external-ingestion-decision-template.md) | Decision record markdown template |
| [external-source-interrogation.md](./references/external-source-interrogation.md) | Guidance and policy for external interrogation |
| [governed-compendium-interrogation.yml](../../workflows/governed-compendium-interrogation.yml) | GitHub Actions workflow for manual dispatch and artifact retention |
| [SKILL.md](./SKILL.md) | Updated with interrogation mode section |
| [sync-compendium.prompt.md](../../prompts/sync-compendium.prompt.md) | Updated with interrogation command and input guidance |

## Key Guarantees

✅ **Read-only** — No clone, no mutations to external source  
✅ **Commit-pinned** — All candidates linked to immutable source commit SHA  
✅ **Governed** — Approval chain and security sign-off required before adoption  
✅ **Traceable** — Workstream ID, evidence bundle ID, and decision ID form audit trail  
✅ **Durable** — Evidence and decisions persist in workspace under `.github/skills/sync-compendium/references/.compendium/external-intake/`  
✅ **Promotion-blocked** — Release governance gates block import-like behavior; only local adaptation is allowed

## Standard Workflow Entry

See [sync-compendium.prompt.md](../../prompts/sync-compendium.prompt.md) for operator-facing invocation guidance.

Specialist route: `orchestrator` → `csharp-engineer` (with sync-compendium skill).

Planning artifact: `__DOCS_ROOT__/plans/external-interrogation-<workstream-id>.md`.

Change tracking: `__DOCS_ROOT__/changes/external-intake/<decision-id>.md`.

## FAQ

**Q: Can I clone the external repo and cherry-pick items?**  
A: No. The governed intake path is designed to prevent direct clone-and-import behavior. Use interrogation + decision + local implementation instead.

**Q: What if I want to adopt an external skill exactly as-is?**  
A: Mark it as "Adopt" in the decision record, but you still must record rationale, approval chain, and sign-offs. The evidence bundle must show promotion-ready status before release.

**Q: Can I skip the decision record?**  
A: No. The decision record is mandatory evidence for promotion. Release governance will block without it.

**Q: What if my external source doesn't have a `version.json`?**  
A: The script derives a synthetic version identifier from the commit hash (e.g., `0.0.0+08cc5a1`). All candidates are still pinned to that commit SHA in the manifest.

