#!/bin/bash

DETECT_SECRETS=$(command -v detect-secrets)

if [ -z "$DETECT_SECRETS" ]; then
  sudo apt install python3 python3-pip -y > /dev/null

  pip install detect-secrets

  if command -v detect-secrets > /dev/null; then
    DETECT_SECRETS=$(command -v detect-secrets)
  else
    echo PATH=$PATH:~/local/bin >> ~/.bashrc

    DETECT_SECRETS=~/.local/bin/detect-secrets
    fi
fi


if [[ $($DETECT_SECRETS scan --exclude-files README.md) ]]; then
  echo -e "\n==========================================="
  echo "ERROR: Sensitive information found in the codebase."
  echo -e "===============================================\n."
  

  ${DETECT_SECRETS} scan --exclude-files README.md | jq -r '.results | .[]'
    exit 1
fi