FROM node:23alpine AS base

WORKDIR /build

RUN curl -fsSL https://bun.sh/install | bash

COPY package*.json ./

RUN bun i

COPY . .

EXPOSE 4100
EXPOSE 4101

CMD ["node", "bun run start"]
