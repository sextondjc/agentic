---
name: execute-plans
description: Use when you have a written implementation plan to execute in a separate session with review checkpoints
---

# Executing Plans

## Overview

Load plan, review critically, execute all tasks, report when complete.

**Announce at start:** "I'm using the execute-plans skill to implement this plan."

**When to use this skill vs this skill:**

| Situation | Use |
|---|---|
| Subagents are available in the current session | this skill (preferred) |
| Working in a environment without subagent support | this skill |
| Executing the plan in a separate, dedicated session | this skill |
| Requires a human-in-loop checkpoint between tasks | this skill |

## The Process

### Step 1: Load and Review Plan
1. Read plan file
2. Review critically - identify any questions or concerns about the plan
3. If concerns: Raise them with your human partner before starting
4. If no concerns: Create TodoWrite and proceed

### Step 2: Execute Tasks

For each task:
1. Mark as in_progress
2. Follow each step exactly (plan has bite-sized steps)
3. Run verifications as specified
4. Mark as completed

### Step 3: Complete Development

After all tasks complete and verified:
- Announce: "I'm using the branch-completion skill to complete this work."
- **REQUIRED:** Keep execution self-contained within this skill. Do not delegate execution to sibling skills.
- Follow that skill to verify tests, present options, execute choice

## When to Stop and Ask for Help

**STOP executing immediately when:**
- Hit a blocker (missing dependency, test fails, instruction unclear)
- Plan has critical gaps preventing starting
- You don't understand an instruction
- Verification fails repeatedly

**Ask for clarification rather than guessing.**

## When to Revisit Earlier Steps

**Return to Review (Step 1) when:**
- Partner updates the plan based on your feedback
- Fundamental approach needs rethinking

**Don't force through blockers** - stop and ask.

## Remember
- Review plan critically first
- Follow plan steps exactly
- Don't skip verifications
- Reference skills when plan says to
- Stop when blocked, don't guess
- Never start implementation on main/master branch without explicit user consent

## Integration

**Required workflow skills:**
- **writing-plans** - Creates the plan this skill executes
- **branch-completion** - Complete development after all tasks

## Trigger Conditions

Invoke this skill when any of the following is true:

- An approved plan exists and execution will happen through a dedicated or later session.
- The work needs checkpointed progress against a saved plan.
- Execution must preserve a durable handoff boundary between sessions.

## Inputs

- Approved plan path.
- Current execution constraints and branch context.
- Any known blockers or pending decisions.

## Required Outputs

- Task-by-task execution status updates.
- Verification outcomes for completed tasks.
- Branch completion handoff once execution is done.

## Workflow

1. Load and critically review the plan.
2. Execute tasks in order with explicit verification.
3. Stop and ask for guidance when blocked.
4. Hand off to branch-completion after all tasks pass.



