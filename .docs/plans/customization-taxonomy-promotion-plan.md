<!-- markdownlint-disable-file -->
# Customization Taxonomy Promotion Plan

> **For agentic workers:** REQUIRED WORKFLOW: Use the `plan-researcher` agent for planning handoff, then use `orchestrator` to dispatch approved execution work to `task-execution` or `executing-plans` as appropriate. Use `customization-authoring` for taxonomy and governance asset edits, `write-technical-docs` for reference index promotion, and `audit-governance` for final validation. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Promote the customization taxonomy from draft baseline to an approved conceptual governance reference without introducing catalog churn, routing ambiguity, or unclear source-of-truth precedence.

**Architecture:** Resolve taxonomy scope and governance precedence first, then normalize the stale document to current asset names and full current asset inventory, then promote only the documentation that is necessary to make the taxonomy discoverable and durable. Keep the `FAMILY` field conceptual in v1 and defer any README catalog schema rewrite to a later v2 decision.

**Tech Stack:** Markdown governance artifacts under `.docs/` and `.github/`; lifecycle governance, naming conventions, and technical docs instructions.

---

## Plan Metadata

| Field | Value |
|---|---|
| Vision ID | `VIS-20260402-001` |
| Plan ID | `PLAN-20260402-001` |
| Status | `Completed` |
| Owner Lane | `Planning` |
| Origin | Promotion of [customization-taxonomy-v1.md](./../reference/customization-taxonomy-v1.md) from draft to approved reference |
| Primary Decision | `DEC-01` |
| Recommended Execution Route | `orchestrator` split into Execution then Review |

## Execution Disposition

| Field | Value |
|---|---|
| Approval | Approved by user on 2026-04-02 |
| Execution Route Used | Same-session execution of approved plan tasks |
| Completion Date | 2026-04-02 |
| Completion Evidence | [customization-taxonomy-promotion-changes.md](./../changes/customization-taxonomy-promotion-changes.md), [governance-audit.md](./../changes/governance/audits/governance-audit.md) |

## Intent and Scope

| Plan ID | Vision ID | Goal | In Scope | Out of Scope | Assumptions | Constraints |
|---|---|---|---|---|---|---|
| `PLAN-20260402-001` | `VIS-20260402-001` | Promote the taxonomy to an approved, current, discoverable conceptual governance reference. | Resolve taxonomy promotion boundary; define source-of-truth precedence; refresh taxonomy content to current asset inventory; document the governing decision; promote discoverability in reference docs; validate governance integrity after changes; maintain progressive execution traceability. | Adding `FAMILY` columns to all catalog/index files; renaming assets as part of this promotion; changing folder structure; introducing CI enforcement in the same change set. | Taxonomy promotion should stabilize governance understanding first and schema expansion second. | Must preserve lane-based catalogs as canonical operational routing artifacts, avoid scope creep into broad catalog redesign, and satisfy `.docs/changes` traceability requirements during execution. |

## Parallel Workstreams

| Workstream ID | Lane Owner | Agent/Skill/Prompt | Inputs | Outputs | Dependencies | Parallel Group |
|---|---|---|---|---|---|---|
| `WS-01` | Planning | `critical-thinking` + plan authoring | Current taxonomy draft, rename history, active catalogs | Resolved promotion boundary and explicit decisions | None | `P1` |
| `WS-02` | Execution | `customization-authoring` | Approved decisions, taxonomy draft, current agent/instruction/prompt/skill catalogs, rename history | Updated taxonomy reference doc, progressive change log, and ADR | `WS-01` | `P2` |
| `WS-03` | Execution | `write-technical-docs` | Updated taxonomy doc and ADR | Promoted links/index references for discoverability | `WS-02` | `P3` |
| `WS-04` | Review | `audit-governance` | Updated docs, change log, catalogs, reference index | Governance validation report and approval-ready disposition | `WS-02`, `WS-03` | `P4` |

## Acceptance and Governance

| Workstream ID | Acceptance Criteria IDs | Security Checks | Test/Validation Evidence | Review Gate | Exit Decision ID |
|---|---|---|---|---|---|
| `WS-01` | `AC-001`, `AC-002`, `AC-003` | Documentation only; no secret or system changes | Boundary decisions recorded, source-of-truth precedence made explicit, and no unresolved promotion ambiguity remains | Required | `DEC-01` |
| `WS-02` | `AC-004`, `AC-005`, `AC-006` | Ensure references are workspace-local and non-placeholder | Taxonomy reflects current asset names and full current governance asset inventory; progressive change log references `PLAN-20260402-001` | Required | `DEC-02` |
| `WS-03` | `AC-007` | No broken internal links | Reference index exposes taxonomy and ADR location on required surfaces | Required | `DEC-03` |
| `WS-04` | `AC-008`, `AC-009` | Governance audit contains no unresolved High findings | Post-change governance audit confirms integrity, discoverability, and no precedence conflict | Required | `DEC-04` |

