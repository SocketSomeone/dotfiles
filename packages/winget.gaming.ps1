Assert-Command winget

Write-Info "Installing gaming packages"

$DevicePackagesIds = @(
	"Valve.Steam"
	"Discord.Discord"
)

foreach ($PackageId in $DevicePackagesIds) {
	Write-Info "Installing package ID: $PackageId"
	winget install --id $PackageId --silent --accept-source-agreements --accept-package-agreements
}

Write-Success "Gaming package installation completed successfully"
