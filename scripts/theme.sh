#!/usr/bin/env bash

#-------------------------------- GLOBAL VARIABLES --------------------------------
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

BLACK="#232627"
WHITE="#fcfcfc"
RED="#ed1515"
GREEN="#11d418"
YELLOW="#E5C07B"
ORANGE="#f67400"
BLUE="#45a1ed"
MAGENTA="#9b59b6"
PINK="#ff79c6"
CYAN="#18b495"
GREY="#C1C4C3"
DARK_GREY="#3e4452"

#-------------------------------- FUNCTIONS --------------------------------
get_tmux_options() {
    local option=$1
    local default_value=$2
    local option_value=$(tmux show-options -gvq "${option}")
    if [ -z $option_value ]; then
        echo $default_value
    else
        echo $option_value
    fi
}

main() {
    #------------------------------------------------------------------------------------
    #-------------------------------- GET TMUX's OPTIONS --------------------------------
    #------------------------------------------------------------------------------------
    # Colors
    BLACK=$(get_tmux_options "@ultimate-theme-color-black" "${BLACK}")
    WHITE=$(get_tmux_options "@ultimate-theme-color-white" "${WHITE}")
    RED=$(get_tmux_options "@ultimate-theme-color-red" "${RED}")
    GREEN=$(get_tmux_options "@ultimate-theme-color-green" "${GREEN}")
    YELLOW=$(get_tmux_options "@ultimate-theme-color-yellow" "${YELLOW}")
    ORANGE=$(get_tmux_options "@ultimate-theme-color-orange" "${ORANGE}")
    BLUE=$(get_tmux_options "@ultimate-theme-color-blue" "${BLUE}")
    MAGENTA=$(get_tmux_options "@ultimate-theme-color-magenta" "${MAGENTA}")
    PINK=$(get_tmux_options "@ultimate-theme-color-pink" "${PINK}")
    CYAN=$(get_tmux_options "@ultimate-theme-color-cyan" "${CYAN}")
    GREY=$(get_tmux_options "@ultimate-theme-color-grey" "${GREY}")
    DARK_GREY=$(get_tmux_options "@ultimate-theme-color-dark-grey" "${DARK_GREY}")

    # Prefix symbol
    local prefix_symbol=$(get_tmux_options "@ultimate-theme-prefix-symbol" "")

    # Powerline symbol/icon
    local show_powerline=$(get_tmux_options "@ultimate-theme-show-powerline" true)

    local powerline_left_icon=""
    local powerline_left_icon_thin="|"
    local powerline_right_icon=""
    local powerline_right_icon_thin="|"

    if $show_powerline; then
        powerline_left_icon=$(get_tmux_options "@ultimate-theme-powerline-left-icon" "")
        powerline_left_icon_thin=$(get_tmux_options "@ultimate-theme-powerline-left-icon-thin" "")
        powerline_right_icon=$(get_tmux_options "@ultimate-theme-powerline-right-icon" "")
        powerline_right_icon_thin=$(get_tmux_options "@ultimate-theme-powerline-right-icon-thin" "")
    fi

    # Date & time format
    local clock_format=$(get_tmux_options "@ultimate-theme-clock-format" "%H:%M")
    local date_format=$(get_tmux_options "@ultimate-theme-date-format" "%a, %e/%m/%Y")

    # Optionals
    local show_prefix=$(get_tmux_options "@ultimate-theme-show-prefix" true)
    local show_date_time=$(get_tmux_options "@ultimate-theme-show-date-time" true)
    local show_network_id=$(get_tmux_options "@ultimate-theme-show-network-id" true)
    local show_network_ip_address=$(get_tmux_options "@ultimate-theme-show-network-ip-address" false)
    local show_battery=$(get_tmux_options "@ultimate-theme-show-battery" true)

    #------------------------------------------------------------------------
    #-------------------------------- STYLING --------------------------------
    #------------------------------------------------------------------------
    # Set refresh interval
    tmux set -g status-interval 5

    #-------------------------------- Cooridnates --------------------------------
    tmux set -g status-left-length "60"
    tmux set -g status-right-length "100"
    tmux set -g status-justify "left"

    #-------------------------------- Pane border styling --------------------------------
    tmux set -g pane-border-style "fg=${DARK_GREY}"
    tmux set -g pane-active-border-style "fg=${ORANGE}"

    #-------------------------------- Message styling --------------------------------
    tmux set -g message-style "bg=${DARK_GREY},fg=${WHITE}"

    #-------------------------------- Status bar --------------------------------
    tmux set -g status-style "bg=${BLACK},fg=${WHITE}"

    #-------------------------------- Status bar / left --------------------------------
    # power_fg = closet bg
    local power_fg=${BLACK}

    tmux set -g status-left ""

    # Host name
    tmux set -ga status-left "#[bg=${BLACK},fg=${ORANGE},bold] #h "
    power_fg=${BLACK}

    # Session name
    tmux set -ga status-left "#[bg=${BLUE},fg=${power_fg},nobold,nounderscore,noitalics]${powerline_left_icon}"
    tmux set -ga status-left "#[bg=${BLUE},fg=${BLACK},bold] #S "
    power_fg=${BLUE}

    # Window index : Pane index
    tmux set -ga status-left "#[bg=${GREY},fg=${power_fg},nobold,nounderscore,noitalics]${powerline_left_icon}"
    tmux set -ga status-left "#[bg=${GREY},fg=${BLACK}, bold]   #I:#P "
    power_fg=${GREY}

    tmux set -ga status-left "#[bg=${BLACK},fg=${power_fg},nobold,nounderscore,noitalics]${powerline_left_icon}"
    # Separators
    tmux set -ga status-left "#[bg=${BLACK},fg=${BLACK},nobold,nounderscore,noitalics]  "
    power_fg=${BLACK}

    #-------------------------------- Status bar / right --------------------------------
    # power_bg = closet bg
    local power_bg=${BLACK}

    tmux set -g status-right ""

    # Separators
    tmux set -ga status-right "#[bg=${BLACK},fg=${BLACK},nobold,nounderscore,noitalics]  "

    # Prefix
    if $show_prefix; then
        # tmux set -ga status-right "#[bg=${power_bg},fg=${BLACK},nobold,nounderscore,noitalics]#{?client_prefix,${powerline_right_icon},}"
        tmux set -ga status-right "#[bg=${BLACK},fg=${PINK}]#{?client_prefix, ${prefix_symbol} ,}"
        power_bg=${BLACK}
    fi

    # Date & Time
    # tmux set -ga status-right "#[bg=${BLACK},fg=${GREY},nobold,nounderscore,noitalics]#{?client_prefix,#[bg=${power_bg}],}${powerline_right_icon}"
    if $show_date_time; then
        tmux set -ga status-right "#[bg=${power_bg},fg=${GREY},nobold,nounderscore,noitalics]${powerline_right_icon}"
        tmux set -ga status-right "#[bg=${GREY},fg=${BLACK}] ${clock_format}   "
        tmux set -ga status-right "#[bg=${GREY},fg=${BLACK},nobold,nounderscore,noitalics]${powerline_right_icon_thin}"
        tmux set -ga status-right "#[bg=${GREY},fg${BLACK}] ${date_format}   "
        power_bg=${GREY}
    fi

    # Network's ID & IP address
    if $show_network_id; then
        tmux set -ga status-right "#[bg=${power_bg},fg=${CYAN},nobold,nounderscore,noitalics]${powerline_right_icon}"
        if $show_network_ip_address; then
            tmux set -ga status-right "#[bg=${CYAN},fg=${BLACK}] $(${CURRENT_DIR}/network_ip-address.sh) "
            tmux set -ga status-right "#[bg=${CYAN},fg=${BLACK},nobold,nounderscore,noitalics]${powerline_right_icon_thin}"
        fi
        tmux set -ga status-right "#[bg=${CYAN},fg=${BLACK}] $(${CURRENT_DIR}/network_id.sh) "
        power_bg=${CYAN}
    fi

    # Battery
    if $show_battery; then
        tmux set -ga status-right "#[bg=${power_bg},fg=${BLACK},nobold,nounderscore,noitalics]${powerline_right_icon}"
        tmux set -ga status-right "#[bg=${BLACK},fg=${ORANGE}] $(${CURRENT_DIR}/battery.sh) "
        power_bg=${BLACK}
    fi

    # # Host name
    # tmux set -ga status-right "#[bg=${power_bg},fg=${BLUE},nobold,nounderscore,noitalics]${powerline_right_icon}"
    # tmux set -ga status-right "#[bg=${BLUE},fg=${BLACK},bold] #h "

    #-------------------------------- Window tabs --------------------------------
    # Windows separator
    tmux set -wg window-status-separator " "

    # Default Windows styling
    tmux set -wg window-status-style "bg=${BLACK},fg=${WHITE}"

    # Activity Windows (#) styling 
    tmux set -wg window-status-activity-style "bg=${BLACK},fg=${YELLOW},bold"

    # Bell Windows (!) styling
    tmux set -wg window-status-bell-style "bg=${BLACK},fg=${RED},bold"

    # Last Windows (-) styling
    tmux set -wg window-status-last-style "bg=${BLACK},fg=${WHITE},bold"

    # Format Current Window
    tmux set -wg window-status-current-format ""
    tmux set -wga window-status-current-format "#[bg=${YELLOW},fg=${BLACK},nobold,nounderscore,noitalics]${powerline_left_icon}"
    tmux set -wga window-status-current-format "#[bg=${YELLOW},fg=${BLACK},bold] #I #W #F "
    tmux set -wga window-status-current-format "#[bg=${BLACK},fg=${YELLOW},nobold,nounderscore,noitalics]${powerline_left_icon}"

    # Format remaining Windows
    tmux set -wg window-status-format ""
    tmux set -wga window-status-format " #I #W #F "
}

# Run main function
main