## Session Survival Handoff

| Workstream ID | Current State | Next Action | Blockers | Resume Command/Prompt | Artifact Links |
|---|---|---|---|---|---|
| `WS-01` | Planned | Obtain user approval on promotion boundary and execution route | Awaiting approval | Continue from this plan | [customization-taxonomy-promotion-plan.md](./customization-taxonomy-promotion-plan.md) |
| `WS-02` | Not started | Update taxonomy content, create ADR, and maintain progressive change log after approval | `DEC-01` approval required | Use `task-execution` if approved in-session; else `executing-plans` | [customization-taxonomy-v1.md](./../reference/customization-taxonomy-v1.md), [customization-taxonomy-promotion-changes.md](./../changes/customization-taxonomy-promotion-changes.md) |
| `WS-03` | Not started | Add discoverability links after taxonomy content is final | `WS-02` not complete | Use `write-technical-docs` workflow | [index.md](./../reference/index.md), [README.md](./../adr/README.md) |
| `WS-04` | Not started | Run governance audit and capture findings | `WS-02` and `WS-03` not complete | Use `audit-governance` skill (`governance-cadence` may be used only as a convenience prompt wrapper) | `.docs/changes/governance/audits/` |

## Critical Evaluation Grid

| Risk ID | Weakness / Risk | Impact | Likelihood | Why It Matters | Mitigation Applied In Plan |
|---|---|---|---|---|---|
| `RISK-01` | Promote a stale taxonomy document | High | High | The current draft still contains outdated agent tokens such as `architecture` and `debug`, and it predates `audit-governance` and `governance-cadence`. Promoting it as-is would codify incorrect governance state. | Force a normalization pass in `WS-02` before any promotion language is applied. |
| `RISK-02` | Over-scope promotion into full catalog schema rewrite | High | Medium | Adding `FAMILY` to all catalog/index files in the same change set multiplies edit surface and raises drift risk before family semantics are settled. | Keep `FAMILY` conceptual in v1 and defer catalog schema changes to a future v2 plan. |
| `RISK-03` | Family model remains ambiguous | High | Medium | `delivery` vs `execution`, `performance` vs `test`, and `architecture-designer` placement are unresolved and can produce inconsistent classification. | Require explicit decisions in `WS-01` and reflect them in the promoted taxonomy document and ADR. |
| `RISK-04` | Promotion without discoverability | Medium | High | An approved taxonomy that is not linked from the reference index remains effectively hidden and fails governance adoption. | Add discoverability updates in `WS-03`. |
| `RISK-05` | Promotion without durable decision record | Medium | Medium | Future maintainers will not know why v1 stayed conceptual or why catalog schema changes were deferred. | Create an ADR in `WS-02` documenting promotion boundary and deferred work. |
| `RISK-06` | No post-change integrity check | High | Medium | Taxonomy and index edits can still leave orphaned docs or mismatched governance claims. | Require `audit-governance` validation in `WS-04` before completion. |
| `RISK-07` | Promotion creates overlapping governance authority | High | Medium | If the taxonomy is called authoritative without a narrow boundary, it can conflict with lifecycle governance and the four operational catalogs that already govern routing and lane ownership. | Make non-precedence explicit: lifecycle governance plus the four catalogs remain operational source of truth; taxonomy v1 is authoritative for conceptual classification only. |
| `RISK-08` | Execution lacks required traceability | Medium | Medium | Without a `.docs/changes` artifact linked to the plan and workstreams, execution would violate the change-tracking policy and make deviations hard to audit. | Add a dedicated progressive change log to `WS-02` and `WS-04`. |

## Strengthening Decisions Applied

| Decision ID | Decision | Rationale |
|---|---|---|
| `DEC-01` | Promote the taxonomy as an approved reference, not as an operational catalog schema mandate. | This preserves stable lane-based routing catalogs while making the taxonomy authoritative as conceptual governance guidance. |
| `DEC-02` | Normalize the taxonomy document to current asset inventory before changing status language. | Promotion must follow correctness, not precede it. |
| `DEC-03` | Record the promotion boundary and deferred v2 work in an ADR. | The conceptual-vs-operational boundary is a governance decision that should survive sessions and future debates. |
| `DEC-04` | Require final validation by `audit-governance` before marking the work complete. | Promotion without review would leave governance drift unchecked. |
| `DEC-05` | Lifecycle governance plus the four catalog/index files remain the operational source of truth for routing and lane ownership. | This prevents the promoted taxonomy from creating a second operational authority. |

