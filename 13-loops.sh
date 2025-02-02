#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOGS_FOLDER="/var/log/shell_script-logs"
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


CHECH_ROOT(){
if [ $USERID -ne 0 ]
then
    echo -e " $B You need to be root user to execute tthis script $N"
    exit 1
fi
}
mkdir -p /var/log/shell_script-logs
echo -e "script started executing at:: $TIMESTAMP" &>>$LOGS_FILE_NAME
CHECH_ROOT

for package in $@
do
    dnf list installed $package &>>$LOGS_FILE_NAME
    if [ $? -ne 0 ]
    then
        echo -e "$package not installed, $B installing wait!!! $N"
        dnf install $package -y  &>>$LOGS_FILE_NAME
        VALIDATE $? "$package installing"
    else
        echo -e "$package already $Y ......installed $N"
    fi
done