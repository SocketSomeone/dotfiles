#Requires -RunAsAdministrator

param(
	[switch]$Debug
)

if ($Debug.IsPresent) {
	$DebugPreference = "Continue"
}

$Root = $PSScriptRoot
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

Write-Info "Installing packages [WINGET]"
Invoke-PowershellScript $SETUP\winget.ps1

Write-Info "Creating symlinks for configuration files"
Invoke-PowershellScript $SETUP\symlinks.ps1

Write-Info "Applying OS specific configurations"
Invoke-PowershellScript $SETUP\os.ps1


Write-Success "Windows setup completed successfully"
Write-Success "You may need to restart your computer for all changes to take effect."
