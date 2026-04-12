---
name: ci-cd-workflows
description: Use when authoring or reviewing GitHub Actions workflows for secure, reliable CI/CD delivery.
---

# CI/CD Workflows

## Specialization

Implement and review GitHub Actions workflow definitions with secure defaults, deterministic quality gates, and deployment reliability controls.

## Workflow Governance

- Workflows must have explicit triggers and descriptive names.
- Workflow and job permissions must be explicitly declared with least privilege.
- Shared-environment workflows must use `concurrency` to prevent overlapping runs.
- Duplicate workflow logic should be extracted into reusable workflows.

## Security Requirements

- Prefer OIDC over long-lived credentials.
- Secrets must come from approved secret stores; never hardcode sensitive values.
- Pin third-party actions to stable versions (prefer immutable SHAs when feasible).
- CI must include dependency and static security scanning for protected branches.

## Quality Gates

- Restore, build, lint, and tests must pass before deployment stages run.
- Release workflows must fail fast on security and quality gate failures.
- .NET workflows must validate the supported SDK/runtime matrix when applicable.

## Artifact and Reliability Rules

- Use deterministic caching keyed by lockfiles or equivalent dependency manifests.
- Pass build outputs across jobs with artifacts instead of rebuilding.
- Production deployments must use environment protections and explicit approvals.
- Deployment workflows must include rollback and post-deployment health validation gates.

## .NET-Specific Guidance

### SDK Setup

- Always use `actions/setup-dotnet@v4`; do not rely on runner-preinstalled SDK versions.
- Use a semantic version range (`dotnet-version: '8.x'`) for flexibility or an exact version for strict pinning.
- For multi-TFM validation use a matrix strategy; update the version list on each new LTS release.

Template: [dotnet-sdk-matrix.yml](./references/templates/dotnet-sdk-matrix.yml)

### NuGet Caching

- Enable caching via the `cache: true` input on `setup-dotnet`.
- Pin `cache-dependency-path` to `packages.lock.json` for deterministic cache keying.
- Requires `<RestorePackagesWithLockFile>true</RestorePackagesWithLockFile>` in the project file; without it, the lock file is absent and caching falls back to non-deterministic behaviour.

Template: [dotnet-nuget-caching.yml](./references/templates/dotnet-nuget-caching.yml)

### Build and Test Sequence

Use this canonical step order — each step skips redundant operations via `--no-restore` / `--no-build`. Always pass `--logger trx` to produce machine-readable results.

Template: [dotnet-build-test.yml](./references/templates/dotnet-build-test.yml)

### Test Result Artifacts

Upload TRX results with `if: always()` so failures are visible even when the test step fails. When running a version matrix, include `matrix.dotnet-version` in the artifact name to prevent collisions.

Template: [dotnet-test-artifacts.yml](./references/templates/dotnet-test-artifacts.yml)

### Publishing to GitHub Packages

Set `source-url` on `setup-dotnet` and grant the deploy job `packages: write`. Use `GITHUB_TOKEN` as `NUGET_AUTH_TOKEN`; substitute a PAT only when cross-repo push is required and scope it to the minimum permissions. Pack to an explicit output directory (`--output ./artifacts`) to avoid glob ambiguity in the push command.

Template: [dotnet-github-packages.yml](./references/templates/dotnet-github-packages.yml)

## Advanced Concurrency Control

- Scope every concurrency group to `github.workflow` + `github.ref` so cancellations never bleed into other workflows in the same repository.
- For CI, set `cancel-in-progress: ${{ !contains(github.ref, 'release/') }}` to cancel stale runs on feature branches while preserving in-flight release builds.
- For multi-event workflows where `github.head_ref` may be undefined, use `github.head_ref || github.run_id` as the fallback to avoid YAML evaluation errors.
- Deployment jobs must use `cancel-in-progress: false`; a partially applied deployment is harder to recover from than a queued one.
- Concurrency group names are case-insensitive; `prod` and `Prod` collide.

