FROM node:23-bookworm AS base
EXPOSE 4100
EXPOSE 4101

COPY package.json .
RUN npm install
COPY . .
CMD ["npx tsx src/main.ts"]
