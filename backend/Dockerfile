FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

ENV PORT=4000

ENV DB_HOST=db
ENV DB_PORT=5432
ENV DB_USER=postgres
ENV DB_PASSWORD=postgres
ENV DB_NAME=my_database

EXPOSE 4000

CMD ["node", "index.js"]
