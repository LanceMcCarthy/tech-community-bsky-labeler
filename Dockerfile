FROM node:23-bullseye AS base
SHELL ["/bin/bash", "-c"]
EXPOSE 4100
EXPOSE 4101
RUN curl -fsSL https://bun.sh/install | bash
COPY . .
RUN source /root/.bashrc
RUN bun i
CMD ["source /root/.bashrc && bun run start"]
