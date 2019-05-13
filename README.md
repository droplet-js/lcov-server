# lcov-server

[![Build Status](https://cloud.drone.io/api/badges/v7lin/lcov-server/status.svg)](https://cloud.drone.io/v7lin/lcov-server)
[![Docker Pulls](https://img.shields.io/docker/pulls/v7lin/lcov-server.svg)](https://hub.docker.com/r/v7lin/lcov-server)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://github.com/v7lin/lcov-server/blob/master/LICENSE)

### 项目源码

[gabrielcsapo/lcov-server](https://github.com/gabrielcsapo/lcov-server)

### 用法示例

````
# 版本
version: "3.7"

# 服务
services:

  mongo:
    container_name: mongo
    image: mongo:2.6
    restart: always
    hostname: mongo
#    ports:
#      - 27017
    volumes:
      - ../dev-ops-repo/mongo:/data/db
    environment:
      - TZ=${TIME_ZONE:-Asia/Shanghai}

  lcov-server:
    container_name: lcov-server
    image: v7lin/lcov-server:1.2.6
    restart: always
    hostname: lcov-server
    ports:
      - 8080:8080
    environment:
      - TZ=${TIME_ZONE:-Asia/Shanghai}
      - COVERAGE_DB_SERVERNAME=mongo # mongo 数据库地址
      - COVERAGE_DB_PORT=27017 # mongo 数据库端口
      - COVERAGE_DB_DATABASE=coverage # mongo 数据库名
    depends_on:
      - mongo
````
