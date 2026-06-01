---
name: syrx-validation
description: Use when applying or reviewing Syrx.Validation.Contract guard patterns at public boundaries with deterministic validation outcomes.
---

# Syrx Validation

## Overview

Use this skill to standardize boundary validation with `Syrx.Validation.Contract.Throw<TException>` across repository and application entry points, with explicit retrieval-parameter versus state-changing model guard rules.

## Trigger Conditions

- Auditing existing .NET code for missing or incorrect Syrx guards.
- Adding boundary validation to new methods before any state mutation.
- Normalizing exception selection (`ArgumentNullException`, `ArgumentException`, etc.).
- Producing deterministic validation findings and targeted remediation changes.

## When Not to Use

- Replacing repository SQL/data-access patterns (use `syrx-data-access` for that).
- General non-Syrx validation strategy decisions.
- Domain behavior changes unrelated to input validation guards.

## Core Rules

- Use success-condition guard semantics: `true` means proceed, `false` throws.
- Validate at method entry before any state mutation.
- Use precise exception types and parameter names.
- Keep guard usage consistent with `.github/instructions/validation.instructions.md`.
- Keep recommendations aligned with `.github/instructions/csharp.instructions.md` and `.github/instructions/secure-coding.instructions.md`.

## Repository-Bound Model Rules

- Models crossing repository boundaries (DTO/domain types passed to or returned from repositories) must be immutable.
- Use get-only properties or equivalent immutable record semantics; no public setters.
- Run required guard validation at instantiation time (constructor or static factory).
- Use Syrx guard methods from `Syrx.Validation.Contract` (`Throw` or `Require`) for all repository-bound model validation.
- Retrieval contracts may use validated primitive parameters for identifiers and paging only.
- State-changing contracts (`Create*`, `Update*`, `Delete*`) should use validated complex models/options instead of primitive parameter lists.

## Null-Forgiving Operator Idiom

After a guard validates a reference as non-null, use the null-forgiving operator (`!`) when assigning or passing the validated value. This suppresses nullable warnings without introducing redundant null-coalescing expressions.

```csharp
// Guard then null-forgive
public OrderService(IOrderRepository orderRepository)
{
   Throw<ArgumentNullException>(orderRepository is not null, nameof(orderRepository));
   _orderRepository = orderRepository!;
}

public async Task<Order> CreateAsync(Order order, CancellationToken cancellationToken = default)
{
   Throw<ArgumentNullException>(order is not null, nameof(order));
   var created = await _orderRepository.CreateAsync(order!, cancellationToken);
   Throw<InvalidOperationException>(created is not null, nameof(created));
   return created!;
}

// Redundant null-coalescing after guard
_orderRepository = orderRepository ?? throw new ArgumentNullException(nameof(orderRepository));
```

The pattern is: guard asserts the condition holds; `!` communicates that verification to the compiler.

## Contract.Throw Usage

```csharp
using static Syrx.Validation.Contract;

Throw<ArgumentNullException>(user != null, nameof(user));
Throw<ArgumentException>(!string.IsNullOrWhiteSpace(email), nameof(email));
Throw<ArgumentException>(count > 0, "Count must be positive, got {0}", count);
```

`Require<TException>(successCondition, message)` is permitted as an equivalent semantic alias from `Syrx.Validation.Contract`.

## Repository-Bound Guard Examples

```csharp
using static Syrx.Validation.Contract;

public sealed record UpdateUserOptions
{
   public int Id { get; }
   public string DisplayName { get; }

   public UpdateUserOptions(int id, string displayName)
   {
      Throw<ArgumentOutOfRangeException>(id > 0, nameof(id));
      Throw<ArgumentException>(!string.IsNullOrWhiteSpace(displayName), nameof(displayName));
      Id = id;
      DisplayName = displayName.Trim();
   }
}

public sealed record DeleteUserOptions
{
   public int Id { get; }

   public DeleteUserOptions(int id)
   {
      Throw<ArgumentOutOfRangeException>(id > 0, nameof(id));
      Id = id;
   }
}
```

## Rationale

Use fail-fast validation to centralize semantics and maintain a consistent exception taxonomy.

## Workflow

1. Identify public boundaries and externally supplied inputs.
2. Add or correct guards before any mutation or side effect.
3. Verify each guard uses success-condition semantics.
4. Verify exception type and message/parameter intent.
5. Produce deterministic findings and applied-change summary.

## Required Outputs

1. Findings Table (split by model-boundary findings and repository-signature findings)
   - File
   - Method/Member
   - Validation Status (Pass/Fail)
   - Recommended Guard
   - Finding Category (`Model-Boundary` | `Repository-Signature`)
2. Code Changes Applied
   - Updated file list
   - Summary of guard additions or corrections
3. Deterministic Compliance Check
   - Confirm each public boundary uses `Throw<TException>(condition, ...)`
   - Confirm no state mutation occurs before validation
4. Open Gaps
   - Unresolved items requiring user decision

## Related Skills

- `syrx-data-access`: repository SQL/data-access implementation patterns.

## Inputs

- Request objective and scope boundary.
- Applicable constraints and risk context.

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
