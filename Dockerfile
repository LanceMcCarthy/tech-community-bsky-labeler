FROM node:23-bookworm AS base
EXPOSE 4100
EXPOSE 4101

WORKDIR /build
COPY . .
RUN npm install
CMD ["node", "npm run start"]
