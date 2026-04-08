---
name: dotnet-refactor
description: Use when modernizing .NET code with safe, behavior-preserving improvements such as nullable adoption and obsolete API cleanup.
---

# .NET Modernization Skill

## Specialization

This skill is specialized for the workflow described in this file and should remain narrowly bounded to that responsibility.

It should not absorb adjacent planning, execution, or review responsibilities that belong to other assets.

## Scope

Apply focused cleanup and modernization passes that improve maintainability, safety, and performance without introducing unnecessary layers.

## Rules

- Preserve behavior unless the task explicitly changes behavior.
- Keep changes small and verifiable.
- Prefer measurable improvements over stylistic churn.
- Add or adjust tests when public behavior changes.

## Typical Tasks

- Remove obsolete patterns and APIs.
- Correct async and cancellation usage.
- Improve nullability annotations.
- Reduce warnings and analyzer findings.
- Replace legacy syntax with modern, readable C# where supported by the target framework.

## Trigger Conditions

Invoke this skill when any of the following is true:

- The user wants safe, behavior-preserving .NET modernization work.
- Nullable cleanup, obsolete API removal, or similar refactoring is required.
- A focused modernization pass is needed without broader redesign.

## Inputs

- User request context and target scope for this skill invocation.

## Required Outputs

- A concrete, workspace-applicable result aligned with this skill purpose.

## Workflow

1. Gather required context and constraints from the workspace and user request.
2. Execute the skill-specific steps and produce the required artifacts or decisions.
3. Validate outputs for completeness and consistency with active workspace instructions.

