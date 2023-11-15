#!/bin/bash
# Our program goal is to install mysql
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
   echo "ERROR:: Please run this script with root user"
   exit 1
#else
   #echo "INFO:: You are root user"
fi

# It is our responsibility to check whether installation is success or not
yum install mysql -y

if [ $? -ne 0 ]
then
   echo "Installation of mysql is failed"
   exit 1
else
   echo "Installation of mysql is success"
fi

yum install postfix -y

if [ $? -ne 0 ]
then
   echo "Installation of postfix is failed"
   exit 1
else
   echo "Installation of postfix is success"
fi
