# syntax=docker/dockerfile:1
ARG NODE_VERSION=18.0.0

FROM node:${NODE_VERSION}-alpine

ENV NODE_ENV production

WORKDIR /app
RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=cache,target=/root/.npm \
    npm install

USER node
COPY . /app
EXPOSE 3000
CMD node main.js

