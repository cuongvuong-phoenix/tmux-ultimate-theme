#!/usr/bin/env bash

get_ip_address() {
    case $(uname -s) in
        Linux)
            if ip route get 1 > /dev/null 2>&1; then
                echo $(ip route get 1 | sed -nr "s/^.*src ([0-9.]*) .*$/\1/p")
            else
                echo "127.0.0.1"
            fi
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
    local ip_address=$(get_ip_address)

    echo "$ip_address"
}

main
