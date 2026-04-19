# External Ingestion Decision Template

Use this template after running `Invoke-CompendiumSourceInterrogation.ps1`.

## Decision Header

| Field | Value |
|---|---|
| Decision ID | DEC-EXT-000 |
| Workstream ID | WS-EXT-000 |
| Evidence Bundle | ./references/.compendium/external-intake/latest-evidence-bundle.json |
| Candidate Manifest | ./references/.compendium/external-intake/latest-candidate-manifest.json |
| Source Repository | owner/repository |
| Source Commit | <commit-sha> |
| Engineering Owner | <name-or-role> |
| Delivery Owner | <name-or-role> |
| Security Sign-Off Reference | <security-evidence-id> |
| Decision Timestamp (UTC) | YYYY-MM-DDTHH:MM:SSZ |

## Scope Disposition

| Candidate Group | Disposition (Adopt, Adapt, Reject) | Rationale | Follow-Up Work Item |
|---|---|---|---|
| agents |  |  |  |
| instructions |  |  |  |
| prompts |  |  |  |
| skill docs |  |  |  |
| scripts |  |  |  |

## Governance Checks

| Check | Status (Pass, Fail) | Evidence |
|---|---|---|
| Source pinned to immutable commit |  |  |
| No clone/import behavior used |  |  |
| Approval chain recorded |  |  |
| Security sign-off recorded |  |  |
| Rollback reference recorded |  |  |
| Licensing reviewed |  |  |

## Release Notes Readiness

| Section | Content |
|---|---|
| Scope Included |  |
| Scope Deferred/Descoped |  |
| Known Issues |  |
| Rollback Reference |  |
| Approval Evidence Reference |  |

## Reviewer Sign-Off

| Role | Name | Decision | Timestamp (UTC) |
|---|---|---|---|
| Engineering |  | Approve or Reject |  |
| Delivery/Product |  | Approve or Reject |  |
| Security (if required) |  | Approve or Reject |  |
