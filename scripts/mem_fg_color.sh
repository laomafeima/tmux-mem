#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

mem_low_fg_color=""
mem_medium_fg_color=""
mem_high_fg_color=""

mem_low_default_fg_color="#[fg=green]"
mem_medium_default_fg_color="#[fg=yellow]"
mem_high_default_fg_color="#[fg=red]"

get_fg_color_settings() {
	mem_low_fg_color=$(get_tmux_option "@mem_low_fg_color" "$mem_low_default_fg_color")
	mem_medium_fg_color=$(get_tmux_option "@mem_medium_fg_color" "$mem_medium_default_fg_color")
	mem_high_fg_color=$(get_tmux_option "@mem_high_fg_color" "$mem_high_default_fg_color")
}

print_fg_color() {
	local mem_percentage=$($CURRENT_DIR/mem_percentage.sh | sed -e 's/%//')
	local mem_load_status=$(mem_load_status $mem_percentage)
	if [ $mem_load_status == "low" ]; then
		echo "$mem_low_fg_color"
	elif [ $mem_load_status == "medium" ]; then
		echo "$mem_medium_fg_color"
	elif [ $mem_load_status == "high" ]; then
		echo "$mem_high_fg_color"
	fi
}

main() {
	get_fg_color_settings
	print_fg_color
}
main
