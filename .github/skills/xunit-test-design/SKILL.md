---
name: xunit-test-design
description: Use when designing expert-level xUnit tests with deterministic Fact/Theory selection, data strategy, assertion quality, and boundary coverage.
---

# xUnit Test Design

## Specialization

Use this skill to design maintainable, deterministic, and behavior-focused xUnit tests that scale across projects.

This skill is specialized for test-case design. It does not implement production code.

## Objective

Produce a deterministic xUnit test design package that defines test shapes, data strategy, coverage intent, and assertion standards for a target behavior slice.

## Trigger Conditions

- New tests are needed for a feature, fix, or regression boundary.
- Existing xUnit tests are brittle, unclear, or redundant.
- Teams need consistent cross-project test design standards.

## Scope Boundaries

In scope:

- Fact vs Theory selection.
- Data strategy (`InlineData`, `MemberData`, `ClassData`) decisions.
- Coverage-intent planning for success, failure, and boundary behavior.
- Assertion clarity and determinism checks.
- Integration layout decisions for repository tests, including assembly boundary (`<Assembly>.Tests.Integration.csproj`), type folder naming (`<TypeName>Tests`), and method-focused test class ownership.
- Test class naming rules where each test class name must exactly match the public repository method being tested (for example, `RetrieveAsync`, `RetrieveAllAsync`).

Out of scope:

- Integration test infrastructure provisioning.
- UI or end-to-end workflow automation.
- Non-xUnit framework migration work.

## Inputs

- Target behavior contracts and failure modes.
- Risk profile and defect history for the target slice.
- Data constraints and boundary conditions.
- Evaluation date in ISO format (`YYYY-MM-DD`) for source freshness checks.

## Required Outputs

- Test shape matrix mapping behavior to `Fact` or `Theory`.
- Data-source strategy map with rationale.
- Coverage-intent matrix across success, failure, and boundary paths.
- Assertion standards checklist.
- Final design recommendation with residual risks.
- Integration test ownership map including assembly name, `<TypeName>Tests` folder, per-method test classes, and fixture name.

## Deterministic Workflow

1. Enumerate behavior contracts and failure modes.
2. Choose `Fact` or `Theory` per behavior with one explicit rationale.
3. Select data source strategy based on readability, reuse, and stability needs.
4. Map coverage expectations for happy path, failure path, and boundaries.
5. Define assertion strategy for precision and maintainability.
6. Identify anti-pattern risks and mitigation actions.
7. Publish one design recommendation with unresolved risks.

## Decision Rules

- Use `Fact` when one deterministic scenario validates behavior.
- Use `Theory` when behavior must hold across multiple parameter sets.
- Prefer `InlineData` for compact scalar cases.
- Prefer `MemberData` or `ClassData` for reusable, complex, or generated cases.
- Prefer behavior-first test method names without underscores; reserve exact class-name matching for the method-under-test class boundary.
- Prioritize failure-path coverage first for repository methods, then include at least one validated happy-path assertion per method.

## Repository Test Design Examples

```csharp
namespace My.Application.Repositories.Tests.Integration.UserReadRepositoryTests;

public sealed class RetrieveAsync
{
	[Fact]
	public async Task EmailIsNullOrWhitespaceThrowsArgumentException()
	{
		// failure-path validation
	}

	[Fact]
	public async Task EmailTooLongThrowsArgumentException()
	{
		// failure-path validation
	}

	[Fact]
	public async Task InvalidEmailThrowsInvalidEmailException()
	{
		// failure-path validation
	}

	[Fact]
	public async Task UnknownEmailReturnsNull()
	{
		// failure-path validation
	}

	[Fact]
	public async Task CancellationRequestedIsSuccessful()
	{
		// cancellation-path validation
	}

	[Fact]
	public async Task Success()
	{
		// happy-path validation returning User
	}
}

public sealed class RetrieveAllAsync
{
	[Fact]
	public async Task PageIsNonPositiveThrowsArgumentOutOfRangeException()
	{
		// failure-path validation
	}

	[Fact]
	public async Task SizeIsNonPositiveThrowsArgumentOutOfRangeException()
	{
		// failure-path validation
	}

	[Fact]
	public async Task CancellationRequestedIsSuccessful()
	{
		// cancellation-path validation
	}

	[Fact]
	public async Task Success()
	{
		// happy-path validation returning users
	}
}

public sealed class UserReadRepositoryTestsFixture
{
	// shared integration setup for UserReadRepositoryTests
}
```

## Anti-Pattern Checks

- Test names that describe implementation instead of behavior.
- Overloaded theories with unrelated assertions.
- Assertion bundles that hide the failing intent.
- Data sources with unstable ordering or implicit side effects.
- Sync-over-async setup or teardown in async repository tests.
- Tests that assert method names or overload shapes instead of externally observable behavior.
- Test classes that mix assertions for multiple repository methods instead of one class per public method (`RetrieveAsync`, `RetrieveAllAsync`, etc.).
- Missing repository-specific fixture in `<TypeName>Tests` integration folders (for example, `UserReadRepositoryTestsFixture`).

## Done Criteria

- Trigger conditions are satisfied.
- Required outputs are complete.
- Decision logic is explicit.
- Source catalog is current for this evaluation cycle.

## Workflow

1. Capture inputs and constraints.
2. Execute this skill's deterministic steps.
3. Publish outputs with status and next actions.

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
## References Assets

- [Reference assets](./references/README.md)
