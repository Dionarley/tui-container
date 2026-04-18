#!/usr/bin/env bash
# =============================================================================
# TUI Container - KIOSK Container Test
# =============================================================================
# Test that KIOSK container runs and tools are available
# =============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

echo "=== TUI Container KIOSK Test ==="

cd "$PROJECT_DIR"

HOST_UID=$(id -u)
HOST_GID=$(id -g)

# Test KIOSK container starts
echo "Testing tui-kiosk startup..."
timeout 30s docker compose run --rm -e HOST_UID="$HOST_UID" -e HOST_GID="$HOST_GID" tui-kiosk /bin/sh -c '
    echo "Testing tmux..."
    tmux -V
    
    echo "Testing ranger..."
    ranger --version
    
    echo "Testing micro..."
    micro --version
    
    echo "Testing git..."
    git --version
    
    echo "Testing bash..."
    bash --version
    
    echo "All tools available!"
    exit 0
'

if [ $? -eq 0 ]; then
    echo "=== KIOSK Container Test: PASSED ==="
    exit 0
else
    echo "=== KIOSK Container Test: FAILED ==="
    exit 1
fi