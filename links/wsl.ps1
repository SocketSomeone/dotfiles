Write-Info "Creating symlinks for WSL configuration files"
Add-Symlink "$($env:USERPROFILE)\.wslconfig" "$($CONFIG)\wsl\.wslconfig"
Write-Success "WSL configuration symlink created successfully"
