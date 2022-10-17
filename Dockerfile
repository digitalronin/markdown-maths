FROM node:18-alpine

RUN apk add \
  bash \
  gettext \
  tzdata \
  jq \
  make

WORKDIR /app
