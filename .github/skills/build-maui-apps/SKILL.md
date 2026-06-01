---
name: build-maui-apps
description: Use when building or upgrading .NET MAUI mobile apps and you need an expert, source-backed workflow for architecture, secure storage, testing, performance, trimming, and release readiness.
---

# Build MAUI Apps

## Specialization

Provide an expert-level, source-backed workflow for delivering production-grade .NET MAUI mobile applications with explicit attention to Shell navigation, MVVM boundaries, secure storage, performance, and trim-safe release hardening.

## Objective

Produce a MAUI-specific delivery or modernization path for Android and iOS that is architecture-sound, trim-aware, testable, and release-ready.

## Scope Boundaries

In scope:

- MAUI application architecture and navigation targeting both Android and iOS.
- MVVM boundaries, DI, local data, and lifecycle recovery.
- Secure storage and platform-specific release considerations.
- Testing, profiling, trimming, and deployment readiness.

Out of scope:

- Non-MAUI mobile stacks.
- Pure backend engineering with no MAUI client.
- Repository-wide policy authoring.

## Trigger Conditions

- Starting a new .NET MAUI mobile app.
- Modernizing an existing MAUI app.
- Preparing a MAUI app for production release.
- Diagnosing MAUI architecture, performance, reliability, or deployment gaps.

## Inputs

- User request context, target platforms (Android and iOS), and selected depth mode.
- Existing UX handoff artifacts and architecture constraints.
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

- MAUI architecture baseline covering Shell navigation, MVVM boundaries, and DI registration.
- Data, storage, and lifecycle-recovery plan.
- Quality baseline covering tests, device validation, and failure-path coverage.
- Performance and trimming hardening plan.
- Release-readiness report with packaging, signing, telemetry, and residual risks.

## Deterministic Workflow

1. Define outcome, target users, Android and iOS target platforms, and selected depth mode.
2. Establish architecture baseline: Shell navigation, MVVM boundaries, DI registration, and platform-specific isolation.
3. Implement data and state strategy: local persistence, secure storage, and lifecycle recovery.
4. Add quality baseline: xUnit coverage for ViewModels and services, plus device validation on target platforms.
5. Run hardening pass: profiling, compiled bindings, startup optimizations, secure-storage edge cases, and trimming checks.
6. Validate release readiness: signing, packaging, environment configuration, deep-link handling, and telemetry hooks.
7. Produce readiness report with risks, mitigations, and next improvements.

## Delivery Checklists

### Architecture Checklist

- Shell routes are explicit and predictable.
- MVVM boundaries are enforced and UI logic stays out of views.
- DI lifetimes are documented and justified.

### Data and Security Checklist

- Local persistence approach is documented.
- Sensitive values are stored only in secure storage.
- Lifecycle recovery behavior is defined for suspend and resume.
- Secure-storage backup or restore edge cases are considered.

### Testing Checklist

- ViewModel and service tests cover critical paths.
- Async flows include cancellation and failure-path tests.
- Device validation is performed on representative Android and iOS targets.

### Performance Checklist

- Profiling evidence exists before optimization decisions.
- Startup and hot-path rendering are measured.
- Trimming compatibility risks are assessed and mitigated.

### Deployment Checklist

- Build configuration and signing path are validated.
- Release package is generated for the target store or channel.
- Telemetry and crash diagnostics are enabled.

## Common Mistakes

- Misusing DI lifetimes across navigation and lifecycle transitions.
- Relying on runtime-only bindings that weaken performance and trim safety.
- Ignoring suspend or resume transitions when handling state.
- Releasing without representative device validation.

## Done Criteria

- The requested depth stop rule is met.
- Quality and release gates are satisfied for the selected targets.
- Source-backed decisions are documented for future reuse.

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
