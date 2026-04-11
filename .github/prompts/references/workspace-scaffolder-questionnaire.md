# Workspace Scaffolder Questionnaire

Use this questionnaire before creating workspace setup outputs. Do not proceed to analysis until answers are concrete.

## Phase 1: Goals and Domain

1. Problem statement and business goal — what success looks like.
2. Core aggregates and domain entities — key invariants and relationships.
3. External integrations — payment, queues, APIs, other services.

## Phase 2: Architecture and Data

4. Data model — relational, document, hybrid; auditing/temporal requirements.
5. Concurrency and scale assumptions — throughput, batch, latency targets.
6. Boundary strategy — monolith, layered, services; domain events or sagas.

## Phase 3: Security and Compliance

7. Auth/authz model — internal, multi-tenant, customer-facing, role vs permission.
8. Data sensitivity — PII, financial, regulated; audit or retention requirements.

## Phase 4: Tooling and Constraints

9. Team expertise — Syrx, Moq, xUnit, ADR discipline.
10. Performance SLAs — P99 latency, throughput, error rate, availability targets.
11. Deployment strategy — Azure App Service, Kubernetes, on-premises; secrets management.

## Phase 5: Scope

12. Explicit non-goals — what is out of phase 1, with clear boundaries.

## Clarification Rule

- Follow up on any vague answer.
- Replace placeholders with measurable constraints.
- Capture each answer in implementation-ready terms.