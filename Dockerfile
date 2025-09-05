FROM node:20-alpine

# Option to set the N8N version
ARG N8N_VERSION=1.72.0  # Update with the latest stable version available

RUN apk add --update graphicsmagick tzdata

USER root

RUN apk --update add --virtual build-dependencies python3 build-base && \
    npm_config_user=root npm install --location=global n8n@${N8N_VERSION} && \
    apk del build-dependencies

WORKDIR /data

EXPOSE 5678    # Default n8n port

ENV N8N_USER_ID=root

CMD ["n8n", "start"]