#!/usr/bin/env bash

set -eu

HOST_WORKSPACE=${1:-$PWD}
CONTAINER_WORKSPACE=/root/workspace

docker run \
  --interactive \
  --tty \
  --rm \
  --env 'MAVEN_OPTS=-Xmx2g -XX:ReservedCodeCacheSize=512m' \
  --volume "${HOST_WORKSPACE}:${CONTAINER_WORKSPACE}" \
  --workdir  "${CONTAINER_WORKSPACE}" \
  "maven:3.6.3-jdk-8" \
  bash
