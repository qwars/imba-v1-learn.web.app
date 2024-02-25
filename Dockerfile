
FROM node:18-alpine

EXPOSE 9090

WORKDIR /usr/src/application

COPY package.json ./

RUN yarn install


