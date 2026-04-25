---
name: architecture
description: 'Consolidated DDD, SOLID, and .NET architecture guidance for lean application development.'
applyTo: '**/*.cs'
---
# Architecture Policy

Keep this file policy-only. Use [SKILL.md](./../skills/domain-design/SKILL.md) for aggregate discovery, domain-event patterns, ACL design, and other on-demand architecture workflows.

## Domain Model Rules

- Model bounded contexts explicitly and keep ubiquitous language consistent within each boundary.
- Aggregates own consistency boundaries and enforce invariants internally.
- Value objects must be immutable and compare by value.
- Cross-aggregate references should use identifiers unless a different consistency model is explicitly justified.

## Repository and Service Rules

- Repositories persist and reconstruct aggregates; they do not host business rules.
- Use Syrx-backed repositories only for .NET data access.
- Application services orchestrate bounded operations and stay free of transport concerns.
- A bounded write operation should inject one owning repository; cross-entity atomic validation belongs in one stored procedure invoked through that repository.
- Services and repositories must not add local `try/catch` behavior when cross-cutting exception handling is provided at the composition root.

## Domain Events and Integration Rules

- Raise domain events only for meaningful state changes.
- Persist state before dispatching domain events.
- Keep event payloads minimal and prefer identifiers over full object graphs.
- Isolate external or legacy integration translation behind an anti-corruption layer.

## Architecture Decisions

- Significant architecture changes require an ADR in `__DOCS_ROOT__/adr`.
- ADRs must record context, decision, consequences, alternatives, and security implications.

## Routing Notes

- Use [SKILL.md](./../skills/domain-design/SKILL.md) for detailed domain-design workflow.
- Use [SKILL.md](./../skills/adr-generator/SKILL.md) when recording architecture decisions.
- Use [SKILL.md](./../skills/api-design/SKILL.md) for external integration boundary design.
| Tight Coupling | Direct object dependency across aggregates | Use IDs + domain events |

## Evolution Strategy
- Quarterly review of aggregate boundaries & event taxonomy.
- Archive deprecated events with ADR referencing removal.
- Track performance metrics (command latency, event handler failures).

## Observability Hooks
- Emit structured logs on domain event publish (EventName, AggregateId, Version).
- Metrics: count events per type, handler duration percentiles.
- Correlate via trace ID passed through application layer.

## Security Embedding
- Validate input at boundary (DTO → domain) using guards.
- Redact sensitive fields from logs.
- Ensure no direct SQL injection vector (parameterized queries only).

## Glossary Section (Required)

## .NET Layering Rules
- Domain layer contains business rules, invariants, value objects, domain services, and domain events.
- Application layer orchestrates use cases and transaction boundaries.
- Infrastructure layer implements repositories, integrations, and platform concerns.
- Keep infrastructure types out of the domain model.

## Testing Rules
- Test names follow `{Scenario}{ExpectedBehavior}`.
- Focus unit tests on domain behavior and application orchestration.
- Use xUnit and Moq.
- FluentAssertions is banned.

## Delivery Rules
- Show reasoning through concrete architecture outputs, not abstract ceremony.
- Prefer one clear architecture over multiple overlapping patterns.
- Use the latest stable C# supported by the target framework.
Maintain `/__DOCS_ROOT__/spec/glossary.md` listing domain terms: Term | Definition | Source Authority.

## Global Usings Guidance
Add a project-level `Usings.cs` to simplify guard invocation and centralize shared imports:
```csharp
global using static Syrx.Validation.Contract;
```
For projects with more than one `*.cs` file, keep import directives in `Usings.cs` and avoid import `using` directives in other `*.cs` files. Do not overuse `using static`; reserve for ubiquitous guard/contract helpers to maintain readability and reduce verbosity. Avoid fully qualified namespace prefixes for guard calls within domain code.


