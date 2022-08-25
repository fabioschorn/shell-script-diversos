#!/bin/bash

x=1

while [[ $x -le 5 ]]
do
    read -p " $x coffees in your day so far... Press Enter to add one more!!! " 
    ((x++)) # incremento x
done

echo " You've reached your coffee limit in your day, which is $x. "