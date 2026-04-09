# Change History Index

This directory records all implementation change artifacts produced during planned execution work.

## Subdirectories

| Directory | Purpose |
|---|---|
| [customization/](./customization/) | Customization-focused change artifacts, including rename and consolidation work |
| [governance/](./governance/) | Governance change records and audit outputs; retention mode documented in [README.md](./governance/audits/README.md) |
| [powershell/](./powershell/) | PowerShell review and script-maintenance change artifacts |
| [skill/](./skill/) | Skill review, maintenance, and conflict analysis artifacts |

## Conventions

- Change files use descriptive kebab-case names that reflect content.
- Each change file must reference an originating `PLAN-*` identifier.
- Use the template defined in `task-implementation.instructions.md`.
- Update progressively during implementation, not only at completion.
- Governance audit retention is exception-focused: routine pass-only governance runs should update the rolling digest in `.docs/changes/governance/audits/governance-one-pager.md` instead of creating daily dated audit files.
- Create governance audit artifacts only for month-end baselines, milestone checkpoints, or exception events (for example, High findings or policy/ADR-impacting changes).

## References

- Instruction: [task-implementation.instructions.md](./../../.github/instructions/task-implementation.instructions.md)
- Governance Audit: [governance-audit.md](./governance/audits/governance-audit.md)
- Governance Digest: [governance-one-pager.md](./governance/audits/governance-one-pager.md)
- Governance Retention Mode: [README.md](./governance/audits/README.md)
