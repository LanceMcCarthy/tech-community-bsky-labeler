FROM node:23alpine AS base

WORKDIR /build

COPY package*.json ./

RUN curl -fsSL https://bun.sh/install | bash

RUN bun i

COPY . .

EXPOSE 4100
EXPOSE 4101

CMD ["node", "bun run start"]
