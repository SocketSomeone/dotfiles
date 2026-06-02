Write-Info "Adding symlink for Git configuration files"
Add-Symlink "$($env:USERPROFILE)\.gitconfig" "$($CONFIG)\git\.gitconfig"
Add-Symlink "$($env:USERPROFILE)\.gitignore" "$($CONFIG)\git\.gitignore"
Write-Success "Git configuration symlink added successfully"
