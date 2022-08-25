#!/bin/bash

for x in google.com facebook.com youtube.com baidu.com;
do
    if ping -q -c 3 $x > /dev/null; then
        echo "$x is up"
    else
        echo "$x is down"
    fi
done