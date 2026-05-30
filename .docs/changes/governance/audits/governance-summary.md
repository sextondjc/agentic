# Governance Briefing: 2026-05-06

## Disposition Snapshot

| Metric | Value |
|---|---|
| Audit Date | 2026-05-06 |
| Prior Audit | 2026-04-18 |
| Overall Disposition | **FAILED** |
| MUST Failures | 5 (2 root causes) |
| SHOULD Advisories | 46 |
| Assets in Scope | 196 |
| Open Conflicts | 0 |
| Unregistered Skills | 6 |
| Audience | All |

The workspace has **regressed** from a PASSED baseline (2026-04-18, 0 MUST failures, 44 advisories) to a **FAILED** outcome. All 5 MUST failures trace to two root causes that are fully addressable by 2026-05-10.

## Top Salient Findings

| # | Severity | Finding | Asset | Action |
|---|---|---|---|---|
| 1 | **CRITICAL** | 6 capacitor skills on disk but unregistered in skills-discovery-index.md — undiscoverable by agents and prompts | `skills-discovery-index.md` | Register all 6 immediately |
| 2 | **HIGH** | `capacitor-orchestrator` index description lists 9 sub-domains; SKILL.md covers 19 — agents miss 10 routing triggers | `skills-discovery-index.md` | Update description to enumerate all 19 domains |
| 3 | **HIGH** | `csharp-engineer` agent description lacks invocation conditions — orchestrator routing is ambiguous | `csharp-engineer.agent.md` | Replace with concrete, testable invocation directive |
| 4 | **MEDIUM** | 2 prompts have incomplete Output Contract sections (`governance-audit-types`, `governance-item-audit`) | Prompt files | Complete column schemas and file path contracts |
| 5 | **MEDIUM** | 8 stale docs artifacts are archive candidates; 3 files are in wrong directory — corpus hygiene debt is growing | `.docs/changes/` | Archive 8 candidates; relocate 3 misplaced files |

## Risk and Impact

| Risk Area | Impact If Not Remediated |
|---|---|
| Unregistered capacitor skills | Any CapacitorJS auth/session, CI, observability, offline, performance, or migration request will route incorrectly or fail; 6 skills represent work that cannot be used by agents as intended |
| `capacitor-orchestrator` description drift | Agents routing CapacitorJS compound requests may trigger the skill but then fail to handle 10 sub-domain inputs; silent partial-coverage failures |
| `csharp-engineer` ambiguity | Orchestrator may route inappropriate requests to csharp-engineer (architecture, DBA) increasing agent execution errors |
| Process gap — no update-in-same-change enforcement | New skills will continue to be added without registration; next audit will surface the same root cause again |
| Docs corpus debt | Archive candidates consume context budget in agentic reads; misplaced files break catalog navigation |

No open conflicts exist that would block execution today. The routing failures are latent — they manifest when the affected sub-domains are exercised.

## Decision and Action Matrix

| Action | Owner | Target | Priority | Blockers |
|---|---|---|---|---|
| Register 6 unregistered capacitor skills in skills-discovery-index.md | Skills Owner | 2026-05-10 | CRITICAL | None |
| Update `capacitor-orchestrator` description to list 19 sub-domains | Skills Owner | 2026-05-10 | HIGH | None |
| Replace `csharp-engineer` description with invocation conditions | Skills Owner | 2026-05-10 | HIGH | None |
| Enforce update-in-same-change rule for skill additions (process) | Governance Owner | 2026-05-10 | HIGH | None |
| Complete Output Contract sections for 2 prompts | Governance Owner | 2026-05-17 | MEDIUM | None |
| Archive 8 stale docs corpus candidates | Governance Owner | 2026-05-17 | MEDIUM | None |
| Relocate 3 misplaced root-level docs files | Governance Owner | 2026-05-17 | MEDIUM | None |
| Re-audit to confirm disposition recovery | Governance Owner | 2026-05-12 | HIGH | Items 1–4 above must be done first |

The 2026-05-10 remediation batch (actions 1–4) addresses all MUST failures. After completion, re-audit is expected to recover PASSED disposition.

## Evidence Index

| Report | Purpose | Path |
|---|---|---|
| Governance Audit | Core workspace scan | [governance-audit.md](./governance-audit.md) |
| Execute Customization Audit | Aggregated executive outcomes | [execute-customization-audit.md](./execute-customization-audit.md) |
| Governance Executive Audit | Reconciled health overview | [governance-executive-audit.md](./governance-executive-audit.md) |
| Agent Audit | Per-agent findings | [audit-agents.md](./audit-agents.md) |
| Instruction Audit | Per-instruction findings | [audit-instructions.md](./audit-instructions.md) |
| Prompt Audit | Per-prompt findings | [audit-prompts.md](./audit-prompts.md) |
| Skill Type Audit | Per-skill findings | [governance-audit-types-skills.md](./../../skill/reviews/governance-audit-types-skills.md) |
| Naming Audit | Taxonomy findings | [audit-naming.md](./audit-naming.md) |
| Docs Hygiene Audit | Corpus hygiene findings | [audit-docs-hygiene.md](./audit-docs-hygiene.md) |
| Cross-Type Audit | Interaction findings | [governance-audit-types-customizations.md](./../../customization/reviews/governance-audit-types-customizations.md) |
| Optimization Audit | Determinism + scope purity | [governance-audit-types-optimization-2026-05-06.md](./../../customization/reviews/governance-audit-types-optimization-2026-05-06.md) |

