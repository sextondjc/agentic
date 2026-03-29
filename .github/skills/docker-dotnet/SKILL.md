---
name: docker-dotnet
description: Use when containerizing .NET applications, authoring or reviewing Dockerfiles and docker-compose files, optimizing image builds, or applying container security practices in .NET solutions.
---

# Docker & Containers in .NET

## Overview

Expert guidance for containerizing .NET solutions with Docker: image authoring, build optimization, security hardening, Compose orchestration, and CI/CD integration.

## When to Use

- Writing or reviewing a `Dockerfile` for a .NET project.
- Setting up or auditing `docker-compose.yml` for local dev or staging orchestration.
- Reducing image size, layer count, or build time.
- Applying container security hardening to a .NET workload.
- Integrating Docker image builds into a GitHub Actions pipeline.
- Using Testcontainers for integration testing.

## When Not to Use

- Kubernetes manifests or Helm charts — those require a dedicated skill.
- Cloud-specific container services (ACI, ECS, Cloud Run) beyond CI push targets.
- Runtime orchestration or Kubernetes scheduling decisions.

---

## Dockerfile Fundamentals

### Base Image Selection

Always use the official Microsoft-published images from `mcr.microsoft.com`.

| Purpose | Base Image |
|---|---|
| Final runtime — ASP.NET Core | `mcr.microsoft.com/dotnet/aspnet:<version>` |
| Final runtime — console/worker | `mcr.microsoft.com/dotnet/runtime:<version>` |
| Build stage | `mcr.microsoft.com/dotnet/sdk:<version>` |
| Minimal footprint | `mcr.microsoft.com/dotnet/runtime-deps:<version>` + self-contained publish |

- Pin to a specific version tag, never use `latest` in production images.
- Prefer `-alpine` variants to reduce attack surface and image size where glibc dependencies are not required.
- Prefer `-bookworm-slim` (Debian) when Alpine is incompatible with a dependency.

```dockerfile
# ✅ Good — pinned version, slim runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS runtime

# ❌ Bad — unpinned, full SDK in production
FROM mcr.microsoft.com/dotnet/sdk:latest
```

### Multi-Stage Builds

Always separate the build stage from the runtime stage. The SDK must never appear in the final image.

```dockerfile
# Stage 1 — restore and build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy project files first — enables layer caching for restore
COPY ["src/MyApp/MyApp.csproj", "src/MyApp/"]
COPY ["src/MyApp.Core/MyApp.Core.csproj", "src/MyApp.Core/"]
RUN dotnet restore "src/MyApp/MyApp.csproj"

# Copy source and publish
COPY . .
WORKDIR "/src/src/MyApp"
RUN dotnet publish -c Release -o /app/publish --no-restore

# Stage 2 — final runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS runtime
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "MyApp.dll"]
```

### Layer Caching

Layer order determines cache hit rate. Restore (slow, infrequent change) must come before source copy (fast but frequent change).

```
Rule: copy what changes LEAST first.
1. Project files (.csproj, Directory.Build.props, NuGet.config)
2. dotnet restore
3. Source code
4. dotnet publish
```

### .dockerignore

Always provide a `.dockerignore` to exclude build artifacts, secrets, and developer config from the build context.

```
.git
.github
**/.vs
**/bin
**/obj
**/*.user
**/.env
**/appsettings.Development.json
**/appsettings.Local.json
**/secrets.json
Dockerfile*
docker-compose*.yml
README.md
.docs
```

---

## Security Hardening

### Non-Root User

Never run the container process as root. Add a dedicated user in the Dockerfile.

```dockerfile
FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS runtime
WORKDIR /app
COPY --from=build /app/publish .

# Create and switch to a non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

ENTRYPOINT ["dotnet", "MyApp.dll"]
```

For **Debian-based** images use `groupadd` / `useradd`.

### No Secrets in Layers

