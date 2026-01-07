# #Requires -RunAsAdministrator

param(
	[switch]$Debug
)

if ($Debug.IsPresent) {
	$DebugPreference = "Continue"
}

$Root = Split-Path $PSScriptRoot -Parent
$ModulesDir = Join-Path $Root "lib\windows"

$ModuleFiles = @(
	"Constants.psm1"
	"Core.psm1"
	"Fs.psm1"
	"Log.psm1"
	"Utils.psm1"
)

foreach ($Module in $ModuleFiles) {
	$Path = Join-Path $ModulesDir $Module
	Write-Debug "Importing module: $Path"
	Import-Module $Path -Force -Verbose:$Debug.IsPresent
}


Write-Info "Starting Windows setup"

Write-Info "Installing packages"
$PackageScripts = Find-PowershellScripts $PACKAGES
Write-Debug "Found $($PackageScripts.Count) $PACKAGES package scripts to execute"

foreach ($Script in $PackageScripts) {
	Write-Debug "Executing package script: $($Script.FullName)"
	Invoke-PowershellScript $Script.FullName
}

Write-Info "Creating symlinks for configuration files"
$SymlinkScripts = Find-PowershellScripts $LINKS

Write-Debug "Found $($SymlinkScripts.Count) $LINKS symlink scripts to execute"

foreach ($Script in $SymlinkScripts) {
	Write-Debug "Executing symlink script: $($Script.FullName)"
	Invoke-PowershellScript $Script.FullName
}


Write-Success "Windows setup completed successfully"
