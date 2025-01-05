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

dnf list installed mysql &>>$LOGS_FILE_NAME
if [ $? -ne 0 ]
then
    echo "Mysql not installed, Installing wait!!!!"

    dnf install mysql -y  &>>$LOGS_FILE_NAME
    VALIDATE $? "mysql installing"
else
    echo -e "mysql already $Y installed $N"
fi

dnf list installed git &>>$LOGS_FILE_NAME
if [ $? -ne 0 ]
then 
    echo "git not installed, istalling wait!!!"
    
    dnf install git -y &>>$LOGS_FILE_NAME
    VALIDATE $? "git installing"
else 
    echo -e "git already $Y installed $N"
fi
