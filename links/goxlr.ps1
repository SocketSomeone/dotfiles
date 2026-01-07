$DIR = Join-Path $env:USERPROFILE "Documents\GoXLR"
$Profiles = Join-Path $DIR "Profiles"
$MicProfiles = Join-Path $DIR "MicProfiles"

New-Item -ItemType Directory -Path $DIR -Force | Out-Null
New-Item -ItemType Directory -Path $Profiles -Force | Out-Null
New-Item -ItemType Directory -Path $MicProfiles -Force | Out-Null

Write-Info "Adding symlink for GoXLR configuration files"

Add-Symlink "$Profiles\Default.goxlr" "$CONFIG\goxlr\Default.goxlr"
Add-Symlink "$MicProfiles\My mic.goxlrMicProfile" "$CONFIG\goxlr\My mic.goxlrMicProfile"

Write-Success "GoXLR configuration symlinks added successfully"

