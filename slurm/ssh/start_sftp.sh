#!/bin/bash

LOCAL_PORT=5981
REMOTE_PORT=22350
REMOTE_SSH_PORT=22450
REMOTE_ADDR=$(echo "$SSH_CONNECTION" | awk '{print $1}')
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

/usr/sbin/sshd -D -f "$DIR"/sshd_config & \
ssh -R "0.0.0.0:$REMOTE_PORT:localhost:$LOCAL_PORT" "root@$REMOTE_ADDR" -p "$REMOTE_SSH_PORT"
