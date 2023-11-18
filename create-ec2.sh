#!/bin/bash

# Below line is arrays
NAMES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")

for i in "${NAMES[@]}" # You will get all the names in this loop 
do
   echo "Name: $i"
done