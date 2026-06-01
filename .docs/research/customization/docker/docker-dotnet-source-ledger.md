# Docker .NET Source Ledger

Use this ledger for the Docker .NET skill family execution workflow.

| ID | Source Type | Title | URL | Date Accessed (YYYY-MM-DD) | Scope Covered | Relevance Note |
|---|---|---|---|---|---|---|
| SRC-001 | Vendor Docs | Docker Documentation | https://docs.docker.com/ | 2026-06-01 | Docker runtime, build, CLI fundamentals | Canonical baseline for Docker behavior and semantics. |
| SRC-002 | Standard | Compose Specification | https://compose-spec.io/ | 2026-06-01 | Compose model and portability rules | Normative source for compose contracts. |
| SRC-003 | Vendor Docs | Dockerfile Reference | https://docs.docker.com/reference/dockerfile/ | 2026-06-01 | Dockerfile directives and usage | Canonical directive behavior for templates. |
| SRC-004 | Vendor Docs | BuildKit Documentation | https://docs.docker.com/build/buildkit/ | 2026-06-01 | Build performance, cache, advanced build features | Required for optimization guidance. |
| SRC-005 | Standard | OCI Image Specification | https://github.com/opencontainers/image-spec | 2026-06-01 | Image format and metadata standards | Interoperability baseline for image guidance. |
| SRC-006 | Standard | OCI Distribution Specification | https://github.com/opencontainers/distribution-spec | 2026-06-01 | Registry and distribution behavior | Needed for push/pull and registry semantics. |
| SRC-007 | Vendor Docs | .NET Testcontainers Documentation | https://dotnet.testcontainers.org/ | 2026-06-01 | .NET integration test containers | Canonical patterns for test automation skill content. |
| SRC-008 | Vendor Docs | Testcontainers Documentation | https://testcontainers.com/ | 2026-06-01 | Cross-language Testcontainers concepts | Corroborating concepts and patterns. |
| SRC-009 | Vendor Docs | Trivy Documentation | https://trivy.dev/latest/ | 2026-06-01 | Vulnerability and misconfiguration scanning | Security gate examples and scripts. |
| SRC-010 | Vendor Docs | Syft Documentation | https://github.com/anchore/syft | 2026-06-01 | SBOM generation workflows | Supply-chain evidence guidance. |
| SRC-011 | Vendor Docs | Grype Documentation | https://github.com/anchore/grype | 2026-06-01 | Vulnerability matching against SBOM/images | Security review gate support. |
| SRC-012 | Standard | SLSA | https://slsa.dev/ | 2026-06-01 | Provenance and software supply-chain levels | Provenance expectations and maturity controls. |
| SRC-013 | Vendor Docs | Kubernetes Containers Concept | https://kubernetes.io/docs/concepts/containers/ | 2026-06-01 | Runtime context boundaries for container behavior | Boundary alignment without expanding into cluster architecture. |
| SRC-014 | Vendor Docs | Azure Container Registry Documentation | https://learn.microsoft.com/azure/container-registry/ | 2026-06-01 | Registry operations in Microsoft ecosystem | .NET enterprise deployment relevance. |
| SRC-015 | Security Guidance | OWASP Docker Security Cheat Sheet | https://cheatsheetseries.owasp.org/cheatsheets/Docker_Security_Cheat_Sheet.html | 2026-06-01 | Container hardening controls | Security defaults and anti-pattern checks. |

## Coverage Check

- Topic branches with at least one source:
  - Docker and OCI foundations
  - Dockerfile and BuildKit optimization
  - Compose workflows
  - Security and supply chain
  - .NET integration testing with containers
  - Registry and release governance
- Branches requiring additional sources:
  - Cosign and image signing source depth (future expansion)
  - Distroless and AOT niche optimization references (future expansion)
- Sources rejected and why:
  - Community blog summaries rejected for normative rules because official sources exist.

## Source Tier Policy

- Tier 1: Official specs and vendor documentation define normative guidance.
- Tier 2: Tool vendor docs provide implementation mechanics.
- Tier 3: Repository samples are corroboration only after Tier 1 alignment.
