Assert-Command winget

Write-Info "Installing gaming packages"

$GamingPackagesIds = @(
	"Valve.Steam"
	"Discord.Discord"
)

foreach ($PackageId in $GamingPackagesIds) {
	Write-Info "Installing package ID: $PackageId"
	winget install -e --id $PackageId --silent --accept-source-agreements --accept-package-agreements
}

Write-Success "Gaming package installation completed successfully"
