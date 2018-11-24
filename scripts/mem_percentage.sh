#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

print_mem_percentage() {
	free -m|grep Mem| awk -F' ' '{printf("%.1f%%",($2-$7)/$2*100)}'
}

main() {
	print_mem_percentage
}
main
