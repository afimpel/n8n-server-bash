#!/bin/bash
date
cd
mkdir -p backup
chmod 777 backup -Rv
n8n export:workflow --all --output=backup/$(hostname)-workflows.json
n8n export:workflow --backup --output=backup/$(hostname)-workflow/
n8n export:credentials --all --decrypted --output=backup/$(hostname)-credentials.json
n8n export:credentials --backup --decrypted --output=backup/$(hostname)-credential/
chmod 777 backup -Rv
