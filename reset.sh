#!bin/bash

LOG_PATH="./log"
DIR_PATH="./sample-dir"
ARCHIVE_PATH="/archive"

for filename in `ls -F $DIR_PATH/$ARCHIVE_PATH/* | grep -v / `
do
    imei=$(echo $filename | sed 's/\_..[^\.]*$//')
    mv $DIR_PATH$ARCHIVE_PATH/$imei/$filename $DIR_PATH/
done
rm -r $DIR_PATH$ARCHIVE_PATH/*
rm -r $LOG_PATH/*