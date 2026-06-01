param(
    [Parameter(Mandatory = $true)]
    [string]$ImageTag
)

trivy image --exit-code 1 --severity HIGH,CRITICAL $ImageTag
if ($LASTEXITCODE -ne 0) {
    Write-Error "Security gate failed."
    exit $LASTEXITCODE
}

syft $ImageTag -o spdx-json=sbom.spdx.json
if ($LASTEXITCODE -ne 0) {
    Write-Error "SBOM generation failed."
    exit $LASTEXITCODE
}

Write-Host "CI gates passed for image $ImageTag"
exit 0
