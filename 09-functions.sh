#!/bin/bash
# Our program goal is to install mysql
DATE=$(date +%F-%H-%M-%S)
LOGFILE=/tmp/
USERID=$(id -u)
# This function should validate the previous command and should inform the user whether it is success or failure
VALIDATE(){
    #$1 -- It will receive the argument1
    if [ $1 -ne 0 ]
then
   #echo "Installation ... FAILURE"
   echo "$2 ... FAILURE"
   exit 1
else
   #echo "Installation ... SUCCESS"
   echo "$2 ... SUCCESS"
fi
}

# It is our responsibility to check whether installation is success or not
yum install mysql -y

VALIDATE $?

yum install postfix -y

VALIDATE $?