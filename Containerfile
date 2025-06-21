FROM node:lts-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM docker.io/library/nginx:alpine AS runtime
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 4321



# FROM node:lts-alpine AS build
# WORKDIR /app
# COPY package*.json ./
# RUN npm install
# COPY . .
# RUN npm run build

# FROM node:lts-alpine AS runtime
# WORKDIR /app
# COPY --from=build /app/dist ./dist
# COPY --from=build /app/package*.json ./
# RUN npm install --omit=dev
# ENV HOST=0.0.0.0 PORT=4321
# EXPOSE 4321
# CMD ["npm", "run", "preview"]



# FROM node:lts-alpine AS build
# WORKDIR /app
# COPY package*.json ./
# RUN npm install
# COPY . .
# RUN npm run build
# EXPOSE 4321
# CMD ["npm", "run", "preview"]

# -- --host 0.0.0.0
# CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0"]



# FROM docker.io/library/caddy:alpine

# RUN apk update && apk add --no-cache nodejs npm

# WORKDIR /app

# COPY package*.json ./

# RUN npm install

# COPY . .

# RUN npm run build

# RUN cp -r dist/* /srv/

# COPY ./Caddyfile /etc/caddy/Caddyfile
