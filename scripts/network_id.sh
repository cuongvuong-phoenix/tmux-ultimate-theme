#!/usr/bin/env bash

HOSTS_TEST="google.com github.com example.com"

get_ssid()
{
	# Check OS
	case $(uname -s) in
		Linux)
			SSID=$(iw dev | sed -nr 's/^\t\tssid (.*)/\1/p')
			if [ -n "$SSID" ]; then
				printf '%s' "$SSID"
			else
				echo 'Ethernet'
			fi
		;;

		Darwin)
			if /System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | grep -E ' SSID' | cut -d ':' -f 2 | sed 's/ ^*//g' &> /dev/null; then
				echo "$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | grep -E ' SSID' | cut -d ':' -f 2)" | sed 's/ ^*//g'
			else
				echo 'Ethernet'
			fi
		;;

		CYGWIN*|MINGW32*|MSYS*|MINGW*)
			# leaving empty - TODO - windows compatability
		;;

		*)
		;;
	esac

}

main()
{
	local network="Offline"

	for host in $HOSTS_TEST; do
	    if ping -q -c 1 -W 1 $host &>/dev/null; then
		    network="$(get_ssid)"
		    break
	    fi
	done

    if [ $network = "Offline" ]; then
        echo "$network  "
    elif [ $network = "Ethernet" ]; then
        echo "$network ﯱ "
    else
        echo "$network  "
    fi
}

#run main driver function
main

