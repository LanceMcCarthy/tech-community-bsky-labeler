FROM node:23-alpine3.19 AS base

WORKDIR /build

RUN curl -fsSL https://bun.sh/install | bash

COPY package*.json ./

RUN bun i

COPY . .

EXPOSE 4100
EXPOSE 4101

CMD ["node", "bun run start"]
