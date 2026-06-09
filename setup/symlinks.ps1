# TILDE #
################################
$SHOULD_BE_LINKED = @(
	"$($TILDE)\.wslconfig",
	"$($TILDE)\.gitconfig",
	"$($TILDE)\.gitattributes",
	"$($TILDE)\.gitignore",
	"$($TILDE)\.gitmessage"
)

Write-Info "Adding symlink for Git configuration files"
foreach ($File in $SHOULD_BE_LINKED) {
	Add-Symlink "$($env:USERPROFILE)$($File.Substring($TILDE.Length))" "$File"
}
Write-Success "Git configuration symlink added successfully"

# GoXLR #
################################
$DIR = Join-Path $env:USERPROFILE "Documents\GoXLR"
$Profiles = Join-Path $DIR "Profiles"
$MicProfiles = Join-Path $DIR "MicProfiles"

New-Item -ItemType Directory -Path $DIR -Force | Out-Null
New-Item -ItemType Directory -Path $Profiles -Force | Out-Null
New-Item -ItemType Directory -Path $MicProfiles -Force | Out-Null

Write-Info "Adding symlink for GoXLR configuration files"

Add-Symlink "$Profiles\Default.goxlr" "$ROOT\goxlr\Default.goxlr"
Add-Symlink "$MicProfiles\My mic.goxlrMicProfile" "$ROOT\goxlr\My mic.goxlrMicProfile"

Write-Success "GoXLR configuration symlinks added successfully"

# PWSH #
################################
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
Add-Symlink $PROFILE "$($ROOT)\pwsh\Microsoft.PowerShell_profile.ps1"
Write-Success "PowerShell module installation completed successfully"


Write-Info "Installing PowerShell fonts"
oh-my-posh font install JetBrainsMono
Write-Success "PowerShell fonts installed successfully"

# Windows Terminal #
################################
Write-Info "Creating symlinks for Windows Terminal configuration files"
Add-Symlink "$($env:LOCALAPPDATA)\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" "$($ROOT)\windows-terminal\settings.json"
Write-Success "Windows Terminal configuration symlink created successfully"
