#!/usr/bin/env bash

#-------------------------------- GLOBAL VARIABLES --------------------------------
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

BLACK="#232627"
WHITE="#fcfcfc"
RED="#ed1515"
GREEN="#11d116"
YELLOW="#E5C07B"
ORANGE="#f67400"
BLUE="#1d99f3"
MAGENTA="#9b59b6"
PINK="#ff79c6"
CYAN="#1abc9c"
GREY="#C1C4C3"
DARK_GREY="#373c49"

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

main() {
    # Get tmux's options
    local prefix_symbol=$(get_tmux_options "@ultimate-theme-prefix-symbol" "")
    local powerline_left_icon=$(get_tmux_options "@ultimate-theme-powerline-left-icon" "")
    local power_thin_left_icon=$(get_tmux_options "@ultimate-theme-power-thin-left-icon" "")
    local powerline_right_icon=$(get_tmux_options "@ultimate-theme-powerline-right-icon" "")
    local power_thin_right_icon=$(get_tmux_options "@ultimate-theme-power-thin-right-icon" "")

    local clock_format=$(get_tmux_options "@ultimate-theme-clock-format" "%H:%M")
    local date_format=$(get_tmux_options "@ultimate-theme-date-format" "%a, %e/%m/%Y")

    #------------------------------------------------------------------------
    #-------------------------------- STYLING --------------------------------
    #------------------------------------------------------------------------
    # Set refresh interval
    tmux set status-interval 5

    #-------------------------------- Cooridnates --------------------------------
    tmux set status-left-length "100"
    tmux set status-right-length "100"
    tmux set status-justify "left"

    #-------------------------------- Pane border styling --------------------------------
    tmux set pane-border-style "fg=${DARK_GREY}"
    tmux set pane-active-border-style "fg=${BLUE}"

    #-------------------------------- Message styling --------------------------------
    tmux set message-style "bg=${DARK_GREY},fg=${WHITE}"

    #-------------------------------- Status bar --------------------------------
    tmux set status-style "bg=${BLACK},fg=${WHITE}"

    #-------------------------------- Status bar / left --------------------------------
    tmux set status-left ""

    # power_fg = closet bg
    local power_fg=${BLACK}

    # Session name
    tmux set -a status-left "#[bg=${BLUE},fg=${BLACK},bold] #S "
    power_fg=${BLUE}
    # Window index : Pane index
    tmux set -a status-left "#[bg=${GREY},fg=${power_fg},nobold,nounderscore,noitalics]${powerline_left_icon}"
    tmux set -a status-left "#[bg=${GREY},fg=${BLACK}, bold]   #I:#P "
    power_fg=${GREY}
    # end spaces
    tmux set -a status-left "#[bg=${BLACK},fg=${power_fg},nobold,nounderscore,noitalics]${powerline_left_icon}"
    tmux set -a status-left "#[bg=${BLACK},fg=${BLACK}]${powerline_left_icon}${powerline_left_icon}"
    power_fg=${BLACK}

    #-------------------------------- Status bar / right --------------------------------
    tmux set status-right ""

    # power_bg = closet bg
    local power_bg=${BLACK}

    # Prefix
    tmux set -a status-right "#[bg=${power_bg},fg=${BLACK},nobold,nounderscore,noitalics]#{?client_prefix,${powerline_right_icon},}"
    tmux set -a status-right "#[bg=${BLACK},fg=${PINK}]#{?client_prefix, ${prefix_symbol} ,}"
    power_bg=${BLACK}

    # Date & Time
    tmux set -a status-right "#[bg=${BLACK},fg=${GREY},nobold,nounderscore,noitalics]#{?client_prefix,#[bg=${power_bg}],}${powerline_right_icon}"
    tmux set -a status-right "#[bg=${GREY},fg=${BLACK}] ${clock_format}   "
    tmux set -a status-right "#[bg=${GREY},fg=${BLACK},nobold,nounderscore,noitalics]${power_thin_right_icon}"
    tmux set -a status-right "#[bg=${GREY},fg${BLACK}] ${date_format}   "
    power_bg=${GREY}

    # Network's ID 
    tmux set -a status-right "#[bg=${power_bg},fg=${YELLOW},nobold,nounderscore,noitalics]${powerline_right_icon}"
    tmux set -a status-right "#[bg=${YELLOW},fg=${BLACK}] $(${CURRENT_DIR}/network_id.sh)  "
    power_bg=${YELLOW}

    # Battery
    tmux set -a status-right "#[bg=${power_bg},fg=${BLACK},nobold,nounderscore,noitalics]${powerline_right_icon}"
    tmux set -a status-right "#[bg=${BLACK},fg=${ORANGE}] $(${CURRENT_DIR}/battery.sh)  "
    power_bg=${BLACK}

    # Host name
    tmux set -a status-right "#[bg=${power_bg},fg=${BLUE},nobold,nounderscore,noitalics]${powerline_right_icon}"
    tmux set -a status-right "#[bg=${BLUE},fg=${BLACK},bold] #h "

    #-------------------------------- Window tabs --------------------------------
    # Default Windows styling
    tmux set -wg window-status-style "bg=${BLACK},fg=${WHITE}"

    # Activity Windows (#) styling 
    tmux set -wg window-status-activity-style "bg=${BLACK},fg=${YELLOW},bold"

    # Bell Windows (!) styling
    tmux set -wg window-status-bell-style "bg=${BLACK},fg=${RED},bold"

    # Last Windows (-) styling
    tmux set -wg window-status-last-style "bg=${BLACK},fg=${WHITE},bold"

    # Windows separator
    tmux set -wg window-status-separator ""

    # Activating
    tmux set -wg window-status-current-format ""
    tmux set -wga window-status-current-format "#[bg=${YELLOW},fg=${BLACK},nobold,nounderscore,noitalics]${powerline_left_icon}"
    tmux set -wga window-status-current-format "#[bg=${YELLOW},fg=${BLACK},bold] #I #W #F "
    tmux set -wga window-status-current-format "#[bg=${BLACK},fg=${YELLOW},nobold,nounderscore,noitalics]${powerline_left_icon}"

    # Remaining
    tmux set -wg window-status-format " "
    tmux set -wga window-status-format " #I #W #F "
}

# Run main function
main
