#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

print_mem_percentage() {
    ps -A -o %mem | awk '{ mem += $1 } END {printf("%.1f%%", mem)}'
}

main() {
	print_mem_percentage
}
main
