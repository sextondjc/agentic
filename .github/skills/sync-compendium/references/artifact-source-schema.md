# Artifact Source Schema

Use this schema in target repositories to classify imported assets and preserve provenance.

## Goals

- Disambiguate compendium-owned artifacts from target-local artifacts.
- Enable safe sync planning without clobbering bespoke customization.
- Prove imported source/version/commit at any point in time.

## Required Identity Rules

- `source` must be present for every indexed artifact.
- Compendium-managed artifacts use `source: sextondjc/agentic`.
- Local artifacts use `source: local`.
- Third-party artifacts use `source: third-party/<owner>/<repo>`.

## Artifact Index Record (JSON)

```json
{
  "artifactId": "skills/sync-compendium/SKILL.md",
  "path": ".github/skills/sync-compendium/SKILL.md",
  "artifactType": "skill",
  "source": "sextondjc/agentic",
  "sourceVersion": "1.4.0",
  "sourceCommit": "0123456789abcdef0123456789abcdef01234567",
  "ownershipMode": "managed",
  "mergeStrategy": "replace",
  "contentHash": "sha256:...",
  "lastImportedHash": "sha256:...",
  "lastSyncedAt": "2026-04-11T00:00:00Z"
}
```

## Field Definitions

| Field | Required | Allowed Values | Purpose |
|---|---|---|---|
| `artifactId` | Yes | Stable unique string | Canonical key used for matching during sync. |
| `path` | Yes | Workspace-relative path | Physical file location in target repo. |
| `artifactType` | Yes | `instruction`, `skill`, `agent`, `prompt`, `doc`, `script`, `other` | Classification for reporting and policy checks. |
| `source` | Yes | `sextondjc/agentic`, `local`, `third-party/<owner>/<repo>` | Provenance owner. |
| `sourceVersion` | Yes for imported | SemVer | Imported compendium version tag. |
| `sourceCommit` | Yes for imported | Git SHA | Immutable source reference. |
| `ownershipMode` | Yes | `managed`, `local`, `extended` | Overwrite/merge policy control. |
| `mergeStrategy` | Yes | `replace`, `manual-review`, `append-only`, `none` | How updates are applied when approved. |
| `contentHash` | Yes | `sha256:<hash>` | Current file hash in target repo. |
| `lastImportedHash` | Yes for managed or extended | `sha256:<hash>` | Baseline hash from last approved import. |
| `lastSyncedAt` | Yes | UTC timestamp | Last approved sync timestamp. |

## Ownership Semantics

| Ownership Mode | Behavior |
|---|---|
| `managed` | Eligible for source updates after explicit approval. |
| `local` | Never overwritten by sync workflow. |
| `extended` | Source baseline may update, but local extensions require manual merge review. |

## Companion Lock File (per target repository)

Store one lock file that tracks the currently approved compendium baseline, for example `.compendium/lock.json`.

```json
{
  "sourceRepo": "sextondjc/agentic",
  "version": "1.4.0",
  "commit": "0123456789abcdef0123456789abcdef01234567",
  "approvedBy": "<actor>",
  "approvedAt": "2026-04-11T00:00:00Z",
  "planId": "sync-plan-20260411-001"
}
```

## Validation Rules

- Reject records with missing `source`.
- Reject `managed` records that do not include `lastImportedHash`.
- Reject apply operations when lock file `version` and planned source version differ.
- Reject apply operations when explicit approval evidence is absent.
