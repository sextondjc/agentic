# Customization Rename History

Status: Active ledger, P1 applied
Last Updated: 2026-04-02

## Purpose
Track all agent, instruction, prompt, and skill renames so historical reviews, references, and routing behavior remain traceable.

## Entry Rules

1. Add one row per rename decision in chronological order.
2. Record both old and new names exactly.
3. Include impact scope counts before merge when available.
4. Link affected review/history files that still mention old names.
5. Keep `Status` as `Planned`, `Applied`, or `Deprecated-Alias`.

## Rename Ledger

| Date | Batch/Order | Type | Old Name | New Name | Status | Impact Scope | Backward-Compat Alias | Related Reviews/Notes |
|---|---|---|---|---|---|---|---|---|
| 2026-04-02 | baseline | policy | n/a | n/a | Applied | Baseline only | n/a | Taxonomy baseline established; no renames executed |
| 2026-04-02 | P1-01 | skill | request-review | request-code-review | Applied | active mentions: 31, history mentions: 30 | request-review -> request-code-review | Applied 2026-04-02 with active-scope and linked history updates |
| 2026-04-02 | P1-02 | skill | apply-review | remediate-review | Applied | active mentions: 28, history mentions: 30 | apply-review -> remediate-review | Applied 2026-04-02 with active-scope and linked history updates |
| 2026-04-02 | P1-03 | skill | complete-branch | branch-completion | Applied | active mentions: 36, history mentions: 35 | complete-branch -> branch-completion | Applied 2026-04-02 with active-scope and linked history updates |
| 2026-04-02 | P1-04 | agent | planning-research | plan-researcher | Applied | active mentions: 22, history mentions: 0 | planning-research -> plan-researcher | Applied 2026-04-02 with active-scope and linked routing/reference updates |
| 2026-04-02 | P1-05 | agent | project-setup | workspace-scaffolder | Applied | active mentions: 19, history mentions: 0 | project-setup -> workspace-scaffolder | Applied 2026-04-02 with agent, prompt, and mirrored reference updates |
| 2026-04-02 | P1-06 | agent | performance-researcher | performance-assessor | Applied | active mentions: 20, history mentions: 0 | performance-researcher -> performance-assessor | Applied 2026-04-02 while preserving the benchmark-researcher specialization |
| 2026-04-02 | P1-07 | agent | debug | defect-debugger | Applied | active mentions: 15, history mentions: 0 | debug -> defect-debugger | Applied 2026-04-02 with token-only updates to avoid changing generic debugging prose |
| 2026-04-02 | P1-08 | agent | architecture | architecture-designer | Applied | active mentions: 24, history mentions: 0 | architecture -> architecture-designer | Applied 2026-04-02 with token-only updates to avoid changing generic architectural prose |

## Planned Batch Notes

Batch `P1` is ordered to reduce routing ambiguity early, then move to higher-coupling agent names later.

Execution checklist:

- [p1-execution-checklist.md](./p1-execution-checklist.md)
- `.docs/changes/customization-renames/p1-01-execution-checklist.md`

1. Review loop skills first (`request-review`, `apply-review`) to improve list scan clarity.
2. Delivery completion skill next (`complete-branch`) because of dense history references.
3. Medium-coupling agent renames (`planning-research`, `project-setup`, `performance-researcher`).
4. High-coupling foundational agent names (`debug`, `architecture`) last.

History impact counting method for this batch:

- `history mentions`: match count under `.docs/changes/**`.
- `active mentions`: match count under `.github/**` using constrained name-token queries for ambiguous names.

## Alias Registry

Use this table when aliases are temporarily maintained after a rename.

| Alias Name | Canonical Name | Introduced | Planned Removal | Status |
|---|---|---|---|---|
| request-review | request-code-review | 2026-04-02 | pending | active |
| apply-review | remediate-review | 2026-04-02 | pending | active |
| complete-branch | branch-completion | 2026-04-02 | pending | active |
| planning-research | plan-researcher | 2026-04-02 | pending | active |
| project-setup | workspace-scaffolder | 2026-04-02 | pending | active |
| performance-researcher | performance-assessor | 2026-04-02 | pending | active |
| debug | defect-debugger | 2026-04-02 | pending | active |
| architecture | architecture-designer | 2026-04-02 | pending | active |

## Impact Audit Checklist

- [x] [README.md](./../../../README.md) updated when agent names change
- [x] [README.md](./../../../README.md) updated when instruction names change
- [x] [README.md](./../../../README.md) updated when prompt names change
- [x] [README.md](./../../../README.md) updated when skill names change
- [x] [copilot-instructions.md](./../../../.github/copilot-instructions.md) preferred lists updated
- [x] Existing `.docs/changes/**` references reviewed for old names
- [x] Legacy names added to Alias Registry when transition window is required
