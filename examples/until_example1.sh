#!/bin/bash

until [[ $order == "coffee" ]]
do
    echo "What do you want to order?"
    read order  # read order
done
echo "Thank you! Enjoy your $order"