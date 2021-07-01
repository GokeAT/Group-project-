#!/bin/bash

sudo apt  install jq

# #login and follow prompts
az login

export TENANT_ID="$(az account show | jq -r '.tenantId')"

# view and select your subscription account

az account list -o table

export SUBSCRIPTION="$(az account show -o json | jq -r '.id')"

echo "SETTING ACCOUNT"
az account set --subscription ${serviceprincipalsubscription}


#creating service principal

SERVICE_PRINCIPAL_JSON="$(az ad sp create-for-rbac --skip-assignment --name petstore_service_principal -o json)"

export SERVICE_PRINCIPAL="$(echo $SERVICE_PRINCIPAL_JSON | jq -r '.appId')"
export SERVICE_PRINCIPAL_SECRET="$(echo $SERVICE_PRINCIPAL_JSON | jq -r '.password')"

# Grant contributor role over the subscription to our service principal

echo "SETTING ROLE ASSIGNMENT"
az role assignment create --assignee ${serviceprincipalclientid} \
--scope "/subscriptions/${serviceprincipalsubscription}" \
--role Contributor


echo "CDing into terraform folder"
cd ~

#terraform
terraform init

terraform plan -out plan.out -var serviceprinciple_id=${serviceprincipalclientid} \
    -var serviceprinciple_key="${serviceprincipalpassword}" \
    -var tenant_id=${serviceprincipaltenant} \
    -var subscription_id=${serviceprincipalsubscription} \

terraform apply plan.out

$ terraform output kube_config | grep -i -v -E '<<EOT|EOT' > ~/.kube/aksconfig
$ export KUBECONFIG=~/.kube/aksconfig


Test configuration using kubectl

$ kubectl get nodes

#cd into the yaml folders
cd ${workspace}
echo $(pwd)
echo $(ls -a)


az aks get-credentials --resource-group" rg" --name "cluster name" --overwrite-existing

kubectl apply -f nginx.yaml
kubectl apply -f frontend.yaml
kubectl apply -f backend.yaml

sed -e 's,{{MYSQL_ROOT_PASSWORD}},'$MYSQL_ROOT_PASSWORD',g;' secrets.yaml | kubectl apply -f -
kubectl apply -f sql.yaml