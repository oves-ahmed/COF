#!/bin/bash

if command -v shellcheck > /dev/null; then
    SHELL_CHECK_BINARY=$(command -v shellcheck)
else
    SHELL_CHECK_VERSION="shellcheck-v0.10.0"
    SHELL_CHECK_BINARY="/tmp/${SHELL_CHECK_VERSION}/shellcheck"

    if [[ ! -f $SHELL_CHECK_BINARY ]]; then
       wget -q https://github.com/koalaman/shellcheck/releases/download/v0.10.0/${SHELL_CHECK_VERSION}.linux.x86_64.tar.xz -O /tmp/${SHELL_CHECK_VERSION}.tar.xz
       tar -xvf /tmp/${SHELL_CHECK_VERSION}.tar.xz -C /tmp > /dev/null
       rm -rf /tmp/${SHELL_CHECK_VERSION}.tar.xz
    fi
fi

SHELL_FILES=$(git diff --cached --name-only | grep -E '\.sh$')

if [[ -n "${SHELL_FILES}" ]]; then
  $SHELL_CHECK_BINARY $(echo $SHELL_FILES) --sevirity=warning 

    if [[ $? -ne 0 ]]; then
        echo "Shellcheck failed. Please fix the issues before committing."
        exit 1
    fi
fi
