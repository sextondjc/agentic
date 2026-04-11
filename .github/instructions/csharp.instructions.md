---
name: csharp
description: 'Consolidated C# development, style, and engineering standards.'
applyTo: '**/*.cs,**/*.csproj'
---
# C# Policy

Keep this file policy-only. Use [SKILL.md](./../skills/execute-dotnet-refactor/SKILL.md) for modernization workflow and evidence gates, [SKILL.md](./../skills/execute-test-driven-development/SKILL.md) for behavior-first implementation flow, and [syrx.instructions.md](./syrx.instructions.md) for data-access rules.

## Language and Tooling

- Target the latest stable C# version supported by the target framework.
- Enable nullable reference types and treat warnings as errors.
- For projects with more than one C# file, use a project-level `Usings.cs` for global imports.
- `Usings.cs` is the only allowed file name for project-wide global imports.
- Prefer file-scoped namespaces.

## Structure and Naming

- Use PascalCase for types and methods, camelCase for locals, and `I`-prefixed interfaces.
- Keep exactly one top-level type per `*.cs` file unless the extra type is nested inside the containing type.
- Minimal API route mappings must live outside `Program.cs` in dedicated endpoint or extension files.
- Namespace type aliases are prohibited.
- Enum names must remain domain-precise and unambiguous.

## Documentation and Design

- Comments must explain design intent, not restate obvious code.
- XML documentation is mandatory on public and internal types, constructors, methods, and properties.
- Model constructors and record constructors may contain only guards and simple assignments.
- Complex parsing, normalization, or calculation logic must be extracted to public utility code with tests.
- Service methods must not accept or return API contract types.

## Validation and Async

- Use `Syrx.Validation.Contract.Throw<TException>(...)` for guards.
- Validate before state mutation.
- Public async methods must end with `Async` and accept `CancellationToken`.
- Do not block on async work.
- Use `ValueTask` only when profiling proves it is warranted.

## Dependencies and Testing

- Syrx-only repositories for .NET data access; do not introduce EF Core or alternate ORMs.
- Do not introduce FluentValidation or FluentAssertions.
- Keep abstractions minimal and justified by testing or boundary needs.
- Add or update tests for changed public behavior and important edge cases.

## Security and Prohibited Patterns

- No secrets in code.
- Validate external inputs before persistence or integration work.
- Use structured logging without leaking secrets or sensitive values.
- Prohibited: sync-over-async, silent catches, culture-dependent parsing without explicit culture, speculative reflection micro-optimizations.

## Routing Notes

- Use [SKILL.md](./../skills/execute-dotnet-refactor/SKILL.md) for modernization sequencing, evidence capture, and refactor depth.
- Use [SKILL.md](./../skills/execute-test-driven-development/SKILL.md) for behavior-first delivery flow.
- Use [testing-strategy.instructions.md](./testing-strategy.instructions.md) for test policy specifics.

