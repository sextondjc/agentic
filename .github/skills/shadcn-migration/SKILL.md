---
name: shadcn-migration
description: Use when migrating an existing application from another component library (MUI, Chakra UI, Mantine, Ant Design) to shadcn/ui — covering component equivalence maps, token migration, progressive coexistence patterns, and breaking-change sequencing.
---

# shadcn/ui Migration

## Specialization

Provide expert-level guidance for migrating production applications from MUI (Material UI), Chakra UI, Mantine, or Ant Design to shadcn/ui — covering component equivalence mapping, CSS variable token migration, progressive coexistence patterns that allow incremental replacement without breaking existing UI, and breaking-change sequencing with rollback markers.

This skill is specialized for migration from another component library. Initial project wiring for greenfield work is handled by `shadcn-setup`. Theming and token design for new projects is handled by `shadcn-theming`. Design system governance for multi-app scenarios is handled by `shadcn-design-system`.

## Trigger Conditions

- An existing app using MUI, Chakra UI, Mantine, or Ant Design needs to move to shadcn/ui fully or partially.
- A team wants to progressively replace a legacy component library without a big-bang rewrite.
- Token/theme values from an existing design system need to be mapped to shadcn CSS variable semantics.
- Bundle size reduction is a goal and the current library is large (MUI's full import is typically 300–500 KB gzip).
- Coexistence of shadcn and the legacy library during migration needs to be scoped and governed.
- Migration has stalled due to component gaps — shadcn has no equivalent for a specific legacy component.

## When Not to Use

- Initial setup for a greenfield project (use `shadcn-setup`).
- Theming for a net-new project (use `shadcn-theming`).
- Multi-app design system governance (use `shadcn-design-system`).
- Migrating from one shadcn version to another (use `shadcn-setup` with the diff/upgrade section).

## Inputs

- Source library and version (e.g., `@mui/material@5`, `@chakra-ui/react@2`, `@mantine/core@7`, `antd@5`).
- Target framework: Next.js App Router, Vite + React, Remix, or SvelteKit.
- Migration scope: full replacement, partial replacement, or coexistence target state.
- Existing theme/token values if a brand design system is in use.
- Component inventory: list of components actively used in the application.
- Team velocity and acceptable coexistence duration.
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

| Output | Description |
|---|---|
| Component equivalence map | Source library component → shadcn/ui equivalent, including gap analysis for components with no direct equivalent |
| Token migration map | Source theme values → shadcn CSS variable equivalents (`--primary`, `--background`, etc.) |
| Migration sequencing plan | Ordered list of replacement phases with coexistence rules and rollback markers per phase |
| Coexistence configuration | How to run both libraries simultaneously: CSS specificity isolation, conflicting reset handling, provider nesting |
| Gap components register | Components with no shadcn equivalent — custom Radix-based implementation plan or deferral rationale |
| Bundle impact projection | Expected gzip delta per phase as legacy library chunks are removed |
| Breaking-change log | Prop API differences, behavior differences, and migration adapter patterns |
| Completion criteria | Definition of "fully migrated" — zero legacy library imports in production bundle |

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

## Migration Reference Assets

- Detailed equivalence maps, coexistence examples, and sequencing templates live in [Reference assets](./references/README.md).
- Keep this skill focused on migration intake, scope decisions, and execution contracts.
