---
name: async-programming
description: 'Consolidated async/await and concurrency guidance with ValueTask policy.'
applyTo: '**/*.cs'
---
# Async Programming Policy

Keep this file policy-only. Use [SKILL.md](./../skills/execute-async-programming/SKILL.md) for async/concurrency implementation workflow, streaming/backpressure decisions, and verification execution detail.

## Scope

This file governs async and concurrency policy for C# code. Baseline C# conventions are governed by `csharp.instructions.md`.

## Mandatory Policy

- Use bounded concurrency for high-fanout work and prohibit unbounded task creation over external inputs.
- Fire-and-forget execution is disallowed unless supervised by managed background services.
- Introduce `ValueTask` only with measured evidence.
- Concurrency changes must include verification for cancellation, timeout, and exception propagation.

