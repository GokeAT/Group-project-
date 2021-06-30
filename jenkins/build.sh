#!/bin/bash

docker-compose build --parallel
#docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}
docker login -u wdennington -p LongGrass