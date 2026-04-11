---
name: execute-test-driven-development
description: Use when implementing any feature or bugfix, before writing implementation code
---

# Test-Driven Development

## Core Rule

No production code without a failing test first.

## When to Use

- New features.
- Bug fixes.
- Refactoring with behavior preservation.
- Behavior changes.

## Exceptions

- Throwaway prototypes.
- Generated code.
- Pure configuration files.

Confirm exceptions with the user before bypassing TDD.

## Execution Checklist

| Stage | Required Actions |
|---|---|
| RED | Write one behavior test; run and confirm expected failure reason. |
| GREEN | Implement minimal code for that test only; run targeted test then relevant suite. |
| REFACTOR | Improve structure without behavior changes; rerun tests and keep output clean. |

## Acceptance Checks

- Every new behavior has at least one failing-first test.
- Each failing test was observed before implementation.
- Targeted tests pass after code changes.
- Broader suite remains green.
- No warnings or errors are ignored.

## Rationalization Guardrail

If any test-later rationalization appears, stop and restart with test-first. See [tdd-examples-and-anti-patterns.md](./references/tdd-examples-and-anti-patterns.md) for canonical anti-pattern wording.

## Bugfix Flow

| Step | Action |
|---|---|
| 1 | Reproduce bug with a failing test. |
| 2 | Implement minimum fix. |
| 3 | Confirm test passes and run regression checks. |

Never ship a bugfix without a regression test.

## Required Inputs

- User request context and target scope.
- Existing test framework and project test command.

## Required Outputs

- A concrete implementation path that follows Red-Green-Refactor.
- Verifiable evidence that tests failed first and then passed.

## Workflow

1. Define expected behavior as a test.
2. Verify failing state.
3. Implement minimal production code.
4. Verify passing state.
5. Refactor safely.
6. Repeat for next behavior.

## References

- [README.md](./references/README.md)
- [tdd-examples-and-anti-patterns.md](./references/tdd-examples-and-anti-patterns.md)
