---
name: async-programming
description: 'Consolidated async/await and concurrency guidance with ValueTask policy.'
applyTo: '**/*.cs'
---
# Async Programming Guidelines

## Scope
This file defines advanced async and concurrency policy. Baseline async conventions (method suffixes, cancellation, and blocking prohibitions) are canonical in `csharp.instructions.md`.

## Concurrency Patterns
- Prefer `Task.WhenAll` for independent I/O operations when failure semantics are acceptable.
- Use bounded concurrency (`SemaphoreSlim` or channel-based worker limits) for high-fanout workloads.
- Avoid unbounded task creation in loops over external inputs.

## Fire-and-Forget Policy
- Fire-and-forget tasks are disallowed unless explicitly supervised by a managed background service.
- Any detached task execution requires structured exception handling and observable lifecycle signaling.

## ValueTask Policy
- Consider `ValueTask` only after measured allocation or throughput evidence.
- Document benchmark evidence in ADR or change notes before broad `Task` to `ValueTask` migration.
- Do not expose `ValueTask` in APIs where consumers are likely to await multiple times.

## Streaming and Backpressure
- Prefer `IAsyncEnumerable<T>` for large result streaming when consumer-side backpressure is required.
- Ensure cancellation is honored during async enumeration.

## Verification
- Validate concurrency changes with repeatable tests that cover cancellation, timeout, and exception propagation.

