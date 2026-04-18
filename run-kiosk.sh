#!/usr/bin/env bash
# =============================================================================
# TUI Container - KIOSK Mode Launcher
# =============================================================================

set -e

# Load shared functions
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"

# Check dependencies
check_docker

# Run kiosk container
exec_docker_compose run --rm tui-kiosk