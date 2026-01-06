Write-Info "Creating symlinks for WSL configuration files"
New-Item -ItemType Directory -Path "$($env:USERPROFILE)\Documents\ShareX" -Force | Out-Null
Add-Symlink "$($env:USERPROFILE)\Documents\ShareX\ApplicationConfig.json" "$($CONFIG)\ShareX\ApplicationConfig.json"
Add-Symlink "$($env:USERPROFILE)\Documents\ShareX\HotKeysConfig.json" "$($CONFIG)\ShareX\HotKeysConfig.json"
Write-Success "ShareX configuration symlinks created successfully"
