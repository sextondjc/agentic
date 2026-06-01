param(
    [Parameter(Mandatory = $true)]
    [string]$DockerfilePath
)

if (-not (Test-Path -LiteralPath $DockerfilePath)) {
    throw "Dockerfile not found: $DockerfilePath"
}

$content = Get-Content -LiteralPath $DockerfilePath -Raw

$checks = @(
    @{ Name = "Multi-stage build"; Pattern = "FROM\s+.+\s+AS\s+build" },
    @{ Name = "Runtime stage"; Pattern = "FROM\s+mcr\.microsoft\.com/dotnet/aspnet" },
    @{ Name = "Non-root user"; Pattern = "USER\s+" },
    @{ Name = "Entrypoint"; Pattern = "ENTRYPOINT\s+\[" }
)

$failed = @()
foreach ($check in $checks) {
    if ($content -notmatch $check.Pattern) {
        $failed += $check.Name
    }
}

if ($failed.Count -gt 0) {
    Write-Error ("Baseline validation failed: " + ($failed -join ", "))
    exit 1
}

Write-Host "Docker baseline validation passed."
exit 0
