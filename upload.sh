#!bin/bash

LOG_PATH="./log"
DIR_PATH="./sample-dir"
ARCHIVE_PATH="/archive"
GS_URL="gs://20200407_test"

LOG_FILE=$(echo `date "+%Y%m%d_%H%M%S"`).log
touch $LOG_PATH/$LOG_FILE

for filename in `ls -F $DIR_PATH | grep -v / `
do
    imei=$(echo $filename | sed 's/\_..[^\.]*$//')
    mkdir -p $DIR_PATH$ARCHIVE_PATH/$imei

    # gcs upload
    gsutil cp $DIR_PATH/$filename $GS_URL/$imei/$filename >> $LOG_PATH/$LOG_FILE 2>&1

    if [ $? -gt 0 ]; then
        # error
        echo "move file to GCS is failed." >> $LOG_PATH/$LOG_FILE
    else
        mv $DIR_PATH/$filename $DIR_PATH$ARCHIVE_PATH/$imei/
    fi

done