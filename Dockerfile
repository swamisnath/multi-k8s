FROM ruby:2.3
WORKDIR /app
COPY . .
#COPY varada-k8s-c78593d8cf60.json .
#COPY build/ /usr/share/nginx/html
#COPY --from=builder /App/build/ /usr/share/nginx/html
