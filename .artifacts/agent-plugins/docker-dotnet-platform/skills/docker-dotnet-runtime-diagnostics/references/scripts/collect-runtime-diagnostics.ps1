param(
    [string]$ContainerName
)

if (-not $ContainerName) {
    Write-Output 'ContainerName is required.'
    exit 1
}

Write-Output "docker logs $ContainerName"
Write-Output "docker inspect $ContainerName"
Write-Output "docker ps --filter name=$ContainerName"
