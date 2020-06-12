#!/usr/bin/env bash

#-------------------------------- GLOBAL VARIABLES --------------------------------
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOSTS_TEST="google.com github.com example.com"

#-------------------------------- UTILS --------------------------------
source "${CURRENT_DIR}/utils.sh"

#-------------------------------- FUNCTIONS --------------------------------
get_ssid()
{
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

    local network_offline_icon=$(get_tmux_option "@ultimate-theme-network-offline-icon" "")
    local network_ethernet_icon=$(get_tmux_option "@ultimate-theme-network-ethernet-icon" "ﯱ")
    local network_wifi_icon=$(get_tmux_option "@ultimate-theme-network-wifi-icon" "")

    if [[ ${network} == "Offline" ]]; then
        echo "${network} ${network_offline_icon} "
    elif [[ ${network} == "Ethernet" ]]; then
        echo "${network} ${network_ethernet_icon} "
    else
        echo "${network} ${network_wifi_icon} "
    fi
}

main

