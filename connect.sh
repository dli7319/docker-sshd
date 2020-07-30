#!/bin/bash

SSH_PORT=22450
PROXY_PORT=22350
IMAGE_NAME=sshd-container

ssh -L $PROXY_PORT:localhost:$PROXY_PORT root@localhost -p $SSH_PORT
