#!/usr/bin/env bash

#-------------------------------- GLOBAL VARIABLES --------------------------------
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

BLACK="#232627"
WHITE="#fcfcfc"
RED="#ed1515"
GREEN="#11d418"
YELLOW="#e5c07b"
ORANGE="#f67400"
BLUE="#45a1ed"
MAGENTA="#9b59b6"
PINK="#ff79c6"
CYAN="#18b495"
GREY="#c1c4c3"
DARK_GREY="#3e4452"

#-------------------------------- UTILS --------------------------------
source "${CURRENT_DIR}/utils.sh"

#-------------------------------- MAIN --------------------------------
main() {
    #----------------------------------------------------------------------------
    #---------------------------- GET TMUX's OPTIONS ----------------------------
    #----------------------------------------------------------------------------
    #-------------------------------- Colors --------------------------------
    BLACK=$(get_tmux_option "@ultimate-theme-color-black" "${BLACK}")
    WHITE=$(get_tmux_option "@ultimate-theme-color-white" "${WHITE}")
    RED=$(get_tmux_option "@ultimate-theme-color-red" "${RED}")
    GREEN=$(get_tmux_option "@ultimate-theme-color-green" "${GREEN}")
    YELLOW=$(get_tmux_option "@ultimate-theme-color-yellow" "${YELLOW}")
    ORANGE=$(get_tmux_option "@ultimate-theme-color-orange" "${ORANGE}")
    BLUE=$(get_tmux_option "@ultimate-theme-color-blue" "${BLUE}")
    MAGENTA=$(get_tmux_option "@ultimate-theme-color-magenta" "${MAGENTA}")
    PINK=$(get_tmux_option "@ultimate-theme-color-pink" "${PINK}")
    CYAN=$(get_tmux_option "@ultimate-theme-color-cyan" "${CYAN}")
    GREY=$(get_tmux_option "@ultimate-theme-color-grey" "${GREY}")
    DARK_GREY=$(get_tmux_option "@ultimate-theme-color-dark-grey" "${DARK_GREY}")

    #-------------------------------- Optionals --------------------------------
    local show_powerline=$(get_tmux_option "@ultimate-theme-show-powerline" true)
    local show_prefix=$(get_tmux_option "@ultimate-theme-show-prefix" true)
    local show_cpu_mem_info=$(get_tmux_option "@ultimate-theme-show-cpu-mem" true)
    local show_date_time=$(get_tmux_option "@ultimate-theme-show-date-time" true)
    local show_network_id=$(get_tmux_option "@ultimate-theme-show-network-id" true)
    local show_network_ip_address=$(get_tmux_option "@ultimate-theme-show-network-ip-address" false)
    local show_battery=$(get_tmux_option "@ultimate-theme-show-battery" true)

    #-------------------------------- Information format --------------------------------
    # Date & time format
    local format_time=$(get_tmux_option "@ultimate-theme-format-time" "%H:%M")
    local format_date=$(get_tmux_option "@ultimate-theme-format-date" "%a, %e/%m/%Y")

    #-------------------------------- Icon/Symbols --------------------------------
    # Powerline's symbols
    local icon_powerline_icon=""
    local icon_powerline_left_thin="|"
    local icon_powerline_right=""
    local icon_powerline_right_thin="|"

    if $show_powerline; then
        icon_powerline_icon=$(get_tmux_option "@ultimate-theme-icon-powerline-left" "")
        icon_powerline_left_thin=$(get_tmux_option "@ultimate-theme-icon-powerline-left-thin" "")
        icon_powerline_right=$(get_tmux_option "@ultimate-theme-icon-powerline-right" "")
        icon_powerline_right_thin=$(get_tmux_option "@ultimate-theme-icon-powerline-right-thin" "")
    fi

    # Window : Pane icon
    local icon_window_pane=$(get_tmux_option "@ultimate-theme-icon-window-pane" "")

    # Prefix icon
    local icon_prefix=$(get_tmux_option "@ultimate-theme-icon-prefix" "")

    # Date & Time icon
    local icon_time=$(get_tmux_option "@ultimate-theme-icon-time" "")
    local icon_date=$(get_tmux_option "@ultimate-theme-icon-date" "")

    #------------------------------------------------------------------------
    #-------------------------------- STYLINGS --------------------------------
    #------------------------------------------------------------------------
    # Set refresh interval
    tmux set -g status-interval 4

    #-------------------------------- Cooridnates --------------------------------
    tmux set -g status-left-length "60"
    tmux set -g status-right-length "100"
    tmux set -g status-justify "left"

    #-------------------------------- Pane border styling --------------------------------
    tmux set -g pane-border-style "fg=${DARK_GREY}"
    tmux set -g pane-active-border-style "fg=${ORANGE}"

    #-------------------------------- Clock mode styling --------------------------------
    tmux set -g clock-mode-colour "${ORANGE}"

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
    tmux set -ga status-left "#[bg=${BLUE},fg=${power_fg},nobold,nounderscore,noitalics]${icon_powerline_icon}"
    tmux set -ga status-left "#[bg=${BLUE},fg=${BLACK},bold] #S "
    power_fg=${BLUE}

    # Window index : Pane index
    tmux set -ga status-left "#[bg=${GREY},fg=${power_fg},nobold,nounderscore,noitalics]${icon_powerline_icon}"
    tmux set -ga status-left "#[bg=${GREY},fg=${BLACK}, bold] ${icon_window_pane}  #I:#P "
    power_fg=${GREY}

    tmux set -ga status-left "#[bg=${BLACK},fg=${power_fg},nobold,nounderscore,noitalics]${icon_powerline_icon}"
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
        # tmux set -ga status-right "#[bg=${power_bg},fg=${BLACK},nobold,nounderscore,noitalics]#{?client_prefix,${icon_powerline_right},}"
        tmux set -ga status-right "#[bg=${BLACK},fg=${PINK}]#{?client_prefix, ${icon_prefix} ,}"
        power_bg=${BLACK}
    fi
    # tmux set -ga status-right "#[bg=${BLACK},fg=${GREY},nobold,nounderscore,noitalics]#{?client_prefix,#[bg=${power_bg}],}${icon_powerline_right}"

    # CPU & MEM info
    if $show_cpu_mem_info; then
        tmux set -ga status-right "#[bg=${power_bg},fg=${MAGENTA},nobold,nounderscore,noitalics]${icon_powerline_right}"
        tmux set -ga status-right "#[bg=${MAGENTA},fg=${WHITE}] #(${CURRENT_DIR}/cpu_mem_info.sh)"
        power_bg=${MAGENTA}
    fi

    # Date & Time
    if $show_date_time; then
        tmux set -ga status-right "#[bg=${power_bg},fg=${GREY},nobold,nounderscore,noitalics]${icon_powerline_right}"
        tmux set -ga status-right "#[bg=${GREY},fg=${BLACK}] ${format_time} ${icon_time}  "
        tmux set -ga status-right "#[bg=${GREY},fg=${BLACK},nobold,nounderscore,noitalics]${icon_powerline_right_thin}"
        tmux set -ga status-right "#[bg=${GREY},fg${BLACK}] ${format_date} ${icon_date}  "
        power_bg=${GREY}
    fi

    # Network's ID & IP address
    if $show_network_id; then
        tmux set -ga status-right "#[bg=${power_bg},fg=${CYAN},nobold,nounderscore,noitalics]${icon_powerline_right}"
        if $show_network_ip_address; then
            tmux set -ga status-right "#[bg=${CYAN},fg=${BLACK}] #(${CURRENT_DIR}/network_ip-address.sh) "
            tmux set -ga status-right "#[bg=${CYAN},fg=${BLACK},nobold,nounderscore,noitalics]${icon_powerline_right_thin}"
        fi
        tmux set -ga status-right "#[bg=${CYAN},fg=${BLACK}] #(${CURRENT_DIR}/network_id.sh) "
        power_bg=${CYAN}
    fi

    # Battery
    if $show_battery; then
        tmux set -ga status-right "#[bg=${power_bg},fg=${BLACK},nobold,nounderscore,noitalics]${icon_powerline_right}"
        tmux set -ga status-right "#[bg=${BLACK},fg=${ORANGE}] #(${CURRENT_DIR}/battery.sh) "
        power_bg=${BLACK}
    fi

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
    tmux set -wga window-status-current-format "#[bg=${YELLOW},fg=${BLACK},nobold,nounderscore,noitalics]${icon_powerline_icon}"
    tmux set -wga window-status-current-format "#[bg=${YELLOW},fg=${BLACK},bold] #I #[nobold,nounderscore,noitalics]${icon_powerline_left_thin}#[bold] #W #F "
    tmux set -wga window-status-current-format "#[bg=${BLACK},fg=${YELLOW},nobold,nounderscore,noitalics]${icon_powerline_icon}"

    # Format remaining Windows
    tmux set -wg window-status-format ""
    tmux set -wga window-status-format " #I #[nounderscore,noitalics]${icon_powerline_left_thin} #W #F "
}

main
