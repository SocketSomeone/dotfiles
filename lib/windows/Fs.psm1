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

export-ModuleMember -Function *
