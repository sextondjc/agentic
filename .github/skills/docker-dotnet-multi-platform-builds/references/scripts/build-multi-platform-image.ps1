param(
    [string]$ImageTag = 'ghcr.io/org/service:dev',
    [string]$Platforms = 'linux/amd64,linux/arm64'
)

$command = "docker buildx build --platform $Platforms --tag $ImageTag --push ."
Write-Output $command
