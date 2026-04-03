# Change History Index

This directory records all implementation change artifacts produced during planned execution work.

## Subdirectories

| Directory | Purpose |
|---|---|
| [customization-renames/](./customization-renames/) | Change artifacts from customization asset rename and consolidation work |
| [governance-audits/](./governance-audits/) | Governance health audit reports produced by the `audit-governance` skill |
| [powershell-script-reviews/](./powershell-script-reviews/) | Audit reports for PowerShell scripts produced by `audit-powershell` skill |
| [skill-maintenance/](./skill-maintenance/) | Maintenance records from `sync-skills` and `sync-customizations` runs |
| [skill-reviews/](./skill-reviews/) | Per-skill review artifacts produced by the `skill-review` skill |

## Conventions

- Change files use the naming format: `YYYYMMDD-<task-description>-changes.md`
- Each change file must reference an originating `PLAN-*` identifier.
- Use the template defined in `task-implementation.instructions.md`.
- Update progressively during implementation, not only at completion.

## References

- Instruction: [task-implementation.instructions.md](./../../task-implementation.instructions.md)
- Governance: [planning-execution-review-governance.md](./../reference/planning-execution-review-governance.md)
