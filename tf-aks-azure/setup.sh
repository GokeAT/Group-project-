#!/bin/bash

# Install Azure 
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Authorize Jenkins with the managed identity 
az login --identity

# kubectl installed 
sudo az aks install-cli

# credentials 
az aks get-credentials --resource-group aksdemo-rg --name aksdemo1 