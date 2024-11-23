FROM node:23-bookworm AS base
EXPOSE 4100
EXPOSE 4101

WORKDIR /build
RUN curl -fsSL https://bun.sh/install | bash
COPY . .
RUN ~/.bun/bin/bun i
CMD ["node", "~/.bun/bin/bun run start"]
