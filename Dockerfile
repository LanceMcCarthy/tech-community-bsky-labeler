FROM node:23-bookworm AS base
WORKDIR /app
EXPOSE 4100
EXPOSE 4101
RUN curl -fsSL https://bun.sh/install | bash

FROM base as build
WORKDIR /src
COPY package.json .
RUN bun i
COPY . .
CMD ["node", "bun run start"]
