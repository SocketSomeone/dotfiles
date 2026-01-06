function Write-Info {
	param([string]$Message)
	Write-Host "==> $Message" -ForegroundColor Cyan
}

function Write-Warn {
	param([string]$Message)
	Write-Host "⚠  $Message" -ForegroundColor Yellow
}

function Write-Fail {
	param([string]$Message)
	Write-Host "✖  $Message" -ForegroundColor Red
	exit 1
}

function Write-Success {
	param([string]$Message)
	Write-Host "✔  $Message" -ForegroundColor Green
}

Export-ModuleMember -Function *
