#!/usr/bin/env bash

#-------------------------------- GLOBAL VARIABLES --------------------------------
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#-------------------------------- UTILS --------------------------------
source "${CURRENT_DIR}/utils.sh"

#-------------------------------- FUNCTIONS --------------------------------
get_battery_percentage() {
    case $(uname -s) in
        Linux|*BSD*)
            echo $(acpi | head -n 1 | cut --delimiter=':' --fields=2 | cut --delimiter=',' --fields=2 | tr --delete --complement '0-9')
        ;;

        Darkwin)
            echo $(pmset -g batt | grep -Eo '[0-9]?[0-9]?[0-9]%' | tr --delete --complement '0-9')
        ;;

		CYGWIN*|MINGW32*|MSYS*|MINGW*)
		;;

        *)
        ;;
    esac
}

get_battery_status() {
    case $(uname -s) in
        Linux|*BSD*)
            echo $(acpi | head -n 1 | cut --delimiter=":" --fields=2 | cut --delimiter="," --fields=1 | tr --delete " " | tr "[:upper:]" "[:lower:]")
        ;;

        Darwin)
            echo $(pmset -g batt | sed -n 2p | cut -d ';' -f 2)
        ;;

		CYGWIN*|MINGW32*|MSYS*|MINGW*)
		;;

        *)
        ;;
    esac
}

main() {
    local battery_percentage=$(get_battery_percentage)
    local battery_status=$(get_battery_status)

    local icon_battery=""

    if [[ ${battery_status} !=  "discharging" ]]; then
        icon_battery=$(get_tmux_option "@ultimate-theme-icon-battery-ac" "")
    else
        # icon_battery=$(get_tmux_option "@ultimate-theme-icon-battery-discharging" "")
        if [ ${battery_percentage} -gt 75 ]; then
            icon_battery=$(get_tmux_option "@ultimate-theme-icon-battery-discharging-4" "")
        elif [ ${battery_percentage} -gt 50 ]; then
            icon_battery=$(get_tmux_option "@ultimate-theme-icon-battery-discharging-3" "")
        elif [ ${battery_percentage} -gt 25 ]; then
            icon_battery=$(get_tmux_option "@ultimate-theme-icon-battery-discharging-2" "")
        elif [ ${battery_percentage} -gt 5 ]; then
            icon_battery=$(get_tmux_option "@ultimate-theme-icon-battery-discharging-1" "")
        else
            icon_battery=$(get_tmux_option "@ultimate-theme-icon-battery-discharging-0" "")
        fi
    fi

    echo "${battery_percentage}% ${icon_battery}"
}

main
