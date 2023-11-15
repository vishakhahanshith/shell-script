#!/bin/bash
# Our program goal is to install git
USERID=$(id -u)
if [ $USERID -ne 0]
then
   echo "ERROR:: Please run this script with root user"
#else
   #echo "INFO:: You are root user"
fi

yum install git -y