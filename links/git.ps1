Write-Info "Adding symlink for Git configuration files"
Add-Symlink "$($env:USERPROFILE)\.gitconfig" "$($CONFIG)\git\.gitconfig"
Write-Success "Git configuration symlink added successfully"
