---
name: syrx-validation
description: Use when applying or reviewing Syrx.Validation.Contract guard patterns at public boundaries with deterministic validation outcomes.
---

# Syrx Validation

## Overview

Use this skill to standardize boundary validation with `Syrx.Validation.Contract.Throw<TException>` across repository and application entry points.

## When to Use

- Auditing existing .NET code for missing or incorrect Syrx guards.
- Adding boundary validation to new methods before any state mutation.
- Normalizing exception selection (`ArgumentNullException`, `ArgumentException`, etc.).
- Producing deterministic validation findings and targeted remediation changes.

## When Not to Use

- Replacing repository SQL/data-access patterns (use `execute-syrx-data-access` for that).
- General non-Syrx validation strategy decisions.
- Domain behavior changes unrelated to input validation guards.

## Core Rules

- Use success-condition guard semantics: `true` means proceed, `false` throws.
- Validate at method entry before any state mutation.
- Use precise exception types and parameter names.
- Keep guard usage consistent with `.github/instructions/validation-and-guards.instructions.md`.
- Keep recommendations aligned with `.github/instructions/csharp.instructions.md` and `.github/instructions/security-and-secure-coding.instructions.md`.

## Contract.Throw Usage

```csharp
using static Syrx.Validation.Contract;

Throw<ArgumentNullException>(user != null, nameof(user));
Throw<ArgumentException>(!string.IsNullOrWhiteSpace(email), nameof(email));
Throw<ArgumentException>(count > 0, "Count must be positive, got {0}", count);
```

## Workflow

1. Identify public boundaries and externally supplied inputs.
2. Add or correct guards before any mutation or side effect.
3. Verify each guard uses success-condition semantics.
4. Verify exception type and message/parameter intent.
5. Produce deterministic findings and applied-change summary.

## Required Outputs

1. Findings Table
   - File
   - Method/Member
   - Validation Status (Pass/Fail)
   - Recommended Guard
2. Code Changes Applied
   - Updated file list
   - Summary of guard additions or corrections
3. Deterministic Compliance Check
   - Confirm each public boundary uses `Throw<TException>(condition, ...)`
   - Confirm no state mutation occurs before validation
4. Open Gaps
   - Unresolved items requiring user decision

## Related Skills

- `execute-syrx-data-access` for repository SQL/data-access implementation patterns.
