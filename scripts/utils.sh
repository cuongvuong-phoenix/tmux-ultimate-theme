#!/usr/bin/env bash

#-------------------------------- FUNCTIONS --------------------------------
#                           get_tmux_option $1 $2
# Desc: Get value from a specific tmux's option.
# Arguments:    $1 (required): Name of the option.
#               $2 (required): Default value.
get_tmux_option() {
    local option=$1
    local default_value=$2
    local option_value=$(tmux show-options -gvq "${option}")
    if [ -z $option_value ]; then
        echo $default_value
    else
        echo $option_value
    fi
}


