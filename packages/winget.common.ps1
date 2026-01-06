Assert-Command winget

Write-Info "Installing common packages"

$CommonPackagesNames = @(
	"Raycast"
)

$CommonPackagesIds = @(
	"Yandex.Browser"
	"Microsoft.VisualStudioCode"
	"Git.Git"
	"hoppscotch.Hoppscotch"
	"Sharex"
	"Docker.DockerDesktop"
	"GitHub.cli"
	"Figma.Figma"
	"CoreyButler.NVMforWindows"
	"OpenJS.NodeJS.LTS"
	"GoLang.Go"
	"Netbird.Netbird"
	"qBittorrent.qBittorrent"

	"JetBrains.Toolbox"

	"JanDeDobbeleer.OhMyPosh"
	"Microsoft.WindowsTerminal"
	"Microsoft.PowerShell"

	"AgileBits.1Password"
	"AgileBits.1Password.CLI"

	"Telegram.TelegramDesktop"
)

foreach ($Package in $CommonPackagesNames) {
	Write-Info "Installing package: $Package"
	winget install -e --name $Package --silent --accept-source-agreements --accept-package-agreements
}

foreach ($PackageId in $CommonPackagesIds) {
	Write-Info "Installing package ID: $PackageId"
	winget install -e --id $PackageId --silent --accept-source-agreements --accept-package-agreements
}

Write-Success "Common package installation completed successfully"
