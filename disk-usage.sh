#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5

while read r line
do 
    USAGE=$(echo $line | awk -F " " '{print $6F}')
    PARTITION=$(echo $line | awk -F " " '{print $7F}')
    echo "partition: $PARTITION , usage: $USAGE"
done <<< $DISK_USAGE