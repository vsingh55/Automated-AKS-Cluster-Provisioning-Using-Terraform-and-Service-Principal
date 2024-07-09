#!/bin/bash

# Declare variable names
RESOURCE_GROUP_NAME=backend-rg
STORAGE_ACCOUNT_BASE_NAME=backendsa4tf
RANDOM_STRING=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 5 | head -n 1)
STORAGE_ACCOUNT_NAME="${STORAGE_ACCOUNT_BASE_NAME}${RANDOM_STRING}"
CONTAINER_NAME=tfstate

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location centralindia

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME

echo "Storage Account Name: $STORAGE_ACCOUNT_NAME"
