function Assert-Command {
  param([string]$Name)

  if (-not (Get-Command $Name -ErrorAction SilentlyContinue)) {
    Write-Fail "Required command not found: $Name"
  }
}

function Confirm {
	param(
		[string]$Title,
		[string]$Message
	)

	$choices = "&Yes", "&No"
	$result = $Host.UI.PromptForChoice($Title, $Message, $choices, 1)
	
	return $result -eq 0
}

Export-ModuleMember -Function *

