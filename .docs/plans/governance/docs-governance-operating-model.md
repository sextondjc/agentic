# .docs Governance Operating Model

## Purpose

Define one repeatable standard for documentation curation, retention, archival, and removal decisions across the .docs corpus.

## Scope

| Included | Excluded |
|---|---|
| .docs/plans, .docs/changes, .docs/research, .docs/adr, .docs/components, .docs/archive | Product runtime code, build outputs, non-document binaries |

## Normative Requirements

| ID | Requirement |
|---|---|
| REQ-DOC-001 | All .docs structural decisions must be captured in markdown artifacts before any file move, rename, archive, or deletion. |
| REQ-DOC-002 | Candidate cleanup actions must include reference count and confidence level. |
| REQ-DOC-003 | Superseded claims must be validated against git history before archive or removal recommendation. |
| REQ-DOC-004 | ADRs and historical ledgers are keep-by-default unless explicitly superseded. |
| REQ-DOC-005 | No move, rename, archive, or deletion action is allowed without explicit approval. |
| REQ-DOC-006 | Index and link-integrity checks are mandatory after approved structural changes. |
| REQ-DOC-007 | .docs/changes hierarchy must follow .docs/changes/<artifact-type>/<artifact-class>/<item>/ for new additions. |
| REQ-DOC-008 | Item folders mirroring skills, agents, instructions, or prompts must match canonical catalog names exactly. |

## Retention and Action Matrix

| Artifact Category | Default Retention | Action Candidate Threshold | Default Action |
|---|---|---|---|
| ADR and governance decisions | Permanent | Explicit superseded record | Keep |
| Active plans and execution logs | While referenced by active workstreams | No references plus superseded plan | Archive candidate |
| Review artifacts under .docs/changes | While source asset remains active | Asset removed or renamed and no active references | Archive candidate |
| Historical ledgers in .docs/archive | Permanent | Never auto-remove | Keep |
| Generated raw script outputs | Until superseded by audited summary | Summary exists and no references | Archive candidate |

## Operating Cadence

| Cadence | Objective | Required Outputs |
|---|---|---|
| Monthly light audit | Catch incremental drift early | Delta findings, orphan candidates, link-integrity status |
| Quarterly full audit | Full governance confidence pass | Type audit, optimization review, docs retention review, prioritized remediation backlog |

## Owners

| Responsibility | Owner |
|---|---|
| Customization alignment governance | Pending Assignment |
| Documentation curation governance | Pending Assignment |
| Approval chain (engineering) | Pending Assignment |
| Approval chain (delivery or product) | Pending Assignment |

## Execution Workflow

1. Run discovery and candidate generation as report-only.
2. Validate reference counts and supersede evidence for each candidate.
3. Publish recommendation grid with Keep, Archive candidate, or Remove candidate.
4. Collect approvals for any structural actions.
5. Apply approved actions only.
6. Re-run link and index validations.
7. Publish post-change status report.

## Verification Rules

- Link integrity must pass after approved structural changes.
- Changed paths must be reflected in relevant indexes.
- Lifecycle catalogs must stay synchronized when mirrored item names change.

## Current Adoption State

| Check | Status |
|---|---|
| Standard published | Pass |
| Monthly template available | Pass |
| Quarterly template available | Pass |
| Owners assigned | Fail |
