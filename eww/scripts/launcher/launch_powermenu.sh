#!/bin/bash

ewwPath="$HOME/.config/eww"
tmpPath="$HOME/.cache/eww/powermenu"
v0="SHOW_POWER_MENU"

if [ ! -d $HOME/.cache/eww ]; then
    mkdir $HOME/.cache/eww;
fi

windows="window_powermenu"

toggle() {
    if [ -f $tmpPath ]; then
        rm $tmpPath
        eww -c $ewwPath close $windows
        eww -c $ewwPath update $v0=false
    else
        touch $tmpPath
        eww -c $ewwPath open-many $windows
        eww -c $ewwPath update $v0=true
    fi
}

if [ "$1" == "--toggle" ]; then
    toggle
fi
