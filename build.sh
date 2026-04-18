#!/usr/bin/env bash
# =============================================================================
# TUI Container - Build Script
# =============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"

check_docker

usage() {
    echo "Usage: $0 [dev|kiosk|all]"
    echo "  dev    - Build dev container"
    echo " kiosk  - Build kiosk container"
    echo " all    - Build all containers (default)"
    exit 1
}

case "${1:-all}" in
    dev)
        echo "Building tui-dev..."
        build_service tui-dev
        ;;
    kiosk)
        echo "Building tui-kiosk..."
        build_service tui-kiosk
        ;;
    all)
        echo "Building all containers..."
        docker compose build
        ;;
    *)
        usage
        ;;
esac

echo "Build complete!"