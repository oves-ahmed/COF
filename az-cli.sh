#!/bin/bash

# validate azure cli is already installed 

command -v az 

return_id=$?


if [[ ${return_id} -ne 0 ]]; then
 echo "INFO: installing azure cli..."
 
 sudo apt-get update -y > /dev/null 2>&1
 sudo apt-get install curl -y > /dev/null 2>&1

# Download installation script

sudo mkdir /opt/scripts
sudo chmod 777 /opt/scripts

curl -sL https://aka.ms/InstallAzureCLIDeb > /opt/scripts/install-az.sh
chmod +x /opt/scripts/install-az.sh

/opt/scripts/install-az.sh > /dev/null

# Post installation check

if command -v az > /dev/null; then
    echo "INFO: Az cli successfully installed."
  else
    echo "ERROR: Az cli installation failed."
    exit 1
  fi

else
echo "INFO: Azure cli already installed"
fi





