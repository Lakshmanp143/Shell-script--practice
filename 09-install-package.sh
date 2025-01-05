#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "You need to be root user to execute tthis script"
    exit 1
fi



dnf list installed | grep git 
if [ $? -ne 0 ]
then 
    
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "git installing failed"
    else
        echo "git installing success"
    fi
else 
    echo "git already installed"
