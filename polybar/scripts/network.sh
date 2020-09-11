#!/bin/sh

source ~/.config/polybar/env

if $(nm-online -q); then
    echo "%{F$PBC_GREEN}%{F-}"
else
    echo "%{F$PBC_RED}%{F-}"
fi

