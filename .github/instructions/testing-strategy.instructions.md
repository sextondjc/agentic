---
name: testing-strategy
description: 'Unified testing strategy: naming, patterns, and tooling.'
applyTo: '**/*.cs'
---
# Testing Strategy

## Tools
xUnit + Moq only. FluentAssertions banned.

## Test Naming
`{Scenario}{ExpectedBehaviour}` for all test method names. AAA pattern; one assertion concept per test method.

## Test Project Naming
`{Domain}.Tests.Unit` placed under `tests/unit/`.

Examples:
- `<Product>.Orders.Tests.Unit`
- `<Product>.Quality.Tests.Unit`
- `<Product>.Repositories.Tests.Unit`

## Test Folder Structure
Each test project is organized into folders by test category. Use exactly these category names:

| Folder pattern | Purpose |
|---|---|
| `{Subject}BehaviorTests` | Happy-path integration of domain + endpoint behavior; validates that the full flow produces the correct output for valid inputs. |
| `{Subject}RedPhaseTests` | Contract and invariant tests written red-first; validates guard clauses, error conditions, and state-machine transitions. |
| `{Subject}ModelGuardTests` | Isolation tests for model constructor guards; one test per invalid parameter per model type. |
| `QualityHappyPathTests` | Cross-cutting quality gates for happy-path behaviors (e.g., response shape, HTTP status codes). |
| `QualityRedPhaseTests` | Cross-cutting quality gates for error conditions and authorization (e.g., RBAC, authentication). |
| `QualityArchitectureTests` | Architecture boundary enforcement: project references, namespace rules, assembly constraints. |

## Coverage Focus
Prioritize:
1. Domain invariants (model guards)
2. Repository behavior — mock `ICommander<TRepository>`; no live DB calls
3. Service state-machine transitions and error paths
4. Endpoint authorization (RBAC gates in quality red-phase tests)

## Guards Testing
Test that invalid inputs trigger the expected exception type using `Assert.Throws<TException>(() => ...)`. Do not assert on the exception message; assert on the type.

## Architecture Test Pattern
Quality architecture tests verify stable project reference contracts and namespace rules using reflection. Update the expected list whenever a project reference change is intentional and reviewed.

