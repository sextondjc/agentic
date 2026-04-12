---
name: testing-strategy
description: 'Unified testing strategy: naming, patterns, and tooling.'
applyTo: '**/*.cs'
---
# Testing Strategy Policy

Keep this file policy-only. Use [SKILL.md](./../skills/execute-test-driven-development/SKILL.md) for canonical testing workflow, naming rules, structure patterns, and coverage guidance.

## Mandatory Policy

- xUnit and Moq are required; FluentAssertions is prohibited.
- Test names must follow `{Scenario}{ExpectedBehaviour}`.
- Guard tests must assert exception type and not assert exception messages.
- Architecture tests must enforce approved project-reference and namespace boundary contracts.

