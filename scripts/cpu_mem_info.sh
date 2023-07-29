#!/usr/bin/env bash

#-------------------------------- GLOBAL VARIABLES --------------------------------
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#-------------------------------- UTILS --------------------------------
source "${CURRENT_DIR}/utils.sh"

#-------------------------------- FUNCTIONS --------------------------------
get_cpu_info() {
    case $(uname -s) in
        Linux|*BSD*)
            echo $(mpstat -o JSON -u 1 1 | jq '.sysstat.hosts[0].statistics[0]["cpu-load"][0].idle' | awk '{ printf("%.1f%", 100-$1) }')
        ;;

        Darwin)
        ;;

		CYGWIN*|MINGW32*|MSYS*|MINGW*)
		;;

		*)
		;;
    esac
}

get_mem_info() {
    case $(uname -s) in
        Linux|*BSD*)
            # USED everywhere = real USED + BUFFER + CACHE
            echo $(free | grep -i "^mem" | awk '{ printf("%.1f%", ($2-$NF)*100/$2) }')
        ;;
        
        Darwin)
        ;;

		CYGWIN*|MINGW32*|MSYS*|MINGW*)
		;;

		*)
		;;
    esac
}

main() {
    local cpu_usage=$(get_cpu_info)
    local mem_usage=$(get_mem_info)

    local show_powerline=$(get_tmux_option "@ultimate-theme-show-powerline" true)

    local icon_powerline_right_thin="|"
    local icon_cpu_mem=$(get_tmux_option "@ultimate-theme-icon-cpu-mem" "󰍛")
    
    if ${show_powerline}; then
        icon_powerline_right_thin=$(get_tmux_option "@ultimate-theme-icon-powerline-right-thin" "")
    fi       

    echo "CPU: ${cpu_usage} ${icon_powerline_right_thin} MEM: ${mem_usage} ${icon_cpu_mem} " 
}

main
