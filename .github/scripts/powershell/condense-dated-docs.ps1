Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$workspace = (Get-Location).Path
$archiveRoot = '__DOCS_ROOT__/archive/condense'
$moved = New-Object System.Collections.Generic.List[string]
$histories = New-Object System.Collections.Generic.List[string]

function Get-Title {
	param(
		[Parameter(Mandatory = $true)]
		[string]$Path
	)

	$line = Get-Content -LiteralPath $Path -TotalCount 40 |
		Where-Object { $_ -match '^#\s+' } |
		Select-Object -First 1

	if ([string]::IsNullOrWhiteSpace($line)) {
		return '(no heading)'
	}

	return $line.TrimStart('#').Trim()
}

function Write-HistoryFile {
	param(
		[Parameter(Mandatory = $true)]
		[string]$Folder,
		[Parameter(Mandatory = $true)]
		[string[]]$Files,
		[Parameter(Mandatory = $true)]
		[string]$HistoryName,
		[Parameter(Mandatory = $true)]
		[string]$Label
	)

	if ($Files.Count -eq 0) {
		return
	}

	$historyPath = Join-Path $Folder $HistoryName
	$rows = @()
	foreach ($f in ($Files | Sort-Object)) {
		$name = [System.IO.Path]::GetFileName($f)
		$date = ($name -replace '^([0-9]{8}).*', '$1')
		$title = Get-Title -Path $f
		$rows += "| $date | $name | $title |"
	}

	$content = @(
		"# $Label",
		'',
		'Consolidated history for date-prefixed files previously kept individually.',
		'',
		'| Date | Source File | Title |',
		'|---|---|---|'
	) + $rows + @(
		'',
		"Source files archived under $archiveRoot preserving relative paths."
	)

	Set-Content -LiteralPath $historyPath -Value $content -Encoding UTF8
	$histories.Add(([System.IO.Path]::GetRelativePath($workspace, $historyPath).Replace('\\', '/'))) | Out-Null
}

function Move-ToArchive {
	param(
		[Parameter(Mandatory = $true)]
		[string[]]$Files
	)

	foreach ($f in $Files) {
		$rel = [System.IO.Path]::GetRelativePath($workspace, $f).Replace('\\', '/')
		$dest = Join-Path $archiveRoot $rel
		New-Item -ItemType Directory -Force -Path (Split-Path $dest -Parent) | Out-Null
		Move-Item -LiteralPath $f -Destination $dest -Force
		$moved.Add($rel) | Out-Null
	}
}

$skillRoot = '__DOCS_ROOT__/changes/skill/reviews'
if (Test-Path -LiteralPath $skillRoot) {
	$dirs = Get-ChildItem -Path $skillRoot -Directory
	foreach ($d in $dirs) {
		$files = Get-ChildItem -Path $d.FullName -File -Filter '*.md' |
			Where-Object { $_.Name -match '^\d{8}.*\.md$' } |
			Select-Object -ExpandProperty FullName

		if (@($files).Count -gt 1) {
			Write-HistoryFile -Folder $d.FullName -Files $files -HistoryName 'history.md' -Label ($d.Name + ' Review History')
			Move-ToArchive -Files $files
		}
	}

	$rootFiles = Get-ChildItem -Path $skillRoot -File -Filter '*.md' |
		Where-Object { $_.Name -match '^\d{8}.*\.md$' } |
		Select-Object -ExpandProperty FullName

	if (@($rootFiles).Count -gt 1) {
		Write-HistoryFile -Folder $skillRoot -Files $rootFiles -HistoryName 'full-skill-review-history.md' -Label 'Full Skill Review Grid History'
		Move-ToArchive -Files $rootFiles
	}
}

$custRoot = '__DOCS_ROOT__/changes/customization/reviews'
if (Test-Path -LiteralPath $custRoot) {
	$dirs = Get-ChildItem -Path $custRoot -Directory | Where-Object { $_.Name -ne 'conflicts' }
	foreach ($d in $dirs) {
		$files = Get-ChildItem -Path $d.FullName -File -Filter '*.md' |
			Where-Object { $_.Name -match '^\d{8}.*\.md$' } |
			Select-Object -ExpandProperty FullName

		if (@($files).Count -gt 1) {
			Write-HistoryFile -Folder $d.FullName -Files $files -HistoryName 'history.md' -Label ($d.Name + ' Review History')
			Move-ToArchive -Files $files
		}
	}

	$rootFiles = Get-ChildItem -Path $custRoot -File -Filter '*.md' |
		Where-Object { $_.Name -match '^\d{8}.*\.md$' } |
		Select-Object -ExpandProperty FullName

	if (@($rootFiles).Count -gt 1) {
		Write-HistoryFile -Folder $custRoot -Files $rootFiles -HistoryName 'audit-history.md' -Label 'Customization Review Audit History'
		Move-ToArchive -Files $rootFiles
	}
}

"MOVED_COUNT=$($moved.Count)"
"HISTORY_FILES_CREATED=$($histories.Count)"
"ARCHIVE_ROOT=$archiveRoot"

