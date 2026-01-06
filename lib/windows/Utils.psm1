function Add-Symlink {
	param (
		[string]$Target,
		[string]$Link
	)

	if (-not (Test-Path $Target)) {
		New-Item $Target -ItemType SymbolicLink -Value $Link
		Write-Success "Created symlink: $Target -> $Link"
		return
	}

	if ((Get-FileHash $target).Hash -eq (Get-FileHash $link).Hash) {
		Write-Info "Symlink exists at: $target. Skipping."
		return
	}

	$question = "Do you want to create a symlink at: $($target)? THIS WILL OVERWRITE THE EXISTING FILE!"

	if (-not(Confirm "[Symlink] -", $question)) {
		Write-Warn "Skipping."
		return
	}

	New-Item $target -ItemType SymbolicLink -Value $link -Force
	Write-Success "Created symlink at: $target."
}


Export-ModuleMember -Function *