## Family Resolution Output Grid

| Topic | Current v1 Position | Recommended v1 Decision | Approval Decision Required | Planned Output |
|---|---|---|---|---|
| `delivery` vs `execution` | Separate families | Keep both as separate families in v1 | Confirm whether both remain in v1 or `delivery` is normalized under `execution` | Explicit decision row in taxonomy and ADR |
| `performance` vs `test` | Performance assets grouped under `test` | Keep under `test` for v1 and defer dedicated `performance` family to v2 | Confirm whether that grouping remains in v1 or moves to a dedicated `performance` family | Explicit decision row in taxonomy and ADR |
| `architecture-designer` family placement | Agent currently discussed as possible drift from `standards` | Keep in `standards` for v1 and document the rationale plus follow-up review | Confirm whether it stays in `standards` for v1 or moves to `planning` | Explicit decision row in taxonomy and ADR |

## File Map

| File | Action | Responsibility |
|---|---|---|
| [customization-taxonomy-v1.md](./../reference/customization-taxonomy-v1.md) | Modify | Normalize asset inventory, resolve family semantics, update status from draft to approved baseline, and remove stale statements. |
| [customization-taxonomy-promotion-changes.md](./../changes/customization-taxonomy-promotion-changes.md) | Create | Progressive execution log linking changes back to `PLAN-20260402-001`, affected workstreams, and any deviations. |
| [README.md](./../adr/README.md) | Modify | Add the new ADR to the local ADR index. |
| [customization-taxonomy-promotion-boundary.md](./../adr/customization-taxonomy-promotion-boundary.md) | Create | Record why v1 promotion is documentation-first and why catalog schema changes remain deferred. |
| [index.md](./../reference/index.md) | Modify | Add an explicit link to the taxonomy reference if missing and keep the reference set discoverable. |
| [planning-execution-review-governance.md](./../reference/planning-execution-review-governance.md) | Modify only if needed | Add a brief cross-reference to the promoted taxonomy only if a discoverability gap remains after index updates. |
| `.docs/changes/governance/audits/governance-audit.md` | Create during execution | Capture post-change governance validation. |

## Approval Criteria

| AC ID | Requirement |
|---|---|
| `AC-001` | Promotion scope is explicitly limited to reference-governance promotion, not catalog schema migration. |
| `AC-002` | Open family-model ambiguities are resolved or explicitly deferred with rationale. |
| `AC-003` | The promoted taxonomy explicitly states that lifecycle governance and the four catalog/index files remain the operational source of truth for routing and lane ownership. |
| `AC-004` | The taxonomy document is updated to current asset names and full current governance asset inventory. |
| `AC-005` | The taxonomy document no longer contains stale renamed agents or missing governance assets introduced after 2026-04-01. |
| `AC-006` | The taxonomy status is changed from draft to approved baseline with concise rationale, and a progressive `.docs/changes` artifact is defined for execution. |
| `AC-007` | Discoverability documentation links are present on the required surfaces: reference index for taxonomy and ADR index for the decision record. |
| `AC-008` | The ADR captures the promotion boundary, source-of-truth precedence, and future v2 catalog decision space. |
| `AC-009` | Final governance audit reports no unresolved High findings related to taxonomy currency, orphaned governance docs, or precedence conflicts. |

## Execution Tasks

### Task 1: Resolve Promotion Boundary

**Files:**
- Modify: [customization-taxonomy-promotion-plan.md](./customization-taxonomy-promotion-plan.md)
- Review: [customization-taxonomy-v1.md](./../reference/customization-taxonomy-v1.md)
- Review: [agent-lifecycle-catalog.md](./../../.github/agents/agent-lifecycle-catalog.md)
- Review: [instruction-lifecycle-catalog.md](./../../.github/instructions/instruction-lifecycle-catalog.md)
- Review: [prompt-lifecycle-catalog.md](./../../.github/prompts/prompt-lifecycle-catalog.md)
- Review: [skill-discovery-index.md](./../../.github/skills/skill-discovery-index.md)

