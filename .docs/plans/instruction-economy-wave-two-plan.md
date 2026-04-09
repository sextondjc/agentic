<!-- markdownlint-disable-file -->
# Instruction Economy Wave Two Plan

> **For agentic workers:** Use isolated execution. Do not touch files already modified by other sessions.

| Plan ID | Goal | Scope | Out of Scope |
|---|---|---|---|
| PLAN-20260409-IE-W2 | Reduce remaining always-loaded instruction footprint while preserving policy clarity | `task-implementation.instructions.md`, `lifecycle-governance.instructions.md`, Wave 2 change tracking | Any file already showing concurrent drift |

## Workstreams

| Workstream ID | Target | Action | Acceptance Criteria |
|---|---|---|---|
| WS2-01 | `.github/instructions/task-implementation.instructions.md` | Remove procedural/template payload and keep policy shim with routing | Policy linkage and traceability rules remain mandatory; templates moved out of instruction layer |
| WS2-02 | `.github/instructions/lifecycle-governance.instructions.md` | Keep governance rules, remove operational route matrix payload, add routing notes | Lane governance remains explicit and deterministic without workflow duplication |
| WS2-03 | Validation | Re-run error scan and instruction footprint metrics | No new errors in touched files; measurable line reduction |

## Resume Grid

| State | Next Action | Resume Artifact |
|---|---|---|
| In Progress | Apply WS2-01 and WS2-02 edits, then validate metrics | `.docs/changes/instruction-economy-wave-two-changes.md` |
