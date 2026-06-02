Write-Info "Adding symlink for Git configuration files"
Add-Symlink "$($env:USERPROFILE)\.gitconfig" "$($CONFIG)\git\.gitconfig"
# git config --global core.excludesfile $env:USERPROFILE\.gitignore
Add-Symlink "$($env:USERPROFILE)\.gitignore" "$($CONFIG)\git\.gitignore"
Write-Success "Git configuration symlink added successfully"