- [ ] Confirm that v1 promotion means reference approval, not README catalog schema migration.
- [ ] Confirm whether `delivery` remains distinct from `execution` for v1.
- [ ] Confirm whether performance artifacts remain under `test` for v1 or move to a dedicated `performance` family.
- [ ] Confirm whether `architecture-designer` stays under `standards` for v1 or moves to `planning`.
- [ ] Approve or revise the recommended v1 family decisions captured in the Family Resolution Output Grid.
- [ ] Record the final decisions in the Family Resolution Output Grid and carry them into both the taxonomy and ADR.
- [ ] Record that lifecycle governance and the four catalog/index files retain operational precedence after promotion.

### Task 2: Normalize and Promote the Taxonomy Document

**Files:**
- Modify: [customization-taxonomy-v1.md](./../reference/customization-taxonomy-v1.md)
- Create: [customization-taxonomy-promotion-changes.md](./../changes/customization-taxonomy-promotion-changes.md)
- Review: [rename-history.md](./../changes/customization/renames/rename-history.md)
- Review: [agent-lifecycle-catalog.md](./../../.github/agents/agent-lifecycle-catalog.md)
- Review: [instruction-lifecycle-catalog.md](./../../.github/instructions/instruction-lifecycle-catalog.md)
- Review: [skill-discovery-index.md](./../../.github/skills/skill-discovery-index.md)
- Review: [copilot-instructions.md](./../../.github/copilot-instructions.md)
- Review: [prompt-lifecycle-catalog.md](./../../.github/prompts/prompt-lifecycle-catalog.md)

- [ ] Create the execution change log with `PLAN-20260402-001`, planned workstream mapping, and deviation section.
- [ ] Replace stale asset names from pre-rename state with current canonical names.
- [ ] Add missing current governance assets that now exist, including `audit-governance` and `governance-cadence`.
- [ ] Reconcile every taxonomy row against the current agent, instruction, prompt, and skill catalogs.
- [ ] Update cross-check text so it reflects the current catalogs and current governance state.
- [ ] Replace draft status language with approved-baseline language once normalization is complete.
- [ ] Remove or revise any statements that are invalidated by current workspace state.
- [ ] Update the change log progressively as each taxonomy edit lands.

### Task 3: Record the Decision Boundary

**Files:**
- Create: [README.md](./../adr/README.md)

- [ ] Write an ADR capturing the decision to promote taxonomy v1 as a conceptual governance reference.
- [ ] Document why catalog schema changes were deferred to a separate v2 decision.
- [ ] Document that operational routing authority remains with lifecycle governance and the four catalog/index files.
- [ ] Document the accepted v1 family model boundaries and known follow-up questions in a decision grid.
- [ ] Add the ADR to the ADR index.

### Task 4: Promote Discoverability

**Files:**
- Modify: [index.md](./../reference/index.md)
- Modify only if needed: [planning-execution-review-governance.md](./../reference/planning-execution-review-governance.md)

- [ ] Add a direct reference-index link to the promoted taxonomy document.
- [ ] Ensure the ADR is discoverable from [README.md](./../adr/README.md).
- [ ] Add a cross-reference from governance docs only if the taxonomy remains hard to discover after those two required surfaces are in place.
- [ ] Validate all new relative links.

### Task 5: Validate and Close

**Files:**
- Modify: [customization-taxonomy-promotion-changes.md](./../changes/customization-taxonomy-promotion-changes.md)
- Create: `.docs/changes/governance/audits/governance-audit.md`

- [ ] Run `audit-governance` after edits complete.
- [ ] Update the progressive change log with final modified and created files plus any deviations.
- [ ] Confirm no unresolved High findings remain for taxonomy currency, orphaned docs, catalog integrity, or precedence conflicts.
- [ ] Capture any Medium/Low advisories as explicit deferred work.
- [ ] Present final disposition against `AC-001` through `AC-009`.

## Dispatch Plan After Approval

| Situation | Route | Reason |
|---|---|---|
| Approval granted in this session | `orchestrator` -> `task-execution` | Same-session execution fits the execution route matrix and keeps the work checkpointed. |
| Approval granted in a later or dedicated session | `orchestrator` -> `executing-plans` | Preserves handoff integrity and durable checkpointed progress. |
| Post-execution review | `audit-governance` | This is a governance-layer change; the governance audit is the required review gate. |

## Recommendation

Approve this plan if you want a low-risk promotion that makes the taxonomy authoritative for conceptual classification, current, and discoverable without committing the workspace to a premature README catalog schema migration. The recommended v1 decision set is: keep `delivery` separate from `execution`, keep performance assets under `test` for v1, and keep `architecture-designer` in `standards` for v1 while documenting the follow-up review.

Reject or revise this plan only if you want `FAMILY` promoted from conceptual metadata to an operational catalog field immediately; that would require a materially broader v2 plan.