- Never `COPY` `.env`, `appsettings.Production.json`, or any file containing credentials.
- Never set secrets in `ENV` instructions — they are visible in `docker inspect`.
- Load secrets at runtime via environment variables, Docker secrets, or a secret manager.

```dockerfile
# ❌ Bad — secret baked into image layer
ENV ConnectionStrings__Default="Server=...;Password=secret"

# ✅ Good — injected at runtime (docker run / compose / K8s secret mount)
# ENV not set here; consumer passes at runtime
```

### Minimal Surface Area

- Start from the smallest viable base (`-alpine` > `-slim` > full).
- Do not install build tools, debuggers, or shells in the runtime stage.
- Remove package manager caches in the same `RUN` layer they are created.

```dockerfile
# ✅ Install and clean in one layer
RUN apk add --no-cache icu-libs
```

### Image Scanning

- Run `docker scout cves <image>` or Trivy as a CI gate before push.
- Treat HIGH/CRITICAL CVEs in base image as a build failure.
- Rebuild images regularly to pick up base image patches.

---

## ASP.NET Core Specifics

### Port and Environment

```dockerfile
ENV ASPNETCORE_URLS=http://+:8080
ENV ASPNETCORE_ENVIRONMENT=Production
EXPOSE 8080
```

- Prefer port `8080` over `80` to avoid needing root.
- Set `ASPNETCORE_ENVIRONMENT` explicitly; do not rely on defaults.

### Health Checks

Wire up ASP.NET health check middleware and declare it in the Dockerfile.

```csharp
// Program.cs
builder.Services.AddHealthChecks();
app.MapHealthChecks("/health");
```

```dockerfile
HEALTHCHECK --interval=30s --timeout=5s --start-period=15s --retries=3 \
  CMD wget -qO- http://localhost:8080/health || exit 1
```

Use `curl` on Debian images; `wget` on Alpine.

---

## Docker Compose

### Structure

```yaml
services:
  api:
    build:
      context: .
      dockerfile: src/MyApp/Dockerfile
    image: myapp:local
    ports:
      - "8080:8080"
    environment:
      ASPNETCORE_ENVIRONMENT: Development
      ConnectionStrings__Default: "${DB_CONNECTION_STRING}"
    depends_on:
      db:
        condition: service_healthy
    healthcheck:
      test: ["CMD", "wget", "-qO-", "http://localhost:8080/health"]
      interval: 30s
      timeout: 5s
      retries: 3

  db:
    image: mcr.microsoft.com/mssql/server:2022-latest
    environment:
      SA_PASSWORD: "${SA_PASSWORD}"
      ACCEPT_EULA: "Y"
    healthcheck:
      test: ["CMD", "/opt/mssql-tools/bin/sqlcmd", "-S", "localhost", "-U", "sa", "-P", "${SA_PASSWORD}", "-Q", "SELECT 1"]
      interval: 10s
      timeout: 5s
      retries: 10
    volumes:
      - mssql-data:/var/opt/mssql

volumes:
  mssql-data:
```

### Rules

- Use `depends_on` with `condition: service_healthy` — not bare `depends_on`.
- Never hardcode passwords in `docker-compose.yml`. Use `.env` files excluded from source control.
- Define named volumes for all stateful services.
- Use a `.env.example` committed to source control; `.env` in `.gitignore`.

---

## Worker Services and Console Apps

```dockerfile
FROM mcr.microsoft.com/dotnet/runtime:8.0-alpine AS runtime
WORKDIR /app
COPY --from=build /app/publish .

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

ENTRYPOINT ["dotnet", "MyWorker.dll"]
```

- Worker services do not expose ports — omit `EXPOSE` and `ASPNETCORE_URLS`.
- Use `IHostedService` / `BackgroundService` with graceful shutdown via `CancellationToken`.

---

## Self-Contained and AOT Publishes

Use `runtime-deps` as the base for self-contained native AOT or trimmed publishes.

