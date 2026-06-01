# syntax=docker/dockerfile:1.7
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY *.sln ./
COPY src/MyService.Api/*.csproj src/MyService.Api/

# Use BuildKit cache mount to accelerate restore
RUN --mount=type=cache,target=/root/.nuget/packages \
    dotnet restore src/MyService.Api/MyService.Api.csproj

COPY src/ src/
RUN dotnet publish src/MyService.Api/MyService.Api.csproj -c Release -o /app/publish --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "MyService.Api.dll"]
