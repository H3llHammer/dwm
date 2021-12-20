#!/bin/bash

mute="$(amixer get Master | grep "Front .*:" | awk '$6 == "[on]" {print "true"}' | uniq)"
    
if [ $mute -a true ]; then
     amixer set Master mute &>/dev/null
else
     amixer set Master unmute &>/dev/null
fi

kill -15 $(ps -e --forest | grep -A 1 autostart\.sh | tail -n1 | awk '{ print $1 }')


