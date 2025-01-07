#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
SOURCE_DIR=$1
DESTIN_DIR=$2
DAYS=${3:-14} #if user is not providing number of days, we are taking 14 as default
LOGS_FOLDER="/home/ec2-user/shellscript-logs"
LOGS_FILE=$(echo $0 | awk -F "/" '{print $NF}' | cut -d "." -f1 )
LOGS_FILE_NAME="$LOGS_FOLDER/$LOGS_FILE-$TIMESTAMP.log"

USAGE(){
    echo -e "$R USAGE:: $N backup <SOURCE_DIR> <DESTIN_DIR> <DAYS(optional)>"
    exit 1
}

if [ $# -lt 2 ]
then
    USAGE
fi 

mkdir -p /home/ec2-user/shellscript-logs

if [ ! -d "$SOURCE_DIR" ]
then
    echo -e "$SOURCE_DIR Does not exist...please check"
    exit 1
fi

if [ ! -d "$DESTIN_DIR" ]
then
    echo -e "$DESTIN_DIR Does not exist...please check"
    exit 1
fi

echo "Script started executing at:: $TIMESTAMP"  &>>LOGS_FILE_NAME

FILES=$(find $SOURCE_DIR -name "*log" -mtime +$DAYS)  
if [ -n "$FILES" ]
then 
    echo "Files are:: $FILES" # true if there are files to zip
    ZIP_FILE="$DESTIN_DIR/app-logs-$TIMESTAMP.zip"
    find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILE"
    if [ -f "$ZIP_FILE" ]
    then
        echo -e "Successfully created zip file for flles olderthan $DAYS" 
        while read -r filepath
        do
            echo "Files to deleting:: $filepath"  &>>LOGS_FILE_NAME
            rm -rf $filepath
            echo "Files deleted: $filepath"
        done <<< $FILES
    else 
        echo -e "$R ERROR: $N Failed to create zip file"
    fi
else
    echo -e "No files found olderthan 14 days"
fi
