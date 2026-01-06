Write-Info "Creating symlinks for WSL configuration files"
Add-Symlink "$($env:USERPROFILE)\.wslconfig" "$($CONFIG)\wsl\.wslconfig"
