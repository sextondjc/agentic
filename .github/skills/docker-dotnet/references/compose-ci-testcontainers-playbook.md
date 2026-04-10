# Compose, CI, and Testcontainers Playbook

## Compose Rules

- Use depends_on with condition: service_healthy.
- Keep secrets out of docker-compose files and source control.
- Use named volumes for stateful services.
- Commit .env.example and ignore .env.

## Compose Example

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

  db:
    image: mcr.microsoft.com/mssql/server:2022-latest
    environment:
      SA_PASSWORD: "${SA_PASSWORD}"
      ACCEPT_EULA: "Y"
```

## CI Rules

- Use BuildKit and cached build layers.
- Build on all branches, push only from protected branches.
- Tag with immutable SHA and channel tag.
- Fail pipeline on HIGH or CRITICAL image vulnerabilities.
- Never pass secrets through build args.

## CI Skeleton

```yaml
- uses: docker/setup-buildx-action@v3
- uses: docker/login-action@v3
- uses: docker/build-push-action@v6
```

## Testcontainers Rules

- Prefer real infrastructure containers for integration tests.
- Use IAsyncLifetime for lifecycle.
- Keep tests isolated unless fixture-sharing is intentional.

## Testcontainers Example

```csharp
public class OrderRepositoryTests : IAsyncLifetime
{
    private readonly MsSqlContainer db = new MsSqlBuilder().Build();

    public Task InitializeAsync() => db.StartAsync();
    public Task DisposeAsync() => db.DisposeAsync().AsTask();
}
```
