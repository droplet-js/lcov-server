# --- download ---

FROM alpine:3.9.3 as download

ENV LCOV_SERVER_VERSION 1.2.6

RUN wget https://github.com/gabrielcsapo/lcov-server/archive/${LCOV_SERVER_VERSION}.tar.gz
RUN tar xzf ${LCOV_SERVER_VERSION}.tar.gz
RUN mv lcov-server-${LCOV_SERVER_VERSION} lcov-server

# --- wait ---

FROM docker:git as wait

# RUN git clone -b master https://github.com/vishnubob/wait-for-it.git wait-for-it

# --- prod ---

FROM node:7.6-alpine as prod

MAINTAINER v7lin <v7lin@qq.com>

RUN apk add --no-cache bash

COPY --from=download /lcov-server /lcov-server
COPY --from=wait /wait-for-it/wait-for-it.sh /lcov-server
COPY entrypoint.sh /lcov-server

WORKDIR /lcov-server

RUN npm install lcov-server -g

EXPOSE 8080

ENTRYPOINT ["./entrypoint.sh"]