Template: [concurrency-patterns.yml](./references/templates/concurrency-patterns.yml)

## Reusable Workflow Composition

- Declare `on: workflow_call` with typed `inputs` (string, boolean, number) and explicit `secrets`; document each with a `description`.
- Map step outputs → job outputs → `on.workflow_call.outputs` so callers can consume results without downloading artifacts.
- Use `secrets: inherit` only within the same org/enterprise; pass named secrets explicitly for cross-org calls.
- Pin called workflows by commit SHA in caller `uses:` references; branch refs are mutable and create non-deterministic behaviour.
- Nesting cap is 10 levels. Permissions can only be maintained or reduced through the chain — a callee cannot elevate above its caller.
- Environment secrets are resolved inside the callee at job level; they cannot be injected through `on.workflow_call`.

Template: [dotnet-ci-reusable.yml](./references/templates/dotnet-ci-reusable.yml)

## OIDC Security Hardening

- Add `id-token: write` permission to any job that requests an OIDC token; without it the token request is denied.
- Scope cloud trust conditions to `repo:<org>/<repo>:environment:<name>` subjects; `environment`-scoped subjects are the most restrictive default and force use of environment protection rules.
- Never write long-lived cloud credentials as secrets when the cloud provider supports OIDC (AWS, Azure, GCP, HashiCorp Vault).
- OIDC tokens are job-scoped and auto-expire at job completion; no rotation schedule is required.
- Organisation custom properties can be embedded as `repo_property_*` claims (configured at org level, not workflow level) to support attribute-based access control in cloud trust policies.
- Dependabot update jobs support OIDC for AWS CodeArtifact, Azure DevOps Artifacts, and JFrog Artifactory private NuGet feeds — prefer this over storing registry credentials.

Ref: [OpenID Connect](https://docs.github.com/en/actions/concepts/security/openid-connect)

## Trigger Conditions

Use this skill when one or more are true:

- Creating or updating `.github/workflows/*.yml`.
- Adding CI quality gates or release stages.
- Hardening workflow security posture.

## Inputs

- Target workflow file(s) and delivery intent (CI, CD, release, maintenance).
- Environment and approval requirements.
- Security and compliance constraints.

## Required Outputs

- Workflow YAML changes aligned to governance, security, and reliability rules.
- Summary of permissions, gates, and deployment protections applied.
- Explicit notes for any justified exception.

## Workflow

1. Classify workflow intent and risk level.
2. Set triggers, permissions, and concurrency controls.
3. Add quality and security gates before deployment stages.
4. Configure caching/artifacts and deployment safety controls.
5. Validate deterministic behavior and summarize controls.

## Sources

| Source | Topic | Last Evaluated |
|---|---|---|
| [Writing workflows](https://docs.github.com/en/actions/how-tos/write-workflows) | Workflow authoring patterns, templates, triggers, runner selection | 2026-04-12 |
| [Building and testing .NET](https://docs.github.com/en/actions/tutorials/build-and-test-code/net) | .NET CI/CD: setup-dotnet, NuGet caching, build/test sequence, matrix, artifacts, GitHub Packages | 2026-04-12 |
| [Reuse workflows](https://docs.github.com/en/actions/sharing-automations/reusing-workflows) | workflow_call inputs/secrets/outputs, nesting limits, secret inheritance, matrix + reusable | 2026-04-12 |
| [Control workflow concurrency](https://docs.github.com/en/actions/how-tos/write-workflows/choose-when-workflows-run/control-workflow-concurrency) | Concurrency groups, cancel-in-progress patterns, branch-aware guards, fallback keys | 2026-04-12 |
| [OpenID Connect](https://docs.github.com/en/actions/concepts/security/openid-connect) | OIDC token structure, cloud trust setup, environment subjects, custom property claims, Dependabot OIDC | 2026-04-12 |

Full source catalog: [source-catalog.md](./references/source-catalog.md)
