#FROM node:alpine 
#FROM node:alpine as builder
FROM node:alpine
# the from builder option doesn't work!

WORKDIR /app
COPY ./package.json .

RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
#COPY build/ /usr/share/nginx/html
COPY build/ /usr/share/nginx/html
