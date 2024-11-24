FROM oven/bun:1 AS base
WORKDIR /usr/src/app
EXPOSE 4100/tcp
EXPOSE 4101/tcp

# install dependencies into temp directory
# this will cache them and speed up future builds
FROM base AS install
RUN mkdir -p /temp/dev
COPY package.json bun.lockb /temp/dev/
RUN cd /temp/dev && bun install --frozen-lockfile

# install with --production (exclude devDependencies)
RUN mkdir -p /temp/prod
COPY package.json bun.lockb /temp/prod/
RUN cd /temp/prod && bun install --frozen-lockfile --production

# copy node_modules from temp directory
# then copy all (non-ignored) project files into the image
FROM base AS prerelease
COPY --from=install /temp/dev/node_modules node_modules
COPY . .
RUN ls -a

# [optional] tests & build
ENV NODE_ENV=production
# RUN bun run build

# copy production dependencies and source code into final image
FROM base AS release
COPY --from=prerelease . .

# run the app
# USER bun
# ENTRYPOINT [ "bun", "run", "index.ts" ]

CMD ["npx tsx src/main.ts"]
