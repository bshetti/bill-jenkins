from node:8

WORKDIR /

RUN chown -R /

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8080
CMD [ "node", "index.js" ]
