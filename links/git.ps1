Write-Info "Adding symlink for Git configuration files"
Add-Symlink "$($env:USERPROFILE)\.gitconfig" "$($CONFIG)\git\.gitconfig"
# git config --global core.excludesfile $env:USERPROFILE\.gitignore_global
Add-Symlink "$($env:USERPROFILE)\.gitignore_global" "$($CONFIG)\git\.gitignore_global"
Write-Success "Git configuration symlink added successfully"
