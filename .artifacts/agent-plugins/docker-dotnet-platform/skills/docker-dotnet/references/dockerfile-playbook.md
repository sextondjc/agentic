# Dockerfile Playbook

## Base Images

- ASP.NET runtime: mcr.microsoft.com/dotnet/aspnet:<pinned-version>
- Worker or console runtime: mcr.microsoft.com/dotnet/runtime:<pinned-version>
- Build stage: mcr.microsoft.com/dotnet/sdk:<pinned-version>
- Self-contained or AOT runtime: mcr.microsoft.com/dotnet/runtime-deps:<pinned-version>

Never use latest for production images.

## Build Pattern

Use this standard multi-stage pattern and adapt only project paths.

```dockerfile
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY ["src/MyApp/MyApp.csproj", "src/MyApp/"]
RUN dotnet restore "src/MyApp/MyApp.csproj"

COPY . .
WORKDIR "/src/src/MyApp"
RUN dotnet publish -c Release -o /app/publish --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS runtime
WORKDIR /app
COPY --from=build /app/publish .

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

ENTRYPOINT ["dotnet", "MyApp.dll"]
```

## Caching Order

1. Copy project files and restore.
2. Copy source files.
3. Publish.

## Security Rules

- Keep runtime image minimal and free of tooling.
- Use non-root user before ENTRYPOINT.
- Do not set secrets in ENV in Dockerfile.
- Clean package manager caches in the same RUN layer.

## ASP.NET Defaults

```dockerfile
ENV ASPNETCORE_URLS=http://+:8080
ENV ASPNETCORE_ENVIRONMENT=Production
EXPOSE 8080
```

Use /health endpoint with Docker HEALTHCHECK where supported.
