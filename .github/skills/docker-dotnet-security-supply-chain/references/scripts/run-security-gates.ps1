param(
    [Parameter(Mandatory = $true)]
    [string]$ImageTag,
    [string]$ReportFolder = ".artifacts/security"
)

New-Item -ItemType Directory -Path $ReportFolder -Force | Out-Null

$trivyTable = Join-Path $ReportFolder "trivy-table.txt"
$trivyJson = Join-Path $ReportFolder "trivy.json"
$sbomFile = Join-Path $ReportFolder "sbom.spdx.json"

trivy image --format table -o $trivyTable $ImageTag
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

trivy image --format json -o $trivyJson $ImageTag
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

syft $ImageTag -o spdx-json=$sbomFile
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host "Security gates completed. Reports in $ReportFolder"
exit 0
