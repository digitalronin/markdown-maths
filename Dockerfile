FROM node:18-alpine

RUN apk add \
  bash \
  gettext \
  tzdata \
  jq \
  make

WORKDIR /app

COPY package.json package-lock.json /app/

RUN npm install

