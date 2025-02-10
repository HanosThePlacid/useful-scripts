#!/bin/bash
echo "Listing all running Docker containers..."
docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}"

echo "Following logs of all running containers..."
docker logs -f $(docker ps -q)
