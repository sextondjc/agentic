param(
    [string]$Configuration = "Release"
)

dotnet test --configuration $Configuration --verbosity minimal
if ($LASTEXITCODE -ne 0) {
    Write-Error "Testcontainers integration test run failed."
    exit $LASTEXITCODE
}

Write-Host "Testcontainers integration tests passed."
exit 0
