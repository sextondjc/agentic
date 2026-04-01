---
name: prd
description: 'Merged specification + PRD authoring guidelines.'
applyTo: '.docs/plans/**/*.md,.docs/specs/**/*.md,**/*prd*.md'
---
# Product Specification & PRD Guidelines

## Scope
Applies to PRD and specification artifacts only. For general technical documentation, use `technical-docs.instructions.md`.

## Structure
Unified document: Overview → Goals → Personas → Functional Requirements → User Stories (GH-###) → Interfaces/Data Contracts → Acceptance Criteria (AC-###) → Metrics → Risks → Dependencies.

## Requirements IDs
Use REQ-/SEC-/CON-/GUD-/PAT- prefixes; stories GH-###; acceptance criteria AC-###.

## Validation
Guard required metadata (title, scope, personas) before generation.

