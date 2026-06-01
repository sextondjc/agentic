---
name: tailwind-design-system
description: Use when a shared TailwindCSS design token package is maintained across multiple applications or a monorepo — covering token versioning, breaking-change governance, downstream consumption patterns, and cross-app visual consistency.
---

# TailwindCSS Design System

## Specialization

Provide expert-level governance for a shared TailwindCSS design token system used across multiple applications or a monorepo — covering token package architecture, semantic naming conventions, versioning policy, breaking-change management, downstream consumption patterns, and cross-app visual consistency audits.

This skill is specialized for multi-app or monorepo token governance. Single-application token work is handled by `tailwind-component-design`. Build pipeline setup is handled by `tailwind-setup`.

## Trigger Conditions

- A team maintains a shared Tailwind token package consumed by two or more applications.
- A monorepo has multiple apps and needs a single source of truth for design tokens.
- A token change in one app must be evaluated for downstream breaking impact before release.
- Visual consistency drift between apps is identified and needs systematic correction.
- A new shared component library is being extracted from an existing app.
- Token versioning and deprecation policy does not exist or is informal.

## When Not to Use

- Single-application token design (use `tailwind-component-design`).
- Project setup and build pipeline (use `tailwind-setup`).
- Quality gate review for one application's release (use `tailwind-quality-gate`).
- CI enforcement for a single application (use `tailwind-ci-integration`).

## Inputs

- Repository topology: monorepo or polyrepo; number of consuming applications.
- Current token inventory and any existing design token package structure.
- Design tool artifacts (Figma tokens, Style Dictionary config, or similar) if available.
- Breaking-change policy requirements and release cadence.
- Framework mix across consumers (React, Vue, Svelte, Blazor, etc.).
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

| Output | Description |
|---|---|
| Token package architecture | Directory structure, export format, and package naming for the shared token package |
| Semantic token taxonomy | Canonical role hierarchy: primitive → semantic → component-specific |
| `@theme` token map | CSS custom properties for all semantic roles, mapped to primitives |
| Versioning and deprecation policy | Semver policy for token packages; deprecation notice and removal timeline |
| Breaking-change impact matrix | Which consuming apps are affected by a proposed token change |
| Downstream consumption guide | How consuming apps import and extend the shared token package |
| Cross-app consistency audit template | Checklist for verifying visual consistency across consumers |
| Readiness summary | Open risks, migration debt, and deferred token work |

## Done Criteria

- [ ] Token package architecture documented with three-layer taxonomy.
- [ ] `@theme` block covers all semantic roles (brand, surface, border, text, status, typography, spacing).
- [ ] Versioning and deprecation policy is explicit with timeline and semver rules.
- [ ] Breaking-change impact matrix template is available and used for every Minor/Major release.
- [ ] All consuming apps document their import pattern and declared token version.
- [ ] Cross-app consistency audit checklist completed.
- [ ] CI token drift detection step added to at least one pipeline.
- [ ] Readiness summary written with open migration debt and deferred items.

## Workflow

1. Capture inputs and constraints.
2. Execute this skill's deterministic steps.
3. Publish outputs with status and next actions.

## Execution Context
### Input Context

- Request objective and scope boundary.
- Applicable constraints and required outputs.

### Process Context

- Follow this skill's deterministic workflow from intake to closure.
- Record ownership and decisions for required outputs.

### Output Context

- Deliverables with explicit completion status.
- Residual risks and next actions.
## References Assets

- [Reference assets](./references/README.md)
