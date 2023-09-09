#!/bin/sh
FOLDER1=/code/
FOLDER2=user/

rsync -avz --delete $FOLDER1 $FOLDER2
while true; do
    #inotifywait -r -e modify,create,delete,move $FOLDER1
    #rsync -avz --delete $FOLDER1 $FOLDER2
    inotifywait -r -e modify,create,delete $FOLDER2
    rsync -avz --delete $FOLDER2 $FOLDER1
done