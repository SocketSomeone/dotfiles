Assert-Command winget

Write-Info "Installing common packages"

$CommonPackagesNames = @(
	"Raycast"
	"JetBrains Toolbox"
)

$CommonPackagesIds = @(
	"Yandex.Browser"
	"Microsoft.VisualStudioCode"
	"Git.Git"
	"hoppscotch.Hoppscotch"
	"7zip.7zip"
	"Docker.DockerDesktop"
	"GitHub.cli"
	"Figma.Figma"
	"CoreyButler.NVMforWindows"
	"OpenJS.NodeJS.LTS"
	"GoLang.Go"
	"Netbird.Netbird"
	"ShareX.ShareX"


	"JanDeDobbeleer.OhMyPosh"
	"Microsoft.WindowsTerminal"
	"Microsoft.PowerShell"

	"AgileBits.1Password"
	"AgileBits.1Password.CLI"

	"Telegram.TelegramDesktop"

	"Spotify.Spotify"
)

foreach ($Package in $CommonPackagesNames) {
	Write-Info "Installing package: $Package"
	winget install --name $Package --silent --accept-source-agreements --accept-package-agreements --source msstore
}

foreach ($PackageId in $CommonPackagesIds) {
	Write-Info "Installing package ID: $PackageId"
	winget install --id $PackageId --silent --accept-source-agreements --accept-package-agreements
}

Write-Success "Common package installation completed successfully"
