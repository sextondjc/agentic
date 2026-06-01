param(
    [string]$ComposeFile = "compose.yaml"
)

if (-not (Test-Path -LiteralPath $ComposeFile)) {
    throw "Compose file not found: $ComposeFile"
}

docker compose -f $ComposeFile up -d --build
if ($LASTEXITCODE -ne 0) {
    Write-Error "Compose startup failed."
    exit $LASTEXITCODE
}

docker compose -f $ComposeFile ps

# Tear down after smoke check
$downExit = 0
docker compose -f $ComposeFile down
if ($LASTEXITCODE -ne 0) {
    $downExit = $LASTEXITCODE
}

if ($downExit -ne 0) {
    Write-Error "Compose teardown failed with exit code $downExit."
    exit $downExit
}

Write-Host "Compose smoke check completed successfully."
exit 0
