# 1. Create an image to build n8n
FROM --platform=linux/amd64 docker.n8n.io/n8nio/n8n
USER root
RUN apk update
RUN apk upgrade
RUN apk add --no-cache bash nano mc curl git htop
RUN rm -rfv /var/cache/apk/*
ARG BUILD_TAG_CUSTOM
ENV TAG_CUSTOM_BUILD=$BUILD_TAG_CUSTOM
ENV N8N_VERSION_BUILD=$N8N_VERSION
ENV SHELL /bin/bash
USER node
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
