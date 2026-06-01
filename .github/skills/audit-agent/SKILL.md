---
name: audit-agent
description: Use when evaluating one or more workspace .agent.md files for agent-role quality, invocation boundary precision, and platform-currency alignment, then recording remediation recommendations.
---

# Audit Agent

## Specialization

Evaluate `.agent.md` artifacts against agent-governance standards and produce review outcomes (Pass, Pass With Advisories, Fail, Blocked) focused on role boundaries, invocation behavior, and platform fit. Scope is singular: agent quality review and follow-up governance.

## Trigger Conditions

Invoke this skill when any condition below is true:

- A new `.agent.md` file is created.
- An existing `.agent.md` file is modified.
- A periodic quality audit of workspace agents is requested.
- An agent fails discovery, invocation, or behavior expectations.
- Two agents appear to overlap or contradict each other.
- A source-catalog freshness check triggers a platform-currency review.

## Inputs

Required inputs:

- Target agent name or explicit list of target agents.
- Workspace agent root path (default: `.github/agents/`).
- Review date in ISO format (`YYYY-MM-DD`).

Optional inputs:

- Previous review artifact path if already known.
- Change request or incident context.
- Source catalog file path (default: `./references/source-catalog.md`).
- Maximum age threshold in days for source freshness (default: 30).

## Required Outputs

- A per-agent review report stored using template: [audit-agent-report-template.md](./references/audit-agent-report-template.md).
- A conflict report is not produced by this skill; conflict detection across agents is a type-governance concern.
- Updated per-agent history at: `.docs/changes/agent/history/<agent-name>-history.md`.
- Review result summaries MUST be returned in Markdown grid format (tables), not prose lists.
- Aggregate multi-agent results MUST include at least one consolidated grid with per-agent outcomes.
- Per-agent review files MUST be stored under `.docs/changes/agent/reviews/<agent-name>/`.
- Reasoning package per reviewed agent: assumptions, trade-offs, blockers, and one recommendation.
- Source-governance summary when platform-currency validation is requested.
- Updated [source-catalog.md](./references/source-catalog.md) when source tracking changes are made.

## Workflow

1. Resolve target agents and collect current `.agent.md` files.
2. Load the per-agent history file from `.docs/changes/agent/history/` before analysis.
3. Build a recommendation deny-list from history entries marked Rejected, Removed, or Illegitimate.
4. Re-evaluate tracked sources in [source-catalog.md](./references/source-catalog.md) for freshness and platform-currency changes. Update status fields before proceeding to AGR-S5 checks.
5. Build coverage across all mandatory branches: format, invocation trigger, specialization, hard constraints, companion skills, conflict risk, cross-agent delegation, platform currency, and history alignment.
6. Verify growth-governance alignment: duplication control, reuse-before-create, delta-first edits, and explicit review outputs.
7. Evaluate all AGR-M* and AGR-S* checks with evidence.
8. Evaluate platform currency against the current source-catalog state: flag deprecated fields (`infer`), note new available fields that could improve the agent's role clarity or capability boundary.
9. Produce Pass or Fail for MUST standards and advisory outcome for SHOULD standards.
10. For each failed or advisory check, record assumptions, trade-offs, blockers, and one recommendation.
11. If conflict is detected: document it at `.docs/changes/agent/conflicts/`, recommend resolution options, and collaborate with the user to confirm resolution.
12. Update the agent history file with findings, decisions, and recommendation statuses.
13. Confirm deterministic coverage: each requested outcome is mapped to a report artifact or explicit decision.

## Execution Context

### Input Context

- Request objective and scope boundary.
- Applicable constraints and required outputs.

### Process Context

- Follow this skill's deterministic workflow from intake to closure.
- Record ownership and decisions for required outputs.

### Output Context

- Deliverables with explicit completion status.
- Residual risks and next actions.
