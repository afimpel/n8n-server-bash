#!/bin/bash
cd
mkdir -p backup
chmod 777 backup -Rv
echo -e "\n\t------------\t EXPORT\t| hostname: $(hostname) \t date: $(date) \t------------\n"

n8n export:workflow --all --output=backup/$(hostname)-workflows.json
n8n export:workflow --backup --output=backup/$(hostname)-workflow/

echo -e "\n\t------------\t RENAME\t| hostname: $(hostname) \t date: $(date) \t------------\n"
for iface in $(ls backup/$(hostname)-workflow/); do
    nameID=$(jq -r '.name + "-" + .id' backup/$(hostname)-workflow/$iface | sed 's/ /-/g')
    echo -e "\t-\t Processing workflow file: ${iface}.json to ${nameID}.json"
    mv backup/$(hostname)-workflow/$iface backup/$(hostname)-workflow/${nameID}.json
done

echo -e "\n\t------------\t EXPORT\t| hostname: $(hostname) \t date: $(date) \t------------\n"

n8n export:credentials --all --decrypted --output=backup/$(hostname)-credentials.json
n8n export:credentials --backup --decrypted --output=backup/$(hostname)-credential/

echo -e "\n\t------------\t RENAME\t| hostname: $(hostname) \t date: $(date) \t------------\n"
for iface in $(ls backup/$(hostname)-credential/); do
    nameID=$(jq -r '.name + "-" + .id' backup/$(hostname)-credential/$iface | sed 's/ /-/g')
    echo -e "\t-\t Processing credential file: ${iface}.json to ${nameID}.json"
    mv backup/$(hostname)-credential/$iface backup/$(hostname)-credential/${nameID}.json
done

echo -e "\n\t------------\t END\t| hostname: $(hostname) \t date: $(date) \t------------\n"
chmod 777 backup -Rv
