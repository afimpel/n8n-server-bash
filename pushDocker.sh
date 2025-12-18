#!/bin/bash
date
echo -e "\n\t------------\t RMI\t| hostname: $(hostname) \t date: $(date) \t------------\n"
docker rmi $(docker images | grep n8n | awk '{print $1}') --force
docker container prune -f
docker image prune -f

echo -e "\n\t------------\t BUILD\t| hostname: $(hostname) \t date: $(date) \t------------\n"
docker pull n8nio/n8n:latest
CURRENT_VERSION=$(docker image inspect n8nio/n8n:latest 2>/dev/null | jq -r '.[0].Config.Labels."org.opencontainers.image.version" + "-" + .[0].Architecture')
docker build --build-arg BUILD_TAG_CUSTOM=v$CURRENT_VERSION -t afimpelcom/n8n-server-bash:v$CURRENT_VERSION -t afimpelcom/n8n-server-bash:latest -f Dockerfile . --force-rm

echo -e "\n\t------------\t PUSH\t| hostname: $(hostname) \t date: $(date) \t------------\n"
docker push afimpelcom/n8n-server-bash:v$CURRENT_VERSION
docker push afimpelcom/n8n-server-bash:latest

echo -e "\n\t------------\t END\t| hostname: $(hostname) \t date: $(date) \t------------\n"
date
