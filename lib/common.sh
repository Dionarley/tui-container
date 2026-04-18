#!/usr/bin/env bash
# =============================================================================
# Common functions for TUI Container scripts
# =============================================================================

# Check if docker and docker compose are available
check_docker() {
    command -v docker >/dev/null 2>&1 || {
        echo "Error: docker is required but not installed" >&2
        exit 1
    }
    command -v docker compose >/dev/null 2>&1 || {
        echo "Error: docker compose is required but not installed" >&2
        exit 1
    }
}

# Run docker compose with host UID/GID
exec_docker_compose() {
    HOST_UID=$(id -u)
    HOST_GID=$(id -g)
    HOST_UID="$HOST_UID" HOST_GID="$HOST_GID" docker compose "$@"
}

# Build specific service
build_service() {
    local service="$1"
    HOST_UID=$(id -u)
    HOST_GID=$(id -g)
    HOST_UID="$HOST_UID" HOST_GID="$HOST_GID" docker compose build "$service"
}

# Pull service image
pull_service() {
    local service="$1"
    docker compose pull "$service"
}

# Down services
down_services() {
    docker compose down --volumes --remove-orphans
}