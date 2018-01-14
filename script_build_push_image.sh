#!/usr/bin/env bash

export DOCKER_ID_USER=$DOCKER_USER
docker login --username=$DOCKER_USER --password=$DOCKER_PASSWORD
docker build . -t $DOCKER_ID_USER/recvotes
docker push $DOCKER_ID_USER/recvotes
