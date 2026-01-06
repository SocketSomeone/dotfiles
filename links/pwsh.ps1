$PwshModules = @(
	"posh-git"
	"PSReadLine"
	"Terminal-Icons"
	"MagicTooltips"
)

Write-Info "Installing PowerShell modules"

foreach ($Module in $PwshModules) {
	if (-not (Get-Module -ListAvailable -Name $Module)) {
		Write-Info "Installing PowerShell module: $Module"
		Install-Module -Name $Module -Scope CurrentUser -Force -AllowClobber -Verbose:$Debug.IsPresent
	} else {
		Write-Debug "PowerShell module already installed: $Module"
	}
}

Write-Success "PowerShell modules installed successfully"

Write-Info "Creating symlinks for PowerShell configuration files"
Add-Symlink "$($env:PROFILE)\Microsoft.PowerShell_profile.ps1" "$($CONFIG)\pwsh\Microsoft.PowerShell_profile.ps1"
Write-Success "PowerShell module installation completed successfully"
