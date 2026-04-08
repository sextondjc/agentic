<!-- markdownlint-disable-file -->
# ADR: Customization Taxonomy v1 Promotion Boundary

- Date: 2026-04-02
- Status: Accepted
- Plan: PLAN-20260402-001
- Decision ID: DEC-03, DEC-05

## Context

The workspace had a taxonomy reference in draft state ([customization-taxonomy-v1.md](./../reference/customization-taxonomy-v1.md)) with stale renamed agent names and missing newer governance assets.

At the same time, operational governance already had clear routing authority through lifecycle governance guidance and lane catalogs:

- [planning-execution-review-governance.md](./../reference/planning-execution-review-governance.md)
- [agent-lifecycle-catalog.md](./../../.github/agents/agent-lifecycle-catalog.md)
- [instruction-lifecycle-catalog.md](./../../.github/instructions/instruction-lifecycle-catalog.md)
- [prompt-lifecycle-catalog.md](./../../.github/prompts/prompt-lifecycle-catalog.md)
- [skill-discovery-index.md](./../../.github/skills/skill-discovery-index.md)

Promoting taxonomy carelessly risked creating a second, conflicting operational source of truth.

## Decision

Promote taxonomy v1 as an **approved conceptual governance reference** only.

The taxonomy is authoritative for:

- conceptual classification
- naming analysis
- family-level reasoning

The taxonomy is not authoritative for:

- operational routing ownership
- lane assignment authority
- runtime execution policy

Operational source-of-truth remains lifecycle governance plus the four lifecycle catalogs.

## v1 Family Decisions

1. Keep `delivery` and `execution` as separate conceptual families.
2. Keep performance assets under `test` in v1.
3. Keep `architecture-designer` under `standards` in v1.

These decisions are v1-stability choices and are explicitly eligible for v2 reassessment.

## Alternatives Considered

### Alternative A: Promote taxonomy and also add `FAMILY` to all lifecycle catalogs now

Rejected.

Reason: This would materially broaden scope and create high churn in governance docs without first stabilizing family semantics.

### Alternative B: Keep taxonomy in perpetual draft and defer promotion

Rejected.

Reason: Draft status left governance readers with stale classification content and reduced discoverability.

### Alternative C: Promote taxonomy as full operational source-of-truth

Rejected.

Reason: This would conflict with established lane-governance artifacts and risk routing ambiguity.

## Consequences

### Positive

- Taxonomy is now current, discoverable, and explicitly scoped.
- Governance readers have one clear conceptual model without replacing operational lane catalogs.
- Future v2 work has a documented baseline and explicit deferred backlog.

### Negative / Trade-offs

- FAMILY remains conceptual and is not queryable directly from lifecycle catalogs.
- Performance-family and architecture-family semantics remain deferred and must be revisited in v2.

## Follow-up

- Run monthly governance checks via `governance-cadence` prompt.
- Open a v2 taxonomy plan only if the workspace decides to operationalize FAMILY in lifecycle catalogs.


