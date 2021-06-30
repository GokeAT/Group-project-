#!/bin/bash

sudo docker-compose build --parallel
#docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}
sudo docker login -u wdennington -p LongGrass