#!/bin/bash
date
echo "RMI --------------------------------"
docker rmi $(docker images | grep n8n | awk '{print $3}') --force
docker container prune -f
docker image prune -f

echo "BUILD ------------------------------"
docker pull docker.n8n.io/n8nio/n8n:latest  
timestamp=$(date "+%Y%m%d")
docker build --build-arg BUILD_TAG_CUSTOM=v$timestamp -t afimpelcom/n8n-server-bash:v$timestamp -t afimpelcom/n8n-server-bash:latest -f Dockerfile . --force-rm

echo "PUSH -------------------------------"
docker push afimpelcom/n8n-server-bash:v$timestamp
docker push afimpelcom/n8n-server-bash:latest

echo "------------------------------------"
date
