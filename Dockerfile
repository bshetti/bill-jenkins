from node:8

WORKDIR /

COPY package*.json ./

USER root

RUN npm install

COPY . .

EXPOSE 8080
CMD [ "node", "index.js" ]
