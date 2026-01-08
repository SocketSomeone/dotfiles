Assert-Command winget

Write-Info "Importing common package list"
$PackagesFilePath = Join-Path -Path $PACKAGES -ChildPath "packages.json"
Write-Debug "Packages file path: $PackagesFilePath"
winget import $PackagesFilePath --accept-source-agreements --accept-package-agreements
Write-Success "Common package installation completed successfully"
