#!/bin/bash
# Our program goal is to install mysql
DATE=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0"

VALIDATE(){
    #$1 -- It will receive the argument1
    if [ $1 -ne 0 ]
then
   #echo "Installation ... FAILURE"
   echo -e "$2 ... $R FAILURE $N"
   exit 1
else
   #echo "Installation ... SUCCESS"
   echo -e "$2 ... $G SUCCESS $N"
fi
}

USERID=$(id -u)
# This function should validate the previous command and should inform the user whether it is success or failure

if [ $USERID -ne 0 ]
then
   echo "ERROR:: Please run this script with root access"
   exit 1
fi

# It is our responsibility to check whether installation is success or not
yum install mysql -y &>>$LOGFILE

VALIDATE $?

yum install postfix -y &>>$LOGFILE

VALIDATE $?