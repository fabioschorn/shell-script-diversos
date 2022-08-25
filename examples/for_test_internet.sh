#!/bin/bash

#is online?

echo "Checking internet connection...Tell the IP?"
read target

while true
do
    if ping -q -c 3 -W 1 $target > /dev/null; then
        echo "Internet is up"
        break
    else
        echo "$target Internet is down"
    fi
sleep 1
done