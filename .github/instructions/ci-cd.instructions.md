---
name: ci-cd
applyTo: '.github/workflows/*.yml'
description: 'Consolidated GitHub Actions guidance for secure, efficient CI/CD pipelines.'
---
# GitHub Actions CI/CD Policy

Keep this file policy-only. Use [SKILL.md](./../skills/ci-cd-workflows/SKILL.md) for workflow implementation playbooks, security hardening steps, and reliability execution detail.

## Mandatory Policy

- Workflows must define explicit triggers, least-privilege permissions, and concurrency controls where shared environments exist.
- CI/CD pipelines must use approved secret handling, prefer OIDC, and include dependency/static security scanning on protected branches.
- Quality gates (restore/build/lint/tests) must pass before deployment stages.
- Release and production workflows must fail fast on gate failures and enforce environment protections and approvals.
- Cache and artifact behavior must be deterministic, and deployments must include rollback and health validation gates.
