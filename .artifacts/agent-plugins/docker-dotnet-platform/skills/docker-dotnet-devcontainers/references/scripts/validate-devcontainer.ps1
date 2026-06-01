param(
    [string]$ConfigPath = '.devcontainer/devcontainer.json'
)

if (Test-Path -LiteralPath $ConfigPath) {
    Write-Output "FOUND: $ConfigPath"
} else {
    Write-Output "MISSING: $ConfigPath"
    exit 1
}
