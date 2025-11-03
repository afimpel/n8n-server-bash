#!/bin/bash
TIMESTAMP=$(date +"%Y%m%d")
cd 
chmod 777 backup -Rv
cp -v backup/credentials.json restore/${TIMESTAMP}_credentials.json
cp -v backup/workflows.json restore/${TIMESTAMP}_workflows.json
docker exec -u node -it n8n-docker-caddy-n8n-1 n8n import:workflow --input=backup/workflows.json
docker exec -u node -it n8n-docker-caddy-n8n-1 n8n import:credentials --input=backup/credentials.json
chmod 777 restore -Rv
