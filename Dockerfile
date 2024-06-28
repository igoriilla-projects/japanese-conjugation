FROM node:18-alpine
WORKDIR /usr/src/app
COPY src ./src
COPY package*.json ./
EXPOSE 1234
RUN npm install 
ENTRYPOINT [ "npm", "run", "dev"]
