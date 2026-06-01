---
name: tailwind-ci-integration
description: Use when TailwindCSS bundle size, class ordering, content scanning, or Core Web Vitals thresholds must be enforced automatically in CI to gate PRs and track regressions across commits.
---

# TailwindCSS CI Integration

## Specialization

Design and review automated CI enforcement for TailwindCSS quality obligations — covering bundle size gating, Prettier class-ordering checks, content-scan regression detection, Lighthouse CI thresholds, and durable artifact storage across commits.

This skill is specialized for CI lifecycle and automated threshold enforcement. Manual evidence-first gate review of a release candidate is handled by `tailwind-quality-gate`.

## Trigger Conditions

- A project needs automated CSS bundle size enforcement on every PR.
- Prettier class-ordering violations are escaping code review and must be caught in CI.
- A content-scanning misconfiguration caused class purging regressions in a previous build.
- Lighthouse CI or Core Web Vitals thresholds need to be committed to config and enforced automatically.
- Bundle size reports are not stored across commits; longitudinal drift is not visible.
- A new Tailwind project needs a CI quality baseline from the start.

## When Not to Use

- Manual evidence-first quality review before promotion (use `tailwind-quality-gate`).
- Setup and build-pipeline wiring for the first time (use `tailwind-setup`).
- Designing component patterns or tokens (use `tailwind-component-design`).

## Inputs

- CI platform (GitHub Actions assumed; note platform differences where applicable).
- TailwindCSS version and build tool (Vite, PostCSS, Next.js, SvelteKit, etc.).
- Bundle size budget (default: ≤ 50 KB gzip for typical app).
- Core Web Vitals thresholds (default: LCP ≤ 2.5s, CLS ≤ 0.1, INP ≤ 200ms).
- PR gate classification: blocking or advisory per check.
- Artifact retention requirements.
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

| Output | Description |
|---|---|
| Bundle size gate job | GitHub Actions workflow step: build, measure gzip output, fail if over budget |
| Prettier check job | CI step running `prettier --check` with `prettier-plugin-tailwindcss`; blocks PR on ordering violations |
| Content-scan verification step | Build step that confirms purged output contains no development-class leakage |
| Lighthouse CI config | `lighthouserc.json` or equivalent with committed thresholds for LCP, CLS, INP |
| Artifact storage contract | Bundle report naming, format, and retention policy for longitudinal comparison |
| Regression alert policy | Threshold breach routing and owner assignment |
| CI job specification | Full GitHub Actions job with isolation controls and noise-reduction checklist |

## Done Criteria

- [ ] Prettier class-ordering check runs on every PR and blocks on violations.
- [ ] CSS bundle size gate runs on every PR; budget is committed to repository configuration.
- [ ] Content-scan verification confirms purged output on every production build.
- [ ] Lighthouse CI config (`lighthouserc.json`) is committed with explicit thresholds.
- [ ] Artifact storage contract is defined with naming, format, and retention policy.
- [ ] Noise-reduction controls checklist applied.
- [ ] Regression alert policy documents routing and SLA per breach type.
- [ ] Security checklist passes.

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
