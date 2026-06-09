$Script:DOTFILES = Split-Path $PSScriptRoot -Parent
$Script:ROOT = Split-Path $Script:DOTFILES -Parent

$Script:CONFIG = Join-Path $Script:ROOT "config"
$Script:PACKAGES = Join-Path $Script:ROOT "packages"
$Script:OS = Join-Path $Script:ROOT "os/windows"
$Script:SETUP = Join-Path $Script:ROOT "setup"
$Script:TILDE = Join-Path $Script:ROOT "tilde"


Export-ModuleMember -Variable *
