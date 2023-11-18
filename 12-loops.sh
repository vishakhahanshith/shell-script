#!/bin/bash

# Below code represents user should have root access
DATE=$(date +%F) # This will print the date in proper format
LOGSDIR=/home/centos/shellscript-logs # This is the location where you will be storing all the shell script log files
# inside /home/centos/shellscript-logs/script-name-date.log
SCRIPT_NAME=$0 # This will print the script name
LOGFILE=$LOGSDIR/$SCRIPT_NAME-$DATE.log # Storing log files here
USERID=$(id -u)
R="\e[31m" # Red
N="\e[0m" # No colour
Y="\e[33m" # Yellow
G="\e[32m" # Green

if [ $USERID -ne 0 ]
then
   echo -e "$R ERROR:: Please run this script with root access $N"
   exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ] # $1 - is the 1st argument -- if the exit status is not equal to zero
    then
       echo -e "Installing $2 ... $R FAILURE $N" # $2 is the package
       exit 1
    else
       echo -e "Installing $2 ... $G SUCCESS $N"
    fi
}

# All arguments are in $@
for i in $@
do
  yum list installed $i &>>$LOGFILE # This will check whether the packages are installed or not
  if [ $? -ne 0 ] # If exit status is not equal to zero
  then
     echo "$i is not installed, let's install it"
     yum install $i -y &>>$LOGFILE
     VALIDATE $? "$i"
  else 
     echo -e "$Y $i is already installed $N"
  fi
done