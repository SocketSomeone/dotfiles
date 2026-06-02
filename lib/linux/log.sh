write_info() {
	printf '==> %s\n' "$1"
}

write_warn() {
	printf 'WARN: %s\n' "$1" >&2
}

write_fail() {
	printf 'ERROR: %s\n' "$1" >&2
	exit 1
}
