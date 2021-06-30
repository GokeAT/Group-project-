#!/bin/bash

docker tag frontend wdennington/frontend:latest
docker tag backend wdennington/backend:latest
docker tag proxy wdennington/proxy:latest
docker tag database wdennington/database:latest

docker push wdennington/frontend:latest
docker push wdennington/backend:latest
docker push wdennington/proxy:latest
docker push wdennington/database:latest

