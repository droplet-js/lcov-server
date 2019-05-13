#!/usr/bin/env bash

./wait-for-it.sh ${COVERAGE_DB_SERVERNAME}:${COVERAGE_DB_PORT} -- echo "coverage db is up";

lcov-server --serve --db mongodb://${COVERAGE_DB_SERVERNAME}:${COVERAGE_DB_PORT}/${COVERAGE_DB_DATABASE} --parser ${COVERAGE_PARSER} --basePath ${COVERAGE_BASEPATH}