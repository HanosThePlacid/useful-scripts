#!/bin/bash
CONTAINER_NAME="vulnerable-container"

if [ "$(docker ps -q -f name=$CONTAINER_NAME)" == "" ]; then
    echo "Container is not running. Restarting..."
    docker start $CONTAINER_NAME
else
    echo "Container is already running."
fi
