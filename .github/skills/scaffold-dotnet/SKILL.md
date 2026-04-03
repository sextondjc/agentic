---
name: scaffold-dotnet
description: Use when creating a new .NET workspace or solution skeleton and you need standard folders plus reusable build assets applied consistently.
---

# Scaffold DotNet

## Overview

Use this skill to scaffold a baseline .NET workspace layout in a target repository and apply shared template assets, including `Directory.Build.targets`.

## When to Use

- Starting a new .NET project or solution repository.
- Standardizing folder layout across repos.
- Applying baseline build assets during scaffolding.

## Baseline Structure

```text
.config
.docs
.github
.scripts
src
test
test/common
test/integration
test/unit
```

## Quick Command

```powershell
pwsh ./.github/skills/scaffold-dotnet/references/scripts/New-DotNetSolutionScaffold.ps1
```

## What It Applies

- Creates the baseline folder structure.
- Adds `.gitkeep` files for empty scaffold directories.
- Copies `Directory.Build.targets` from this skill's template assets to the workspace root when missing.
- Supports `-ForceTemplate` to overwrite the root `Directory.Build.targets` with the template version.

## Notes

- This skill is for reusable scaffolding workflow.
- Keep mandatory coding policy in instruction files; use this skill for on-demand setup execution.
- The target workspace root refers to the consumer repository being scaffolded, not this customization repository.

## Inputs

- User request context and target scope for this skill invocation.

## Required Outputs

- A concrete, workspace-applicable result aligned with this skill purpose.

## Workflow

1. Gather required context and constraints from the workspace and user request.
2. Execute the skill-specific steps and produce the required artifacts or decisions.
3. Validate outputs for completeness and consistency with active workspace instructions.

