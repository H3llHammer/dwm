#!/bin/bash

if [ $1 = "up" ];
then
    amixer set Master 5%+ &>/dev/null && kill $(ps -e --forest | grep -A 1 autostart\.sh | tail -n1 | awk '{ print $1 }')
else
    amixer set Master 5%- &>/dev/null &&  kill $(ps -e --forest | grep -A 1 autostart\.sh | tail -n1 | awk '{ print $1 }')
fi
