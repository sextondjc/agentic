---
name: build-blazor-web-apps
description: Use when implementing or reviewing Blazor web applications (.NET Client, Server, or MAUI Hybrid) and you need a repeatable workflow for component architecture, performance, accessibility, security, and testing.
---

# Build Blazor Web Apps

## Specialization

Provide a repeatable, standards-aligned workflow for delivering production-grade Blazor applications across Client-side, Server-side, and MAUI Hybrid hosting models with emphasis on .NET-idiomatic patterns, performance optimization, and accessible component design.

## When Not to Use

- UX research and wireframe design (use `design-web-ux`).
- Mobile app implementation with MAUI (use `build-maui-apps` for MAUI native Android and iOS targets).
- Backend API or service implementation (route to `csharp-engineer`).
- Global Blazor policy enforcement (use instruction files in `.github/instructions`).

## Required Outputs

| Output | Description |
|---|---|
| Component implementation | All Blazor components built to UX spec with co-located tests |
| Interop validation | JavaScript interop call sites validated for nullability and error handling |
| Test coverage | Unit tests for component logic and parameter binding; integration tests for key user flows |
| Accessibility audit result | Zero critical/serious axe violations; keyboard navigation, focus management, and screen reader verified |
| Performance baseline | Metrics for Initial Load, Interaction (FID/INP), and CLS measured; bundle size deltas reviewed |
| Security review sign-off | Authorization guards, sensitive data handling, JS interop safety, and CSRF validation confirmed |
| Readiness summary | Open risks, deferred items, hosting model compatibility notes, and next improvement actions documented |

## Workflow

1. Define outcome, target users, UX handoff artifacts, hosting model, and selected depth mode.
2. Establish component architecture: identify shared components, layout strategy, cascading parameters, and state boundaries.
3. Implement routing, navigation, and layout structure; verify keyboard navigation and focus management at this stage.
4. Build components against UX spec, annotate ARIA roles and labels, and define `@parameters` for clear contracts.
5. Bind form data, events, and two-way binding (@bind); validate input using `EditForm` and `DataAnnotationsValidator`.
6. Connect to API or data layer using dependency-injected service abstractions; validate response shapes before consumption.
7. For JavaScript interop: use JSInterop in a guarded wrapper, validate null responses, and handle JS errors gracefully.
8. Add test coverage: unit tests for component logic, parameter validation, and event handling; integration tests for key user flows.
9. Run accessibility audit (axe or equivalent); resolve all critical and serious violations before merge.
10. Measure performance in a production-like environment; address regressions before merge.
11. Apply security review checklist: authorization guards, sensitive data handling, JS interop safety, CSRF token validation.
12. Produce a short readiness summary with open risks, deferred items, and next improvements.

## Inputs

- Request objective and scope boundary.
- Applicable constraints and risk context.

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
