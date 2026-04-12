---
name: build-maui-apps
description: Use when building or upgrading .NET MAUI mobile apps and you need a repeatable workflow for architecture, navigation, data, security, testing, performance, and release readiness.
---

# Build MAUI Apps

## Specialization

Provide a repeatable, source-backed workflow for delivering production-grade .NET MAUI mobile applications.

## When to Use

- Starting a new .NET MAUI mobile app.
- Modernizing an existing .NET MAUI mobile app.
- Preparing a MAUI app for production release.
- Diagnosing MAUI architecture, performance, reliability, or deployment gaps.

## When Not to Use

- Non-MAUI mobile stacks.
- Pure backend engineering tasks with no MAUI client.
- Global coding policy enforcement across the repository.

## Self-Containment

This workflow is self-contained and includes source validation, architecture decisions, capability-gap assessment, and iterative refinement within this skill.

## Depth Modes

| Level | Intent | Stop Rule |
|---|---|---|
| L1 Orientation | Understand MAUI foundations | Build a simple multi-page app and explain core MAUI architecture |
| L2 Practical Delivery | Ship one app safely | Deliver one release-ready app with navigation, local data, secure storage, and tests |
| L3 Specialist Hardening | Improve reliability and performance | Demonstrate measurable startup/performance improvement and trim-safe behavior |
| L4 Expert Standardization | Define reusable team standards | Produce reusable patterns, templates, and governance for repeated MAUI delivery |

## Workflow

1. Define outcome, target users, and selected depth mode.
2. Establish architecture baseline: Shell navigation, MVVM boundaries, and DI registration.
3. Implement data/state strategy: local persistence, secure storage, and lifecycle recovery.
4. Add quality baseline: xUnit coverage for ViewModels/services and regression checks.
5. Run hardening pass: profiling, compiled bindings, startup optimizations, and trimming checks.
6. Validate release readiness: signing, packaging, environment configuration, and telemetry hooks.
7. Produce a short readiness report with risks, mitigations, and next improvements.

## Delivery Checklists

### Architecture Checklist

- Shell routes are explicit and predictable.
- MVVM boundaries are enforced (UI logic not in views).
- DI lifetimes are documented and justified.

### Data and Security Checklist

- Local persistence approach is documented.
- Sensitive tokens/secrets are stored in secure storage.
- Offline and lifecycle recovery behavior is defined.

### Testing Checklist

- ViewModel and service tests cover critical paths.
- Async flows include cancellation and failure-path tests.
- Device validation performed on target platforms.

### Performance Checklist

- Profiling evidence captured before optimization.
- Startup and hot-path rendering are measured.
- Trimming compatibility risks are assessed and mitigated.

### Deployment Checklist

- Build configuration and signing path are validated.
- Release package is generated for target store/channel.
- Telemetry and crash diagnostics are enabled.

## Common Mistakes

- Misusing DI lifetimes across navigation and app lifecycle transitions.
- Relying on runtime-only bindings that weaken performance and trimming safety.
- Ignoring lifecycle transitions (suspend/resume) when handling state.
- Releasing without representative device validation.

## Source Ledger

Record evidence with `./references/source-ledger-template.md` for each major architectural or release recommendation.

## Output Contract

Always include:
- Selected depth mode with explicit stop rule.
- Development map (architecture, data, testing, performance, deployment).
- Risk list with mitigation actions.
- Release-readiness status with measurable gates.
- Source ledger references.

## Done Criteria

The workflow is complete when:
- The requested depth stop rule is met.
- Quality and release gates are satisfied for the selected target.
- Source-backed decisions are documented for future reuse.

## Inputs

- User request context and target scope for this skill invocation.

## Required Outputs

- A concrete, workspace-applicable result aligned with this skill purpose.

