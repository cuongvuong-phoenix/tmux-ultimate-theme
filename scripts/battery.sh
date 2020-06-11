#!/usr/bin/env bash

#-------------------------------- GLOBAL VARIABLES --------------------------------
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#-------------------------------- FUNCTIONS --------------------------------
get_tmux_options() {
    local option=$1
    local default_value=$2
    local option_value=$(tmux show-option -gvq "${option}")
    if [ -z $option_value ]; then
        echo $default_value
    else
        echo $option_value
    fi
}

get_battery_status() {
    local status=""

    local discharing_icon=$(get_tmux_options "@ultimate-theme-battery-discharging-icon" "")
    local ac_icon=$(get_tmux_options "@ultimate-theme-battery-ac-icon" "")

    case $(uname -s) in
        Linux)
            status=$(acpi | head -n 1 | cut --delimiter=":" --fields=2 | cut --delimiter="," --fields=1 | tr --delete " " | tr "[:upper:]" "[:lower:]")
        ;;

        Darwin)
            status=$(pmset -g batt | sed -n 2p | cut -d ';' -f 2)
        ;;

        *)
        ;;
    esac

    if [ $status =  "discharging" ]; then
        echo "${discharing_icon} "
    else
        echo "${ac_icon} "
    fi
}

get_battery_percentage() {
    case $(uname -s) in
        Linux)
            echo $(acpi | head -n 1 | cut --delimiter=":" --fields=2 | cut --delimiter="," --fields=2 | tr --delete " ")
        ;;

        Darkwin)
            echo $(pmset -g batt | grep -Eo '[0-9]?[0-9]?[0-9]%')
        ;;

        *)
        ;;
    esac
}

main() {
    local battery_status=$(get_battery_status)
    local battery_percentage=$(get_battery_percentage)

    echo "$battery_percentage ${battery_status}"
}

main
