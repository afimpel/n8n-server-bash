# 1. Create an image to build n8n
FROM n8nio/n8n:latest
USER root
RUN addgroup -g 33 www-api
RUN addgroup node www-api
RUN apk update
RUN apk upgrade
RUN apk add --no-cache bash nano mc curl git htop coreutils 
RUN rm -rfv /var/cache/apk/*
ARG BUILD_TAG_CUSTOM
ENV TAG_CUSTOM_BUILD=$BUILD_TAG_CUSTOM
COPY make-backup.sh /usr/bin/n8n-make-backup
COPY restore-backup.sh /usr/bin/n8n-restore-backup
RUN chmod 777 /usr/bin/n8n-make-backup /usr/bin/n8n-restore-backup
RUN echo "N8N Version: $BUILD_TAG_CUSTOM / date: $(date)" > release.txt
COPY bashrc /home/node/.bashrc
RUN chown node:node /home/node/.bashrc
#ENV N8N_VERSION_BUILD=$N8N_VERSION
ENV SHELL /bin/bash
USER node
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
