show_linux_usage() {
	cat <<EOF
Usage: bash install/linux.sh [--yes]

Options:
  --yes            Back up and replace existing files without prompting.
EOF
}

confirm() {
	local message="$1"

	if [ "$ASSUME_YES" -eq 1 ]; then
		return 0
	fi

	if [ ! -t 0 ]; then
		return 1
	fi

	printf '%s [y/N] ' "$message"
	read -r answer

	case "$answer" in
		y|Y|yes|YES)
			return 0
			;;
		*)
			return 1
			;;
	esac
}

ensure_linux() {
	if [ "$(uname -s)" != "Linux" ]; then
		write_fail "This installer is intended to run on Linux."
	fi
}
