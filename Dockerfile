FROM node:10.16-alpine

RUN apk update \
    && apk add --no-cache bash git openssh

RUN apk add --update python krb5 krb5-libs gcc make g++ krb5-dev

WORKDIR /usr/src/hash-storage

COPY package*.json /usr/src/hash-storage/
RUN npm install

COPY . /usr/src/hash-storage

EXPOSE 5000
CMD [ "npm", "start" ]

