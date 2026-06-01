---
name: kendo-orchestrator
description: Use when a Kendo UI request spans multiple capability areas — source curation, core components, data binding, Grid advanced behavior, charts/dataviz, export/printing, localization, state persistence, real-time updates, upload workflows, observability, theming, accessibility, forms, security, performance, migration, testing, or CI integration — and needs one deterministic intake, explicit phase ownership, and a unified execution contract.
---

# Kendo Orchestrator

## Specialization

Coordinate cross-cutting Kendo UI requests from one intake when work spans source curation, widget implementation, DataSource/MVVM patterns, advanced Grid behavior, charts/dataviz, export and printing flows, localization, state persistence, real-time updates, upload workflows, observability, theme customization, accessibility compliance, form design, security review, performance optimization, version migration, testing, CI enforcement, and quality gating.

This skill is specialized for intake, phase ownership, and unified synthesis. It does not replace deep execution guidance — it routes to the appropriate specialist Kendo UI skill for each phase.

## Objective

Produce one deterministic Kendo UI execution contract from a single intake — with explicit phase ownership, evidence expectations, and closure checks — for any request that spans more than one Kendo UI capability area.

## Trigger Conditions

- A Kendo UI request spans more than one capability area (e.g., new Grid feature + security audit + test coverage).
- A project is adopting Kendo UI for the first time and needs end-to-end implementation guidance.
- An existing Kendo UI codebase requires a full-cycle review: sources → components → DataSource → theming → accessibility → security → gate.
- A Kendo UI version upgrade spans multiple remediation areas (deprecated API, theme rebuild, test regression, security).
- A framework variant migration is in scope (jQuery → KendoReact, → Kendo UI for Angular, → Kendo UI for Vue).
- A team needs one intake instead of disconnected implementation, security, and review workflows.
- A major Kendo UI release requires an impact assessment across all capability areas.

## When Not to Use

- The request is clearly scoped to one capability area — use the specialist skill directly.
- Source-only freshness check: use `kendo-ui-source-curation` directly.
- A single security finding requires remediation: use `kendo-ui-security` directly.
- A single quality gate is needed for a completed feature: use `kendo-ui-quality-gate` directly.

## Scope Boundaries

In scope:

- Deterministic Kendo UI intake and phased execution planning.
- Phase-output ownership with exactly one owner per required output.
- Unified execution recommendation for mixed Kendo UI requests.
- Cross-phase dependency mapping.
- Framework variant awareness: jQuery, KendoReact, Kendo UI for Angular, Kendo UI for Vue.

Out of scope:

- Deep implementation within any one phase.
- Non-Kendo UI frontend tooling unless it directly gates a Kendo UI phase.
- Server-side endpoint implementation.
- Framework migration to non-Kendo UI component libraries.

## Inputs

- User objective and target Kendo UI surface (new feature, version upgrade, security audit, full project review).
- Kendo UI version in use or target version.
- Framework variant: jQuery, KendoReact, Angular, Vue.
- Scope boundaries, browser target matrix, and risk level.
- Required outputs, known constraints, and delivery timeline.
- Evaluation date in ISO format (`YYYY-MM-DD`) for source freshness.

## Required Outputs

- Intake contract with objective, scope boundaries, and required outputs.
- Phase-output ownership matrix.
- Unified Kendo UI execution recommendation.
- Rejected-phase table with deterministic reason codes.
- Closure check confirming all required outputs are owned.

## Deterministic Workflow

### Step 1: Intake Lock

Capture and confirm before proceeding:

- Objective statement (one sentence).
- Kendo UI version and framework variant.
- Scope boundary (files, features, or full project).
- Required outputs list.
- Risk classification: Low / Medium / High.
- Evaluation date (`YYYY-MM-DD`).

### Step 2: Phase Classification

For each user objective, classify into one or more capability phases from the catalog above.

Activation rules:
- **Source Curation** activates when: version context is uncertain, freshness check overdue, or skill references may be stale.
- **Security** activates when: any template uses `#= #`, DataSource has mutating transport, Upload component is in scope, Editor is in scope.
- **Accessibility** activates when: public-facing application, WCAG compliance is a requirement, or Kendo UI widgets are used for data entry.
- **Performance** activates when: dataset size > 500 rows, or SPA navigation recycles Kendo UI views.
- **Migration** activates when: version bump or framework variant change is in scope.
- **Quality Gate** activates at the end of every multi-phase request.

### Step 3: Phase-Output Ownership Matrix

Assign exactly one owner per required output:

| Required Output | Owning Phase | Blocking Dependency |
|---|---|---|
| Source freshness confirmed | Source Curation | None |
| Widget implementation correct | Core Components | Source Curation (if active) |
| DataSource contract verified | Data Binding | Core Components |
| Theme compiles cleanly | Theming | Data Binding |
| ARIA and keyboard compliance | Accessibility | Core Components |
| Validator rules enforced | Forms | Core Components + Data Binding |
| XSS sinks classified | Security | Core Components + Data Binding |
| Performance budget met | Performance | Core Components + Data Binding |
| Breaking changes resolved | Migration | Source Curation |
| Test suite covers all phases | Testing | All active phases |
| CI gates active | CI Integration | Testing |
| Go/No-Go decision | Quality Gate | All other phases |

### Step 4: Cross-Phase Dependency Map

```
Source Curation
    └─► Core Components
            ├─► Data Binding
            │       ├─► Theming
            │       ├─► Forms
            │       ├─► Security
            │       └─► Performance
            └─► Accessibility
Migration ──────────────────────────► Quality Gate
Testing (spans all active phases) ──► Quality Gate
CI Integration ──────────────────────► Quality Gate
```

### Step 5: Closure Check

Before declaring the contract complete, confirm:

- [ ] Every required output has exactly one owning phase.
- [ ] Security is active whenever `#= #`, transport mutations, Upload, or Editor are in scope.
- [ ] Accessibility is active for any public-facing feature.
- [ ] Quality Gate is always the final phase.
- [ ] All phase dependencies are respected in sequencing.

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
