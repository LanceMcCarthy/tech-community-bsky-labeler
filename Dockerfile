FROM node:23-bullseye AS base
SHELL ["/bin/bash", "-c"]
EXPOSE 4100
EXPOSE 4101
RUN curl -fsSL https://bun.sh/install | bash
RUN source /home/lance/.bashrc
COPY package.json .
RUN bun i
COPY . .
CMD ["node", "bun run start"]
