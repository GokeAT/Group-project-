#!/bin/bash

sed -e 's,{{MYSQL_ROOT_PASSWORD}},'$MYSQL_ROOT_PASSWORD',g;' secret.yaml | kubectl apply -f -