```dockerfile
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
RUN dotnet publish src/MyApp/MyApp.csproj \
    -c Release \
    -r linux-musl-x64 \
    --self-contained true \
    -p:PublishAot=true \
    -o /app/publish

FROM mcr.microsoft.com/dotnet/runtime-deps:8.0-alpine AS runtime
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["./MyApp"]
```

---

## Integration Testing with Testcontainers

Use [Testcontainers for .NET](https://dotnet.testcontainers.org/) to spin up real infrastructure in xUnit tests without mocking.

```csharp
// xUnit test with Testcontainers SQL Server
public class OrderRepositoryTests : IAsyncLifetime
{
    private readonly MsSqlContainer _db = new MsSqlBuilder()
        .WithImage("mcr.microsoft.com/mssql/server:2022-latest")
        .Build();

    public Task InitializeAsync() => _db.StartAsync();
    public Task DisposeAsync() => _db.DisposeAsync().AsTask();

    [Fact]
    public async Task GetById_ReturnsOrder_WhenExists()
    {
        var connectionString = _db.GetConnectionString();
        // ... seed and assert
    }
}
```

- Add `Testcontainers.MsSql` (or the relevant module) NuGet package.
- Use `IAsyncLifetime` for container lifecycle — not constructor/finalizer.
- Do not share containers between test classes unless using `IClassFixture<>` deliberately.

---

## CI/CD — GitHub Actions

```yaml
jobs:
  build-and-push:
    runs-on: ubuntu-latest
    permissions:
      contents: read
      packages: write
    steps:
      - uses: actions/checkout@v4

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3

      - name: Log in to GitHub Container Registry
        uses: docker/login-action@v3
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}

      - name: Build and push
        uses: docker/build-push-action@v6
        with:
          context: .
          file: src/MyApp/Dockerfile
          push: ${{ github.ref == 'refs/heads/main' }}
          tags: |
            ghcr.io/${{ github.repository }}/myapp:latest
            ghcr.io/${{ github.repository }}/myapp:${{ github.sha }}
          cache-from: type=gha
          cache-to: type=gha,mode=max
```

### CI Rules

- Use BuildKit and GitHub Actions cache (`type=gha`) to accelerate builds.
- Push only from protected branches; build on all branches.
- Tag with both `latest` and the commit SHA.
- Gate on `docker scout cves` or equivalent before push to production registries.
- Never pass plaintext secrets into `docker build --build-arg`.

---

## Common Mistakes

| Mistake | Fix |
|---|---|
| SDK in final image | Use multi-stage build; final stage FROM aspnet/runtime |
| `COPY . .` before restore | Copy `.csproj` files first, restore, then `COPY . .` |
| `latest` tag in production | Pin to `8.0.x` or a date-stamped digest |
| Root user at runtime | Add non-root user; `USER appuser` before `ENTRYPOINT` |
| Secrets in `ENV` | Inject at runtime; never bake secrets into layers |
| No `.dockerignore` | Add `.dockerignore`; exclude `bin/`, `obj/`, `.env`, `.git` |
| `depends_on` without health check | Use `condition: service_healthy` with a defined healthcheck |
| Large build context | Check `.dockerignore`; exclude test fixtures, docs, build output |
| `appsettings.Development.json` copied in | Exclude non-production config files from image entirely |

---

## Reference Assets

- [`.dockerignore` template](references/dockerignore-template) — copy to your repo's build context root and trim as needed.
- [Containerization pre-flight checklist](references/containerization-checklist.md) — structured MUST/SHOULD checklist covering Dockerfile, security, Compose, CI/CD, and Testcontainers.

---

## Quick Reference

```
Image hierarchy (smallest → largest):
  runtime-deps < runtime < aspnet < sdk

Publish flags:
  -c Release -o /app/publish --no-restore

Port convention:
  8080 (non-root, ASP.NET Core ASPNETCORE_URLS=http://+:8080)

Health check endpoint:
  GET /health  →  200 OK

Testcontainers package:
  Testcontainers.MsSql  (SQL Server)
  Testcontainers.Redis  (Redis)
  Testcontainers        (generic)
```
