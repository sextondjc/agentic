---
name: jquery-migration
description: Use when migrating jQuery from v1 or v2 to v3, using the jQuery Migrate plugin to assess compatibility, or planning a phased replacement of jQuery with native browser APIs.
---

# jQuery Migration

## Specialization

Plan and execute expert-level jQuery migrations — v1/v2 to v3 upgrades using the jQuery Migrate plugin, and phased jQuery-to-native-API replacement strategies — with deterministic compatibility checks, sequenced remediation, and rollback safety.

## Trigger Conditions

- Upgrading a project from jQuery 1.x or 2.x to jQuery 3.x.
- Installing or evaluating the jQuery Migrate plugin.
- Planning a phased replacement of jQuery with native browser APIs (`fetch`, `querySelectorAll`, `classList`, etc.).
- Auditing existing code for deprecated or removed jQuery APIs.
- Reviewing browser support implications of removing jQuery from a legacy codebase.
- A `jquery-quality-gate` identifies deprecated API usage that requires remediation.

## Scope Boundaries

In scope:

- jQuery 1.x/2.x → 3.x breaking changes and deprecation inventory.
- jQuery Migrate plugin installation, configuration, and console-warning triage.
- Phased native API replacement: Fetch, DOM, Events, Utilities.
- Browser support matrix decisions when dropping jQuery.
- Rollback plan for failed migration attempts.

Out of scope:

- Framework migrations (e.g., jQuery → React/Vue/Angular). This skill covers jQuery core migration only.
- Plugin compatibility upgrades beyond the decisions driven by a core jQuery version bump.
- Build tool or bundler reconfiguration (covered in project build tooling, not this skill).

## Inputs

- Current jQuery version(s) in use (may differ per page or module).
- Browser support matrix.
- jQuery Migrate plugin warning log if available.
- List of jQuery plugins in use and their jQuery compatibility declarations.
- Target: upgrade to jQuery 3.x, or replace jQuery entirely.
- Timeline and risk tolerance.

## Required Outputs

- Compatibility audit: breaking changes relevant to the codebase.
- jQuery Migrate plugin configuration and interpreted warning log.
- Phased remediation plan with per-phase scope, rollback trigger, and validation gate.
- Plugin compatibility matrix: which plugins support the target jQuery version.
- Native API replacement map (if full jQuery removal is targeted).
- Go/no-go recommendation for each migration phase.

## Workflow

1. Collect current jQuery version and Migrate warning log.
2. Identify breaking changes relevant to the codebase from the inventory.
3. Build plugin compatibility matrix.
4. Sequence phases and assign go/no-go gate for each.
5. Execute Phase 0 and Phase 1 before changing the jQuery version.
6. After Phase 3 passes, assess Phase 4 if full jQuery removal is in scope.

## Done Criteria

- jQuery Migrate emits zero warnings after Phase 1.
- Target jQuery version is loaded and smoke tests pass.
- All plugins are verified compatible.
- A rollback trigger is documented for each phase.
- If native replacement: replacement map is complete and test coverage is maintained.

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
