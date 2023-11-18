#!/bin/bash

# Below line is arrays
NAMES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")
INSTANCE_TYPE=""
IMAGE_ID=ami-0326a0778a880afb
SECURITY_GROUP_ID=sg-0189d4870cc65fd55

# If mysql or mongodb, instance type should be t3.medium, for all others it should be t2.micro
for i in "${NAMES[@]}" # You will get all the names in this loop 
do
   if [ [ $i == "mongodb" || $i == "mysql" ] ]
   then
      INSTANCE_TYPE="t3.medium"
   else
      INSTANCE_TYPE="t2.micro"
   fi
   #echo "Name: $i"
   echo "Creating $i instance"
   aws ec2 run-instances --image-id $IMAGE_ID --instance-type $INSTANCE_TYPE --security-group-ids $SECURITY_GROUP_ID --tag-specifications "ResourceType=instance, Tags=[{Key=Name,Value=$i}]"
done