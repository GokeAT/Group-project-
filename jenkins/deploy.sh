#!/bin/bash 

kubectl apply -f k8s/nginx.yaml
kubectl apply -f k8s/frontend.yaml
kubectl apply -f k8s/backend.yaml
#sed -e 's,{{MYSQL_ROOT_PASSWORD}},'$MYSQL_ROOT_PASSWORD',g;' secret.yaml | kubectl apply -f -
sed -e "s,{{MYSQL_ROOT_PASSWORD}},'petclinic',g;" secret.yaml | kubectl apply -f -
kubectl apply -f k8s/database.yaml