#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/helpers.sh"

mem_interpolation=(
	"\#{mem_percentage}"
	"\#{mem_icon}"
	"\#{mem_bg_color}"
	"\#{mem_fg_color}"
)
mem_commands=(
	"#($CURRENT_DIR/scripts/mem_percentage.sh)"
	"#($CURRENT_DIR/scripts/mem_icon.sh)"
	"#($CURRENT_DIR/scripts/mem_bg_color.sh)"
	"#($CURRENT_DIR/scripts/mem_fg_color.sh)"
)

set_tmux_option() {
	local option=$1
	local value=$2
	tmux set-option -gq "$option" "$value"
}

do_interpolation() {
	local all_interpolated="$1"
	for ((i=0; i<${#mem_commands[@]}; i++)); do
		all_interpolated=${all_interpolated/${mem_interpolation[$i]}/${mem_commands[$i]}}
	done
	echo "$all_interpolated"
}

update_tmux_option() {
	local option=$1
	local option_value=$(get_tmux_option "$option")
	local new_option_value=$(do_interpolation "$option_value")
	set_tmux_option "$option" "$new_option_value"
}

main() {
	update_tmux_option "status-right"
	update_tmux_option "status-left"
}
main
