---
name: ci-cd
applyTo: '.github/workflows/*.yml'
description: 'Consolidated GitHub Actions guidance for secure, efficient CI/CD pipelines.'
---
# GitHub Actions CI/CD Policy

This instruction is policy-only. Workflow tutorials, examples, and stepwise implementation guidance belong in skills or reference docs.

## Workflow Governance

- Workflows must have explicit triggers and descriptive names.
- Workflow and job permissions must be explicitly declared and least-privilege by default.
- Shared-environment workflows must use `concurrency` to avoid overlapping runs.
- Duplicate workflow logic should be extracted into reusable workflows.

## Security Requirements

- Prefer OIDC over long-lived credentials.
- Secrets must come from approved secret stores only; never hardcode sensitive values.
- Pin third-party actions to stable versions (prefer immutable SHAs when feasible).
- CI must include dependency and static security scanning for protected branches.

## Quality Gates

- Restore, build, lint, and tests must pass before deployment stages run.
- Release workflows must fail fast on security and quality gate failures.
- .NET workflows must validate the supported SDK/runtime matrix when applicable.

## Artifact and Reliability Policy

- Use deterministic caching keyed from lockfiles or equivalent dependency manifests.
- Use artifacts to pass build outputs across jobs rather than rebuilding.
- Production deployments must use environment protections and explicit approval controls.
- Deployment workflows must define rollback and post-deployment health validation gates.

## Ownership and Routing

- Keep this file focused on enforceable policy.
- Route execution how-to and implementation walkthroughs to skills and reference docs.
