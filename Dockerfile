from node:8

WORKDIR /

USER root

RUN chown -R /

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8080
CMD [ "node", "index.js" ]
