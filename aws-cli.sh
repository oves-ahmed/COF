#!/bin/bash

# Validate aws cli is already installed
command -v aws > /dev/null

return_id="$?"

if [[ ${return_id} -ne 0 ]]; then 
 echo "INFO: AWS CLI not installed, installing AWS CLI..."


# Install pre-requisites

sudo apt-get update -y > /dev/null
sudo apt-get install curl zip -y > /dev/null

# Download AWS CLI package

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"

# unzil package

unzip /tmp/awscliv2.zip -d /opt > /dev/null

# Delete zip file
rm /tmp/awscliv2.zip

# sudo ./aws/install
sudo /opt/aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli

if command -v aws > /dev/null; then 
 echo "INFO: AWS cli installed"
else
 echo "WARN: AWS CLI already installed"
 exit 1
fi
fi