---
name: technical-docs
description: 'Unified documentation, component, README, and specification generation standards.'
applyTo: '__DOCS_ROOT__/components/**/*.md,__DOCS_ROOT__/changes/**/*.md,__DOCS_ROOT__/plans/**/*.md,README.md,**/README.md'
---
# Documentation & Specifications Policy

Keep this file policy-only. Use [SKILL.md](./../skills/write-technical-docs/SKILL.md) for workflow, templates, coverage operations, and execution detail.

## Scope

Applies to technical reference and README-style documentation. PRD/specification artifacts are governed by `prd.instructions.md`.

## Mandatory Policy

- `README.md` is reserved for true folder entry-point guidance.
- Catalogs, inventories, and discovery surfaces must use descriptive filenames such as `*-catalog.md` or `*-index.md`.
- File names must reflect the document's function; do not publish a catalog or mapping table as `README.md`.
- Documentation artifacts must use granular folder hierarchies under `__DOCS_ROOT__` (for example, `<domain>/<subdomain>/<artifact-type>/`) instead of flat single-level placement.
- Documentation files should not be placed directly in broad roots such as `__DOCS_ROOT__/components/`, `__DOCS_ROOT__/plans/`, or `__DOCS_ROOT__/specs/` unless explicitly requested.
- Change artifacts under `__DOCS_ROOT__/changes/` must follow the canonical hierarchy `__DOCS_ROOT__/changes/<artifact-type>/<artifact-class>/<item>/`.
- Under `__DOCS_ROOT__/changes/`, `<item>` folders that represent a skill, agent, instruction, or prompt must exactly match that asset's canonical catalog name.
- Orphan `<item>` folders in `__DOCS_ROOT__/changes/` (no matching asset in lifecycle catalogs) must be flagged for archive via a recommendation report before any move or delete action.
- Documentation claims must be evidence-backed from current code or existing repository artifacts.
- Use explicit requirement identifiers where specification-like constraints are documented (REQ-, SEC-, CON-, AC-).
- Component documentation must include dependency view, interface summary, usage examples, and quality attributes.


