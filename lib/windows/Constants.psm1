$Script:DOTFILES = Split-Path $PSScriptRoot -Parent
$Script:ROOT = Split-Path $Script:DOTFILES -Parent

$Script:CONFIG = Join-Path $Script:ROOT "config"
$Script:PACKAGES = Join-Path $Script:ROOT "packages"
$Script:LINKS = Join-Path $Script:ROOT "links"


Export-ModuleMember -Variable *
