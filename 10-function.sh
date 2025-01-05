#!/bin/bash
USERID=$(id -u)
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2....FAILURE"
    else
        echo "$2....SUCSESS"
    fi
}



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
    VALIDATE $? "mysql installing"
else
    echo "mysql already installed"
fi

dnf list installed git 
if [ $? -ne 0 ]
then 
    echo "git not installed, istalling wait!!!"
    
    dnf install git -y
    VALIDATE $? "git installing"
else 
    echo "git already installed"
fi
