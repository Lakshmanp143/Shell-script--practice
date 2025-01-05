#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"
USERID=$(id -u)
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2.... $R FAILURE $N"
    else
        echo "$2.... $G SUCSESS $N"
    fi
}


CHECH_ROOT(){
if [ $USERID -ne 0 ]
then
    echo "$B You need to be root user to execute tthis script $N"
    exit 1
fi
}
CHECH_ROOT

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "Mysql not installed, Installing wait!!!!"

    dnf install mysql -y 
    VALIDATE $? "mysql installing"
else
    echo "mysql already $Y installed $N"
fi

dnf list installed git 
if [ $? -ne 0 ]
then 
    echo "git not installed, istalling wait!!!"
    
    dnf install git -y
    VALIDATE $? "git installing"
else 
    echo "git already $Y installed $N"
fi
