---
name: test-driven-development
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

### RED

- Write one test for one behavior.
- Use behavior-first naming.
- Use real behavior assertions before mocks.
- Run the test and confirm it fails for the expected reason.

### GREEN

- Implement the minimal code to pass only that test.
- Do not add extra features or speculative options.
- Re-run the targeted test and then the relevant suite.

### REFACTOR

- Remove duplication and improve naming.
- Keep behavior unchanged.
- Re-run tests and keep output clean.

## Acceptance Checks

- Every new behavior has at least one failing-first test.
- Each failing test was observed before implementation.
- Targeted tests pass after code changes.
- Broader suite remains green.
- No warnings or errors are ignored.

## Rationalization Guardrail

If any of these appears, stop and restart with test-first:

- I will add tests after implementation.
- This is too small to test.
- I already tested manually.
- I already spent too much time to delete this.
- Tests-after gives the same value.

## Bugfix Flow

1. Reproduce bug with a failing test.
2. Implement minimum fix.
3. Confirm the test passes.
4. Run regression checks.

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
