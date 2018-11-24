get_tmux_option() {
	local option="$1"
	local default_value="$2"
	local option_value="$(tmux show-option -gqv "$option")"
	if [ -z "$option_value" ]; then
		echo "$default_value"
	else
		echo "$option_value"
	fi
}

# is second float bigger?
fcomp() {
	awk -v n1=$1 -v n2=$2 'BEGIN {if (n1<n2) exit 0; exit 1}'
}

mem_load_status() {
	local percentage=$1
	if fcomp 80 $percentage; then
		echo "high"
	elif fcomp 30 $percentage && fcomp $percentage 80; then 
		echo "medium"
	else
		echo "low"
	fi
}
