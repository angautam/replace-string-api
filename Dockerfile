FROM node:14-slim

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8080

RUN npm install

ENV NODE_ENV production

CMD ["node", "./src/app.js"]
