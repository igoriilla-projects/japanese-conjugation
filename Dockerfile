#build app
FROM node:18-alpine as build
WORKDIR /usr/src/app
COPY src ./src
COPY package*.json ./
RUN npm install && npm run build

#build minimal-nginx
FROM alpine:3.13
RUN apk add --update nginx && rm -rf /var/cache/apk/*
COPY .nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=build /usr/src/app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
