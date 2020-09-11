#!/bin/sh

source ~/.config/polybar/env

if ! updates=$(checkupdates 2> /dev/null | wc -l ); then
    updates=0
fi

if [ "$updates" -gt 0 ]; then
    echo "%{F$PBC_BLUE}%{F-}"
else
    echo "%{F$PBC_ALT_FG}%{F-}"
fi

