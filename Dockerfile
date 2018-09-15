from node:8

COPY package.json .
COPY package-lock.json .

RUN npm install

COPY . .

EXPOSE 8080
CMD [ "node", "index.js" ]
