#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5
MSG=""

while read -r line
do 
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk -F " " '{print $NF}')
    #echo "partition: $PARTITION , usage: $USAGE"
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        MSG+="High Disk usage on partition: $PARTITION , usage is: $USAGE \n"
    fi
done <<< $DISK_USAGE

echo -e "message: $MSG"
echo "$MSG" | mutt -s "High disk usage" pagalalakshman8@gmail.com