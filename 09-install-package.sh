#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "You need to be root user to execute tthis script"
    exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "Mysql not installed, Installing wait!!!!"
    dnf install mysql -y 
    if [ $? -ne 0 ]
    then 
        echo "mysql installing failed"
    else 
        echo "mysql installing success"
    fi
else
    echo "mysql already installed"

dnf list installed git 
if [ $? -ne 0 ]
then 
    echo "git ont installed, istalling wait!!!"
    dnf install got -y
    if [ $? -ne 0 ]
    then
        echo "git instaklling failed"
    else
        echo "git installing success"
    fi
else 
    echo "git already installed"
