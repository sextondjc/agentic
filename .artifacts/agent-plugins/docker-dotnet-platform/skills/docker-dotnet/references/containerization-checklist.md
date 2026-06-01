# Containerization Pre-Flight Checklist

Use this checklist before treating a Docker image as production-ready.
Work top-to-bottom. All MUST items must pass before shipping.

---

## 1. Dockerfile Structure

| # | Check | Type | Done |
|---|---|---|---|
| 1.1 | Multi-stage build used — SDK is NOT present in the final image | MUST | [ ] |
| 1.2 | Final stage base image uses `aspnet`, `runtime`, or `runtime-deps` (not `sdk`) | MUST | [ ] |
| 1.3 | Base image version is pinned (no `latest` tag) | MUST | [ ] |
| 1.4 | `-alpine` or `-bookworm-slim` variant used (not the full Debian image) unless a known incompatibility prevents it | SHOULD | [ ] |
| 1.5 | Project files are copied and `dotnet restore` runs before source code is copied (layer cache order) | MUST | [ ] |
| 1.6 | `.dockerignore` is present in the build context root | MUST | [ ] |
| 1.7 | `WORKDIR` is set explicitly in both build and runtime stages | SHOULD | [ ] |

---

## 2. Security

| # | Check | Type | Done |
|---|---|---|---|
| 2.1 | Container process runs as a non-root user (`USER appuser`) | MUST | [ ] |
| 2.2 | No secrets or credentials in `ENV`, `ARG`, `COPY`, or any image layer | MUST | [ ] |
| 2.3 | `appsettings.Production.json`, `.env`, and `secrets.json` are excluded via `.dockerignore` | MUST | [ ] |
| 2.4 | No build tools, debuggers, or package managers installed in the runtime stage | SHOULD | [ ] |
| 2.5 | Package manager caches cleaned in the same `RUN` layer they are created (`--no-cache` / `rm -rf /var/cache`) | SHOULD | [ ] |
| 2.6 | Image scanned with `docker scout cves` or Trivy — no HIGH/CRITICAL CVEs unaddressed | MUST | [ ] |

---

## 3. ASP.NET Core / Runtime Config

| # | Check | Type | Done |
|---|---|---|---|
| 3.1 | `ASPNETCORE_ENVIRONMENT` set explicitly (not relying on default) | MUST | [ ] |
| 3.2 | `ASPNETCORE_URLS` set to `http://+:8080` (non-privileged port) | SHOULD | [ ] |
| 3.3 | `EXPOSE` matches the configured port | SHOULD | [ ] |
| 3.4 | `HEALTHCHECK` declared in Dockerfile | SHOULD | [ ] |
| 3.5 | `/health` endpoint mapped in ASP.NET Core middleware | SHOULD | [ ] |

---

## 4. Docker Compose (if applicable)

| # | Check | Type | Done |
|---|---|---|---|
| 4.1 | `depends_on` uses `condition: service_healthy` — not bare `depends_on` | MUST | [ ] |
| 4.2 | Each service that uses `depends_on` has a `healthcheck` defined | MUST | [ ] |
| 4.3 | No plaintext passwords in `docker-compose.yml` — values sourced from `.env` | MUST | [ ] |
| 4.4 | `.env.example` is committed; `.env` is in `.gitignore` | MUST | [ ] |
| 4.5 | Stateful services use named volumes (not anonymous or bind-mounted data) | SHOULD | [ ] |

---

## 5. CI/CD Pipeline

| # | Check | Type | Done |
|---|---|---|---|
| 5.1 | BuildKit enabled (`docker/setup-buildx-action`) | SHOULD | [ ] |
| 5.2 | GitHub Actions layer cache configured (`type=gha`) | SHOULD | [ ] |
| 5.3 | Image tagged with both a stable label and the commit SHA | SHOULD | [ ] |
| 5.4 | Image push gated to protected branch only | MUST | [ ] |
| 5.5 | CVE scan runs as a CI gate before push to production registry | MUST | [ ] |
| 5.6 | No secrets passed via `--build-arg` | MUST | [ ] |

---

## 6. Testcontainers (if integration tests use containers)

| # | Check | Type | Done |
|---|---|---|---|
| 6.1 | Container lifecycle managed via `IAsyncLifetime` | MUST | [ ] |
| 6.2 | Container not shared across test classes without deliberate `IClassFixture<>` | SHOULD | [ ] |
| 6.3 | Correct Testcontainers module NuGet package referenced (e.g., `Testcontainers.MsSql`) | MUST | [ ] |

---

## Sign-off

| Reviewer | Date | Outcome |
|---|---|---|
| | | Pass / Fail / Pass With Exceptions |
