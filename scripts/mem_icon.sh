#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

# script global variables
mem_low_icon=""
mem_medium_icon=""
mem_high_icon=""

mem_low_default_icon="="
mem_medium_default_icon="≡"
mem_high_default_icon="≣"

# icons are set as script global variables
get_icon_settings() {
	mem_low_icon=$(get_tmux_option "@mem_low_icon" "$mem_low_default_icon")
	mem_medium_icon=$(get_tmux_option "@mem_medium_icon" "$mem_medium_default_icon")
	mem_high_icon=$(get_tmux_option "@mem_high_icon" "$mem_high_default_icon")
}

print_icon() {
	local mem_percentage=$($CURRENT_DIR/mem_percentage.sh | sed -e 's/%//')
	local mem_load_status=$(mem_load_status $mem_percentage)
	if [ $mem_load_status == "low" ]; then
		echo "$mem_low_icon"
	elif [ $mem_load_status == "medium" ]; then
		echo "$mem_medium_icon"
	elif [ $mem_load_status == "high" ]; then
		echo "$mem_high_icon"
	fi
}

main() {
	get_icon_settings 
	local mem_icon=$(print_icon "$1")
	echo "$mem_icon"
}
main
