Assert-Command winget

Write-Info "Installing device-specific packages"

$DevicePackagesIds = @(
	"Logitech.GHUB"
	"Elgato.StreamDeck"
)

foreach ($PackageId in $DevicePackagesIds) {
	Write-Info "Installing package ID: $PackageId"
	winget install -e --id $PackageId --silent --accept-source-agreements --accept-package-agreements
}

Write-Success "Device-specific package installation completed successfully"
