#!/bin/bash
cd
mkdir -p backup
chmod 777 backup -Rv
echo -e "\n\t------------\t hostname: $(hostname) \t date: $(date) \t------------\n"
n8n export:workflow --all --output=backup/$(hostname)-workflows.json
n8n export:workflow --backup --output=backup/$(hostname)-workflow/
for iface in $(ls backup/$(hostname)-workflow/); do
    nameID=$(jq -r '.name + "-" + .id' backup/$(hostname)-workflow/$iface)
    mv backup/$(hostname)-workflow/$iface backup/$(hostname)-workflow/${nameID/// /-}.json
done

echo -e "\n\t------------\t hostname: $(hostname) \t date: $(date) \t------------\n"
n8n export:credentials --all --decrypted --output=backup/$(hostname)-credentials.json
n8n export:credentials --backup --decrypted --output=backup/$(hostname)-credential/
for iface in $(ls backup/$(hostname)-credential/); do
    nameID=$(jq -r '.name + "-" + .id' backup/$(hostname)-credential/$iface)
    mv backup/$(hostname)-credential/$iface backup/$(hostname)-credential/${nameID/// /-}.json
done

echo -e "\n\t------------\t hostname: $(hostname) \t date: $(date) \t------------\n"
chmod 777 backup -Rv
