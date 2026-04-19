---
name: build-mobile-apps
description: Use when building or reviewing cross-platform mobile apps (MAUI or React Native) and you need a repeatable workflow for architecture, navigation, offline data, security, testing, and release readiness.
---

# Build Mobile Apps

## Specialization

Provide a repeatable, standards-aligned workflow for delivering production-grade cross-platform mobile applications on .NET MAUI and React Native targets.

## When to Use

- Starting or modernizing a cross-platform mobile app.
- Reviewing an existing mobile implementation against quality standards.
- Diagnosing mobile architecture, performance, security, or release-readiness gaps.
- Making a platform selection decision between MAUI and React Native.

## When Not to Use

- UX research and wireframe design.
- Web frontend implementation.
- Pure backend engineering tasks with no mobile client.
- Global coding policy enforcement across the repository.

## Required Outputs

| Output | Description |
|---|---|
| Platform selection rationale | Documented decision for MAUI or React Native with criteria evidence |
| Architecture baseline | Navigation structure, MVVM/component-state boundaries, DI registration |
| Working application build | Multi-screen app passing quality and security checklists at the selected depth mode |
| Test coverage | Unit tests for ViewModels/services or components/hooks; one end-to-end flow test |
| Release readiness report | Signed build, environment configuration, telemetry hooks, risks, and next improvements |

## Platform Selection Guidance

| Criterion | Favor MAUI | Favor React Native |
|---|---|---|
| Team skills | .NET/C# team | JavaScript/TypeScript team |
| Backend integration | .NET ecosystem with Syrx | REST/GraphQL with JS ecosystem |
| Native module depth | When .NET bindings are sufficient | When extensive native modules are needed |
| Code sharing with web | Low priority | High priority (shared JS logic) |
| Offline-first complexity | Strong with SQLite / EF MAUI | Strong with Realm / WatermelonDB |

Document the selection rationale before implementation begins.

## Depth Modes

| Level | Intent | Stop Rule |
|---|---|---|
| L1 Orientation | Understand platform foundations | Build a multi-screen app with navigation and explain core architecture |
| L2 Practical Delivery | Ship one app safely | Deliver a release-ready app with navigation, local data, secure storage, and tests |
| L3 Specialist Hardening | Improve reliability and performance | Demonstrate measured startup/frame-rate improvement and security audit pass. For MAUI, include .NET runtime profiling and platform binding review. |
| L4 Expert Standardization | Define reusable team standards | Produce reusable patterns, templates, and governance for repeated delivery |

## Workflow

1. Define outcome, target platforms, UX handoff artifacts, and selected depth mode.
2. Document platform selection rationale if not already decided.
3. Establish architecture baseline: navigation structure, MVVM or component-state boundaries, and DI registration.
4. Implement data and state strategy: local persistence, offline queue/sync, and lifecycle recovery.
5. Apply secure storage for tokens and credentials; validate no sensitive data in preferences or plain storage.
6. Add quality baseline: unit tests for ViewModels/services (MAUI) or components/hooks (React Native), plus one end-to-end flow test.
7. Run accessibility audit: screen reader labels, focus order, and minimum touch-target sizing.
8. Run performance pass: cold-start profiling, list-view scroll rate, and memory pressure baseline.
9. Validate release readiness: signing, packaging, environment configuration, deep link validation, and telemetry hooks.
10. Produce a short readiness report with risks, mitigations, and next improvements.

## Architecture Checklist

- [ ] Navigation routes are explicit, predictable, and typed.
- [ ] MVVM or component-state boundaries enforced (UI logic not in views or screens).
- [ ] DI lifetimes documented and justified.
- [ ] Platform-specific adaptations isolated to named platform files.

## Security Checklist

- [ ] Tokens and credentials stored exclusively in platform secure storage.
- [ ] No sensitive data in Preferences, SQLite plain text, or bundle files.
- [ ] All deep link and URI scheme parameters validated before routing.
- [ ] Certificate validation enabled; pinning documented if used.
- [ ] Debug logging of sensitive identifiers removed before release builds.

## Performance Targets

- App cold start: ≤ 2 seconds on a mid-range device.
- List-view scroll: 60 fps with typical data set.
- Memory: no measurable growth across 10 repeated navigation cycles to the same screen.

## Release Readiness Checklist

- [ ] App signing configured for target stores.
- [ ] Environment configuration externalised (no hardcoded URLs or keys).
- [ ] Telemetry and crash reporting hooks in place.
- [ ] Deep links tested on both platforms.
- [ ] Store metadata and icon assets prepared.
