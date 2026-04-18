#!/usr/bin/env bash
# =============================================================================
# TUI Container - Build Test
# =============================================================================
# Test that Dockerfiles build successfully
# =============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

echo "=== TUI Container Build Test ==="

# Change to project directory
cd "$PROJECT_DIR"

echo "Building tui-dev..."
docker compose build tui-dev

echo "Building tui-kiosk..."
docker compose build tui-kiosk

echo "=== Build Tests: PASSED ==="
exit 0