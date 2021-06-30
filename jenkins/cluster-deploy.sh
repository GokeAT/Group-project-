#!/bin/bash

cd /terraform

terraform init 
terraform plan
terraform apply

cd ..

az aks get-credentials --resource-group groupproject-rg --name groupproject_cluster 