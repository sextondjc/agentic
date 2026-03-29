---
name: validation-and-guards
description: 'Standardized Syrx guard usage and validation rationale.'
applyTo: '**/*.cs'
---
# Validation & Guards

## Pattern
`Throw<TException>(successCondition, message)` where `successCondition == true` means proceed; false throws.

`Require<TException>(successCondition, message)` is also allowed as a semantic alias from `Syrx.Validation.Contract`.

## Repository-Bound Model Rule
- Models crossing repository boundaries (DTO/domain types passed to or returned from repositories) must be immutable.
- Use get-only properties (or equivalent immutable record semantics); no public setters.
- Run all required guard validation at instantiation time (constructor or static factory).
- Use Syrx guard methods from `Syrx.Validation.Contract` (`Throw` or `Require`) for all such validation.

## Examples
```csharp
Throw<ArgumentNullException>(user != null, nameof(user));
Throw<ArgumentException>(!string.IsNullOrWhiteSpace(email), nameof(email));
```

## Rationale
Fail-fast, centralizes validation semantics, consistent exception taxonomy.

