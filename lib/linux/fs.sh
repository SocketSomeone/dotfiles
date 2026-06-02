install_or_update_block() {
	local file="$1"
	local marker_start="$2"
	local marker_end="$3"
	local block="$4"
	local tmp

	touch "$file"

	if grep -Fq "$marker_start" "$file"; then
		tmp="$(mktemp)"
		awk -v start="$marker_start" -v end="$marker_end" -v block="$block" '
			$0 == start {
				print block
				in_block = 1
				next
			}
			$0 == end {
				in_block = 0
				next
			}
			!in_block {
				print
			}
		' "$file" > "$tmp"
		mv "$tmp" "$file"
	else
		{
			printf '\n'
			printf '%s\n' "$block"
		} >> "$file"
	fi
}

find_shell_scripts() {
	local directory="$1"

	[ -d "$directory" ] || return 0

	find "$directory" -type f -name '*.sh' | sort
}

invoke_shell_script() {
	local script_path="$1"

	write_info "Executing shell script: $script_path"
	. "$script_path"
}

invoke_shell_scripts() {
	local scripts="$1"
	local script_path

	[ -n "$scripts" ] || return 0

	while IFS= read -r script_path; do
		[ -n "$script_path" ] || continue
		invoke_shell_script "$script_path"
	done <<EOF
$scripts
EOF
}
