#!/bin/bash

# Below is the directory where you should search for .log extensions and then delete
APP_LOGS_DIR=/home/centos/app-logs
DATE=$(date +%F-%H-%M-%S) # This will print the date in proper format
LOGSDIR=/home/centos/shellscript-logs # This is the location where you will be storing all the shell script log files
# inside /home/centos/shellscript-logs/script-name-date.log
SCRIPT_NAME=$0 # This will print the script name
LOGFILE=$LOGSDIR/$SCRIPT_NAME-$DATE.log # Storing log files here

FILES_TO_DELETE=$(find $APP_LOGS_DIR -name "*.log" -type f -mtime +14)
#echo "$FILES_TO_DELETE"
echo "script started executing at $DATE" &>>$LOGFILE

# Reading each .log file 
while read line
do
  echo "Deleting $line" &>>$LOGFILE
  rm -rf $line
done <<< $FILES_TO_DELETE