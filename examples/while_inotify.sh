#!/bin/bash
path="/home/username/Downloads"
destpath="/home/username/Documents/Downloads"
while inotifywait -r -e modify,create,delete,move $path
    do
        rsync -avz --progress "$path" "$destpath"
    done