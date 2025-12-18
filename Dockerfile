# 1. Create an image to build n8n
FROM n8nio/n8n:1
USER root
RUN addgroup -g 33 www-api
RUN addgroup node www-api
RUN apk update
RUN apk upgrade
RUN apk add --no-cache bash nano mc curl git htop coreutils jq bash-completion
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
ENV N8N_BLOCK_ENV_ACCESS_IN_NODE=false
ENV N8N_NODE_FUNCTION_ALLOW_BUILTIN=*
ENV N8N_COMMUNITY_PACKAGES_ALLOW_TOOL_USAGE=true
ENV N8N_SECURITY_AUDIT_DAYS_ABANDONED_WORKFLOW=360
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
