#!/bin/bash

# This is called array, instead of single value it can hold multiple values
PERSONS=("Ramesh" "Suresh" "Sachin")

# Inside array we always refer values with index and index starts from zero
echo "First Person is: ${PERSONS[0]}"