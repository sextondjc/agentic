# Orchestrator Handoff Example: generate-web-icons

## Example Metadata

- Example ID: ICON-EX-001
- Date: 2026-04-26
- Artifact Type: skill example
- Target Skill: generate-web-icons

## Request

Create and integrate complete web app icon assets for an existing product theme without changing brand style.

## Intake Contract (Orchestrator)

- Objective: Deliver favicon, touch, and PWA icon assets that match the existing design language and are fully integrated into framework metadata.
- In-scope: Icon generation, manifest/head metadata updates, cross-platform icon coverage validation.
- Out-of-scope: Brand redesign, unrelated component/page refactors, broad UX research.
- Required outputs:
  - Icon coverage matrix.
  - Exported icon files for browser/PWA/touch surfaces.
  - Updated `site.webmanifest` and head/framework metadata links.
  - Validation notes and explicit readiness status.
- Primary lane: Execution
- Owner: web-frontend-engineer
- Handoff target: `generate-web-icons` skill within web-frontend implementation flow.
- Determinism status: deterministic-by-default.

## Candidate Selection

### Candidate capabilities

- Web icon asset creation and export.
- Manifest and metadata integration.
- Browser/PWA/touch icon validation.

### Candidate skills

- generate-web-icons
- build-web-frontend
- design-web-ux

### Selected target

- `generate-web-icons` skill with `web-frontend-engineer`.

### Rejected candidates

- design-web-ux (`R2`): request is implementation-focused icon execution, not UX research/design exploration.
- build-web-frontend (`R5`): broader than required; icon-specific workflow is sufficient and lower scope.

## Phase-Output Ownership

| Required Output | Owning Phase | Owner |
|---|---|---|
| Icon coverage matrix | Icon execution | generate-web-icons |
| Icon files exported in required formats and sizes | Icon execution | generate-web-icons |
| Manifest and metadata references updated | Integration | web-frontend-engineer |
| Validation notes and readiness decision | Verification | generate-web-icons |

## Handoff Message (Compact)

Use `generate-web-icons` to produce and integrate icon assets under existing design constraints. Do not alter brand direction. Deliver required outputs exactly as listed in intake contract and return `ready`, `ready-with-exceptions`, or `blocked`.

## Completion Check

- All required outputs owned exactly once: Yes.
- Any unowned output: No.
- Any multiply owned output: No.
- Ready for specialist execution: Yes.
