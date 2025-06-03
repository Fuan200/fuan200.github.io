# FROM node:lts-alpine AS build
# WORKDIR /app
# COPY package*.json ./
# RUN npm install
# COPY . .
# CMD npm run dev -- --host 0.0.0.0

FROM docker.io/library/caddy:alpine

RUN apk update && apk add --no-cache nodejs npm

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

RUN cp -r dist/* /srv/

COPY ./Caddyfile /etc/caddy/Caddyfile
