---
name: validation
description: 'Standardized Syrx guard usage and validation rationale.'
applyTo: '**/*.cs'
---
# Validation and Guards Policy

Keep this file policy-only. Use [SKILL.md](./../skills/syrx-validation/SKILL.md) for canonical guard patterns, repository-bound model rules, nullability idioms, and examples.

## Mandatory Policy

- Use success-condition guard semantics with `Syrx.Validation.Contract` (`Throw` or `Require`).
- Validate inputs before state mutation.
- Repository-bound models must be immutable and validated at construction/factory boundaries.
- Use precise exception types with clear parameter intent.

