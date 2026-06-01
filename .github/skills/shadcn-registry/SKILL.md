---
name: shadcn-registry
description: Use when authoring, hosting, or consuming a custom shadcn/ui component registry — covering registry.json schema, component item types, CLI resolution, hosting strategy, and cross-project distribution for org-owned components.
---

# shadcn/ui Custom Registry

## Specialization

Provide expert-level guidance for designing and operating a custom shadcn/ui component registry — covering the `registry.json` schema, component item type taxonomy, CLI resolution and `npx shadcn add <url>` consumption, hosting strategies (static file host, npm package, or monorepo local), dependency declaration, and cross-project distribution patterns for org-owned components.

This skill is specialized for registry authoring and hosting. Component design and CVA variant patterns are handled by `shadcn-component-design`. Shared package governance and monorepo architecture are handled by `shadcn-design-system`. CI drift detection against the upstream shadcn registry is handled by `shadcn-ci-integration`.

## Trigger Conditions

- A team wants to distribute org-owned components using the same `npx shadcn add` CLI UX as upstream shadcn components.
- A monorepo needs a private registry so downstream apps pull components with pinned deps and style contracts.
- Components built on Radix primitives need to be shareable across projects without a published npm package per component.
- An existing shared component library should be migrated from direct file copying to registry-based distribution.
- Registry items need dependency declarations so the CLI can auto-install required npm packages alongside component files.
- A custom registry must co-exist with the upstream shadcn registry without collision.

## When Not to Use

- Component authoring without registry concerns (use `shadcn-component-design`).
- Monorepo shared package architecture without registry distribution (use `shadcn-design-system`).
- CI enforcement of upstream component freshness (use `shadcn-ci-integration`).
- Initial project wiring and `components.json` setup (use `shadcn-setup`).

## Inputs

- Component inventory: names, file paths, and peer dependencies.
- Distribution target: static URL, npm package, or monorepo local resolution.
- Consumer projects and their frameworks (Next.js App Router, Vite + React, SvelteKit).
- Whether the registry will co-exist with upstream `registry.shadcn.com`.
- Hosting infrastructure: GitHub Pages, Vercel, Cloudflare Pages, or private npm registry.
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

| Output | Description |
|---|---|
| `registry.json` | Complete registry index with all component items, types, and metadata |
| Component item files | Per-component `registry/<name>.json` with `files`, `dependencies`, `devDependencies`, `registryDependencies`, and `cssVars` |
| Hosting configuration | Static host or npm package setup so the registry URL resolves correctly |
| `components.json` consumer config | `registryUrl` entry pointing to the custom registry |
| CLI consumption instructions | `npx shadcn add <registry-url>/<component>` invocation pattern |
| Co-existence contract | How custom and upstream registries are referenced together without collision |
| Versioning strategy | How component versions are managed and communicated to consumers |
| Open items | Known gaps, deferred components, and platform constraints |

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
