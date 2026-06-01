# Source Catalog

| ID | Source | Type | URL | Last Evaluated (YYYY-MM-DD) | Usage |
|---|---|---|---|---|---|
| SRC-001 | Docker Documentation | Vendor Docs | https://docs.docker.com/ | 2026-06-01 | Canonical Docker behavior and command semantics |
| SRC-002 | Compose Specification | Standard | https://compose-spec.io/ | 2026-06-01 | Normative compose model and portability rules |
| SRC-003 | Dockerfile Reference | Vendor Docs | https://docs.docker.com/reference/dockerfile/ | 2026-06-01 | Dockerfile instruction behavior |
| SRC-004 | BuildKit Documentation | Vendor Docs | https://docs.docker.com/build/buildkit/ | 2026-06-01 | Build optimization and cache strategy |
| SRC-005 | OCI Image Spec | Standard | https://github.com/opencontainers/image-spec | 2026-06-01 | Image format interoperability baseline |
| SRC-006 | OCI Distribution Spec | Standard | https://github.com/opencontainers/distribution-spec | 2026-06-01 | Registry/distribution model baseline |
| SRC-007 | .NET Testcontainers Docs | Vendor Docs | https://dotnet.testcontainers.org/ | 2026-06-01 | Containerized integration testing in .NET |
| SRC-008 | Trivy Docs | Vendor Docs | https://trivy.dev/latest/ | 2026-06-01 | Security scanning gate support |

## Freshness Policy

- Re-evaluate active sources every 30 days.
- If a source materially changes behavior, update templates and workflow rules in the same change set.
