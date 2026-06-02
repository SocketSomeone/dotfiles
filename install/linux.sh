#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LIB="$ROOT/lib/linux"

source "$LIB/constants.sh"
source "$LIB/log.sh"
source "$LIB/core.sh"
source "$LIB/fs.sh"
source "$LIB/stow.sh"

ASSUME_YES=0

while [ "$#" -gt 0 ]; do
	case "$1" in
		-y|--yes)
			ASSUME_YES=1
			;;
		-h|--help)
			show_linux_usage
			exit 0
			;;
		*)
			printf 'Unknown option: %s\n\n' "$1" >&2
			show_linux_usage >&2
			exit 1
			;;
	esac
	shift
done

ensure_linux

write_info "Starting Linux setup"

write_info "Installing Linux packages"
package_scripts="$(find_shell_scripts "$DOTFILES_LINUX_PACKAGES")"
invoke_shell_scripts "$package_scripts"

write_info "Creating symlinks for Linux configuration files"
link_scripts="$(find_shell_scripts "$DOTFILES_LINUX_LINKS")"
invoke_shell_scripts "$link_scripts"

write_info "Applying Linux specific configurations"
os_scripts="$(find_shell_scripts "$DOTFILES_LINUX_OS")"
invoke_shell_scripts "$os_scripts"

write_info "Linux setup completed successfully"
