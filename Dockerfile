# 1. Create an image to build n8n
FROM n8nio/n8n:latest
USER root
RUN addgroup -g 33 www-api
RUN addgroup node www-api
RUN apk update
RUN apk upgrade
RUN apk add --no-cache bash nano mc curl git htop
RUN rm -rfv /var/cache/apk/*
ARG BUILD_TAG_CUSTOM
ENV TAG_CUSTOM_BUILD=$BUILD_TAG_CUSTOM
#ENV N8N_VERSION_BUILD=$N8N_VERSION
ENV SHELL /bin/bash
USER node
COPY bashrc .bashrc
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
