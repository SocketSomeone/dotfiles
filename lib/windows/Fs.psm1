function Find-PowershellScripts {
	param (
		[string]$Directory
	)

	Write-Debug "Searching for PowerShell files in directory: $Directory"

	return Get-ChildItem -Path $Directory -Recurse -Filter *.ps1
}

function Invoke-PowershellScript {
	param (
		[string]$ScriptPath
	)

	Write-Debug "Executing PowerShell script: $ScriptPath"

	& $ScriptPath
}

function New-TemporaryFolder {
	$tempPath = [System.IO.Path]::GetTempPath()
	$folderName = [System.IO.Path]::GetRandomFileName()
	$fullPath = Join-Path -Path $tempPath -ChildPath $folderName
	New-Item -ItemType Directory -Path $fullPath | Out-Null
	return $fullPath
}

export-ModuleMember -Function *
