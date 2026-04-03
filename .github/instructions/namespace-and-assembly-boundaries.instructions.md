---
name: namespace-and-assembly-boundaries
description: 'Namespace and assembly boundary rules to minimize coupling and keep AI-generated code aligned with layered architecture.'
applyTo: '**/*.cs,**/*.csproj'
---
# Namespace & Assembly Boundaries

## Purpose
Prevent tight coupling by enforcing stable boundaries across `Models`, `Services`, and `Repositories` layers.

## Namespace Pattern
- Use feature-first namespaces with explicit layer suffixes:
  - `Rook.<Context>.<Subcontext>.Models`
  - `Rook.<Context>.<Subcontext>.Services`
  - `Rook.<Context>.<Subcontext>.Repositories`
- Keep interfaces and implementations in the same namespace for repository types.
- Use file-scoped namespaces.

## Naming Conflict Avoidance
- Avoid namespace segments that collide with common type names.
- If a context token could collide with a type (for example `Exchange`, `Drop`, `User`), add a disambiguating subcontext segment:
  - Preferred: `Rook.Exchanges.Trades.Models`
  - Avoid when possible: `Rook.Exchange.Models` with a type named `Exchange`
- If a collision exists in legacy code, use explicit aliases (`using ExchangeEntity = ...`) until a full namespace rename is approved.

## Assembly Rules
- Keep layer separation explicit at assembly boundaries.
- Project and namespace naming should align 1:1 whenever possible:
  - Namespace `Rook.Security.Authentication.Models` -> assembly `Rook.Security.Authentication.Models`
- Do not place model records/classes in `*.Services` or `*.Repositories` assemblies.
- Do not place service classes in `*.Models` or `*.Repositories` assemblies.
- Do not place repository implementation classes outside `*.Repositories` assemblies.

## Allowed Dependency Direction
Use one-way dependencies only:

1. `*.Models` -> no project references to `*.Services` or `*.Repositories`
2. `*.Services` -> may reference `*.Models` and repository abstractions
3. `*.Repositories` -> may reference `*.Models` and data-access libraries only
4. API/host/composition roots -> may reference all implementation layers for DI wiring

## AI Generation Checklist (Required)
Before creating or editing code, ensure:

1. The target namespace ends with exactly one layer suffix: `.Models`, `.Services`, or `.Repositories`.
2. The file is located in a folder path that mirrors the namespace segments after `Rook`.
3. New types do not introduce namespace/type name ambiguity.
4. New project references do not violate the dependency direction above.
5. Any alias added for ambiguity is temporary and documented in the change description.

## Refactor Guidance
- For boundary refactors, move files physically to match namespace structure in the same change.
- Update API endpoints, installers, and tests in the same change set.
- Run focused unit tests for affected projects after each boundary move.
