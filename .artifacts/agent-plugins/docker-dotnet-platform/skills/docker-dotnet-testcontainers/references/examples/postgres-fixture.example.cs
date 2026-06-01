using DotNet.Testcontainers.Builders;
using DotNet.Testcontainers.Containers;

public sealed class PostgresFixture : IAsyncLifetime
{
    private readonly IContainer _container;

    public string ConnectionString => "Host=localhost;Port=5432;Database=testdb;Username=test;Password=test";

    public PostgresFixture()
    {
        _container = new ContainerBuilder()
            .WithImage("postgres:16")
            .WithEnvironment("POSTGRES_USER", "test")
            .WithEnvironment("POSTGRES_PASSWORD", "test")
            .WithEnvironment("POSTGRES_DB", "testdb")
            .WithPortBinding(5432, true)
            .WithWaitStrategy(Wait.ForUnixContainer().UntilPortIsAvailable(5432))
            .Build();
    }

    public async Task InitializeAsync()
    {
        await _container.StartAsync();
    }

    public async Task DisposeAsync()
    {
        await _container.DisposeAsync();
    }
}
