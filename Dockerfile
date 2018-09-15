from node:8

WORKDIR /

COPY package.json /
COPY package-lock.json /

RUN npm install

COPY . .

EXPOSE 8080
CMD [ "node", "index.js" ]
