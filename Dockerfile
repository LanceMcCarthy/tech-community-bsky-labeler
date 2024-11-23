FROM node:23-bookworm AS base
EXPOSE 4100
EXPOSE 4101

WORKDIR /build
COPY . .
RUN npm install
CMD ["/bin/sh", "npx tsx src/main.ts"]
