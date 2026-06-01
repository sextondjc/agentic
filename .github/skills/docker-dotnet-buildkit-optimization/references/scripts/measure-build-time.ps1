param(
    [Parameter(Mandatory = $true)]
    [string]$DockerfilePath,
    [string]$Tag = "buildkit-measure:latest"
)

if (-not (Test-Path -LiteralPath $DockerfilePath)) {
    throw "Dockerfile not found: $DockerfilePath"
}

$start = Get-Date
$process = Start-Process -FilePath "docker" -ArgumentList @("build", "-f", $DockerfilePath, "-t", $Tag, ".") -NoNewWindow -PassThru -Wait
$end = Get-Date

$duration = ($end - $start).TotalSeconds

if ($process.ExitCode -ne 0) {
    Write-Error "Docker build failed with exit code $($process.ExitCode)."
    exit $process.ExitCode
}

Write-Host ("Build completed in " + [Math]::Round($duration, 2) + " seconds.")
exit 0
