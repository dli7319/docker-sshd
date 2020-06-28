#!/bin/bash

SSH_PORT=22450
PROXY_PORT=22350
IMAGE_NAME=sshd-container

docker build -t $IMAGE_NAME .
docker run -d \
           -p $SSH_PORT:22 \
           -p $PROXY_PORT \
           -v "/$(pwd)/.ssh:/root/.ssh" \
           $IMAGE_NAME
# ssh -L $PROXY_PORT:localhost:$PROXY_PORT root@localhost -p $SSH_PORT
