#FROM node:alpine 
FROM node:alpine as builder
# the from builder option doesn't work!

WORKDIR /app
COPY ./package.json .

RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 3000
COPY ./nginx/default.comd /etc/nginx/conf.d/default.conf
#COPY build/ /usr/share/nginx/html
#COPY --from=builder /App/build/ /usr/share/nginx/html
