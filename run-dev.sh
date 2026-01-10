#!/usr/bin/env bash
set -e

HOST_UID=$(id -u)
HOST_GID=$(id -g)

HOST_UID=$HOST_UID HOST_GID=$HOST_GID \
docker compose run --rm tui-dev

