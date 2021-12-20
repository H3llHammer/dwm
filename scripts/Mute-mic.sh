#!/bin/sh
mic="$(amixer get Capture | grep "Front .*:" | awk '$6 == "[on]" {print "true"}' | uniq)"

if [ $mic -a true ]; then
    amixer set Capture nocap &>/dev/null
else
    amixer set Capture cap &>/dev/null
fi

kill -15 $(ps -e --forest | grep -A 1 autostart\.sh | tail -n1 | awk '{ print $1 }')
