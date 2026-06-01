---
name: jquery-ci-integration
description: Use when jQuery build, test, deprecation, security, and bundle workflows must be automated in CI/CD with deterministic toolchains, reproducible outputs, and promotion-grade evidence.
---

# jQuery CI Integration

## Specialization

Design and implement automated CI enforcement for jQuery quality obligations — covering QUnit/Jest test execution, jQuery Migrate deprecation detection, `eslint-plugin-jquery` API correctness gates, `npm audit` CVE detection scoped to jQuery dependencies, and bundle size budget enforcement across commits and PRs.

This skill is specialized for CI lifecycle and automated threshold enforcement for jQuery. Manual evidence-first gate review of a release candidate is handled by `jquery-quality-gate`. Test suite design and local execution patterns are handled by `jquery-testing`.

## Trigger Conditions

- A jQuery project needs automated test execution (QUnit or Jest) in CI with deterministic result artifacts.
- jQuery Migrate deprecation warnings are not being caught before merge.
- Deprecated jQuery API calls are escaping review (`.live()`, `.bind()`, `.size()`, etc.) without an automated check.
- Known jQuery CVEs (CVE-2019-11358, CVE-2020-11022/11023) are not being detected in the dependency pipeline.
- jQuery bundle size (core + plugins) has no enforced upper bound across commits.
- A new jQuery project needs a CI quality baseline from day one.
- A jQuery version upgrade needs regression evidence captured automatically per commit.

## When Not to Use

- Manual evidence-first quality review before promotion (use `jquery-quality-gate`).
- Designing the test suite itself — fixture isolation, event simulation, AJAX mocking (use `jquery-testing`).
- Migrating from jQuery v1/v2 to v3 (use `jquery-migration`).
- Reviewing individual XSS sinks or CSRF patterns in code (use `jquery-security`).
- Bundle optimization and DOM batching during implementation (use `jquery-performance`).

## Inputs

- CI platform (GitHub Actions assumed; note platform differences where applicable).
- Test runner in use: QUnit (browser or Node via `qunit` CLI) or Jest + jsdom.
- jQuery version in use and whether jQuery Migrate is installed.
- Bundle size budget for jQuery core + plugins combined (default: ≤ 90 KB gzip).
- PR gate classification per check: blocking or advisory.
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

| Output | Description |
|---|---|
| Test execution job | CI step running QUnit (via `qunit` CLI) or Jest with coverage threshold enforcement |
| Migrate deprecation gate | CI step loading jQuery Migrate in headless mode and failing if warnings are emitted |
| ESLint API gate | `eslint-plugin-jquery` configured and run on every PR; fail on deprecated API calls |
| CVE scan step | `npm audit --audit-level=high` scoped to jQuery dependency chain; fail on unpatched high/critical CVEs |
| Bundle size gate | Build + measure gzip of jQuery core + plugin bundle; fail if combined size exceeds budget |
| Artifact storage contract | Test results (JUnit XML), coverage reports, and bundle size delta stored per build for longitudinal comparison |
| CI job specification | Full GitHub Actions job with isolation controls, caching, and noise-reduction checklist |

## Done Criteria

- All declared checks execute and produce deterministic pass/fail output on every PR.
- Artifacts (test results, coverage, audit log, bundle size) are stored and retained per the contract.
- At least one blocking check covers tests, deprecated API, and CVE detection.
- The Migrate deprecation gate runs on PRs targeting main or staging.
- Bundle size gate has an explicit budget value stored as a CI variable (not hardcoded).
- Noise-reduction checklist is satisfied: dependency caching, pinned versions, `--ci` flag.
- Threshold policy (budgets, coverage floors) is documented as named CI variables.

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
