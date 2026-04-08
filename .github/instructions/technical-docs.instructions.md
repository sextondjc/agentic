---
name: technical-docs
description: 'Unified documentation, component, README, and specification generation standards.'
applyTo: '.docs/reference/**/*.md,.docs/components/**/*.md,README.md,**/README.md'
---
# Documentation & Specifications

## Scope
Applies to technical reference and README-style documentation. PRD/specification artifacts are governed by `prd.instructions.md`.

## Core Types
- README blueprint
- OO Component docs (C4 + mermaid)
- Specification / PRD merged documents

## File Naming
- `README.md` is reserved for true folder entry-point guidance.
- Catalogs, inventories, and discovery surfaces must use descriptive filenames such as `*-catalog.md` or `*-index.md`.
- File names must reflect the document's function; do not publish a catalog or mapping table as `README.md`.

## Writing Principles
Unambiguous, machine-parseable, explicit IDs (REQ-, SEC-, CON-, AC-). Provide examples + edge cases.

## Component Docs
Include dependency diagram, interfaces table, usage examples (basic + advanced), quality attributes.

