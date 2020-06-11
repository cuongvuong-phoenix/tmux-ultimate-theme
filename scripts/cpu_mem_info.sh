#!/usr/bin/env bash

get_cpu_info() {
    case $(uname -s) in
        Linux)
            echo $(mpstat -o JSON -u 1 1 | jq '.sysstat.hosts[0].statistics[0]["cpu-load"][0].idle' | awk '{ printf("%.1f%", 100-$1) }')
        ;;

        Darwin)
        ;;

		CYGWIN*|MINGW32*|MSYS*|MINGW*)
			# leaving empty - TODO - windows compatability
		;;

		*)
		;;
    esac
}

get_mem_info() {
    case $(uname -s) in
        Linux)
            echo $(free | grep -i "^mem" | awk '{ printf("%.1f%", ($2-$NF)*100/$2) }')
        ;;
        
        Darwin)
        ;;

		CYGWIN*|MINGW32*|MSYS*|MINGW*)
			# leaving empty - TODO - windows compatability
		;;

		*)
		;;
    esac
}

main() {
    local cpu_usage=$(get_cpu_info)
    local mem_usage=$(get_mem_info)

    echo "CPU: $cpu_usage | MEM: $mem_usage  " 
}

main
