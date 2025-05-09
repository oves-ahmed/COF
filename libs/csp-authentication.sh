#!/bin/bash

# Defining variables for Azure login
CRED_FILE=".cof/csp-auth.yaml"

AZURE_CLIENT_ID=$(yq .auth_configs.azure.client_id $CRED_FILE)
AZURE_CLIENT_SECRET=$(yq .auth_configs.azure.client_secret $CRED_FILE)
AZURE_TENANT_ID=$(yq .auth_configs.azure.tenant_id $CRED_FILE)
SUBSCRIPTION_ID=$(yq .auth_configs.azure.subscription_id $CRED_FILE)

# Validate login
az account show

# Azure login

az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET --tenant $AZURE_TENANT_ID