FROM node:lts-alpine as runtime

WORKDIR /app

COPY . .

RUN npm install

EXPOSE 4321

CMD npm run dev