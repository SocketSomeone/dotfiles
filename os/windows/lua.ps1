$path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$shouldBe = 0

Set-ItemProperty -Path $path -Name EnableLUA -Type DWord -Value 0

$value = (Get-ItemProperty -Path $path -Name EnableLUA).EnableLUA

if ($value -eq $shouldBe) {
    Write-Success "LUA has been successfully disabled."
} else {
    Write-Warn "Failed to disable LUA."
}

