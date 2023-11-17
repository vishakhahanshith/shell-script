#!/bin/bash

# For every script we should have colours, validations and log redirections

LOGFILE_DIRECTORY=/tmp
DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=$LOGFILE_DIRECTORY/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesystem')
DISK_USAGE_THRESHOLD=1
message=""

# IFS - Internal Field Separator -- In the below line IFS is space 
while IFS= read line
do
  # This command will give usage in number format for comparison
  usage=$(echo $line | awk '{print $6}' | cut -d % -f1)
  # The below command will give us partition
  partition=$(echo $line | awk '{print $1}')
  # Now you need to check whether it is more than threshold or not
  if [ $usage -gt $DISK_USAGE_THRESHOLD ]
  then
      # + means add to the existing message i.e., append, \n means new line
      message+="HIGH DISK USAGE on $partition: $usage \n"
  fi
done <<< $DISK_USAGE
echo -e "message: $message"

# echo "$message" | mail -s "High Disk Usage" info@joindevops.com # sends an email

# How to call other shell scripts from your current script
sh mail.sh info@joindevops.com "High Disk Usage" "$message" "DEVOPS TEAM" "High Disk Usage"