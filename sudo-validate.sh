#!/bin/bash

############################################################################################
# Name: Sudo validate
# Author: Aves Ahmed
# Version: 0.1
############################################################################################




# Define a varaible to store the value of command id -u
USER_ID=$(id -u)

if [ $USER_ID -eq 0 ]; then
echo "Script ran with sudo permission"
else
echo "Script ran with non-sudo"
fi

 