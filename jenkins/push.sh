#!/bin/bash

sudo docker tag frontend wdennington/frontend:latest
sudo docker tag backend wdennington/backend:latest
sudo docker tag proxy wdennington/proxy:latest
sudo docker tag database wdennington/database:latest

sudo docker push wdennington/frontend:latest
sudo docker push wdennington/backend:latest
sudo docker push wdennington/proxy:latest
sudo docker push wdennington/database:latest

