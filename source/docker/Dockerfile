FROM node:14.11.0-alpine3.12 as node
FROM ruby:2.7.1-alpine3.12 as build-base

COPY --from=node /usr/local/bin/node /usr/local/bin/
COPY --from=node /opt/yarn-v1.22.5 /opt/yarn-v1.22.5

RUN ln -s /usr/local/bin/node /usr/local/bin/nodejs
RUN ln -s /opt/yarn-v1.22.5/bin/yarn /usr/local/bin/yarn
RUN ln -s /opt/yarn-v1.22.5/bin/yarnpkg /usr/local/bin/yarnpkg

RUN apk update && apk add --no-cache git postgresql-dev tzdata make g++

RUN mkdir -p /app
WORKDIR /app

RUN gem update --system
RUN gem install bundler:2.1.4

RUN bundle config --global jobs $(nproc --all)

COPY . ./
RUN bundle install
RUN yarn install
