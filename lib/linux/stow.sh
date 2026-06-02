assert_stow() {
	if ! command -v stow >/dev/null 2>&1; then
		write_fail "Required command not found: stow"
	fi
}

stow_package() {
	local stow_dir="$1"
	local package_name="$2"
	local target="${3:-$HOME}"

	assert_stow
	write_info "Stowing package: $package_name"

	stow --dir "$stow_dir" --target "$target" --restow "$package_name"
}
