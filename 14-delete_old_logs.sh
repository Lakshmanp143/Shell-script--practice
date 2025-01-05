#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

SOURSE_DIR="/home/ec2-user/app-logs"
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOGS_FOLDER="/var/log/shell_script-old-logs1"
LOGS_FILE=$(echo $0 | cut -d "." -f1)
LOGS_FILE_NAME="$LOGS_FOLDER/$LOGS_FILE-$TIMESTAMP.log"

USERID=$(id -u)
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2.... $R FAILURE $N"
    else
        echo -e "$2.... $G SUCSESS $N"
    fi
}


sudo mkdir -p /var/log/shell_script-old-logs1
sudo chown -R ec2-user:ec2-user shell_script-old-logs1
echo -e "script started executing at:: $TIMESTAMP" &>>$LOGS_FILE_NAME


FILES_TO_DELETE=$(find $SOURSE_DIR -name "*.log" -mtime +14)
echo "Files to be deleted:: $FILES_TO_DELETE"
 