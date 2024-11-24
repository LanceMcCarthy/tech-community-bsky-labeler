FROM oven/bun:1 AS base
WORKDIR /usr/src/app
EXPOSE 4100
EXPOSE 4101

FROM base AS install
RUN mkdir -p /temp/prod
COPY package.json bun.lockb /temp/prod/
RUN cd /temp/prod && bun install --production

# copy production dependencies and source code into final image
FROM base AS release
COPY --from=install /temp/prod/node_modules node_modules
COPY . .

# run the app
USER bun
CMD ["bun", "run", "start"]
#ENTRYPOINT [ "npx", "tsx", "src/main.ts" ]

# FROM oven/bun:1 AS base
# WORKDIR /usr/src/app

# FROM base AS install
# RUN mkdir -p /temp/dev
# COPY package.json bun.lockb /temp/dev/
# RUN cd /temp/dev && bun install --frozen-lockfile

# # install with --production (exclude devDependencies)
# RUN mkdir -p /temp/prod
# COPY package.json bun.lockb /temp/prod/
# RUN cd /temp/prod && bun install --frozen-lockfile --production

# # copy node_modules from temp directory
# # then copy all (non-ignored) project files into the image
# FROM base AS prerelease
# COPY --from=install /temp/dev/node_modules node_modules
# COPY . .

# # copy production dependencies and source code into final image
# FROM base AS release
# COPY --from=install /temp/prod/node_modules node_modules
# COPY --from=prerelease /usr/src/app/src/config.ts .
# COPY --from=prerelease /usr/src/app/src/constants.ts .
# COPY --from=prerelease /usr/src/app/src/label.ts .
# COPY --from=prerelease /usr/src/app/src/logger.ts .
# COPY --from=prerelease /usr/src/app/src/main.ts .
# COPY --from=prerelease /usr/src/app/src/metrics.ts .
# COPY --from=prerelease /usr/src/app/src/set-labels.ts .
# COPY --from=prerelease /usr/src/app/src/set-posts.ts .
# COPY --from=prerelease /usr/src/app/src/types.ts .
# COPY --from=prerelease /usr/src/app/package.json .

# # run the app
# USER bun
# EXPOSE 4100
# EXPOSE 4101
# ENTRYPOINT [ "bun", "run", "src/main.ts" ]
#CMD ["bun", "run", "start"]

# FROM oven/bun:1 AS base
# WORKDIR /usr/src/app
# EXPOSE 4100
# EXPOSE 4101

# FROM base AS install
# RUN mkdir -p /temp/prod
# COPY package.json bun.lockb /temp/prod/
# RUN cd /temp/prod && bun install --frozen-lockfile --production

# # copy production dependencies and source code into final image
# FROM base AS release
# COPY --from=install /temp/prod/node_modules node_modules
# COPY . .

# # run the app
# USER bun
# CMD ["bun", "run", "start"]
