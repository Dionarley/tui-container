#!/usr/bin/env bash
# =============================================================================
# TUI Container - Container Screenshots Script
# =============================================================================
# Captures container states for documentation
# =============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
OUTPUT_DIR="$PROJECT_DIR/screenshots"

echo "=== TUI Container - Container Screenshots ==="

cd "$PROJECT_DIR"

mkdir -p "$OUTPUT_DIR"

HOST_UID=$(id -u)
HOST_GID=$(id -g)

# Test DEV container and capture
echo ">>> Testing DEV container..."
{
    echo "╔══════════════════════════════════════════════════════════════════╗"
    echo "║  TUI-DEV CONTAINER                                       ║"
    echo "╠══════════════════════════════════════════════════════════════════╣"
    timeout 15s docker compose run --rm -e HOST_UID="$HOST_UID" -e HOST_GID="$HOST_GID" tui-dev /bin/sh -c '
        echo "Hostname: $(hostname)"
        echo "User: $(whoami)"
        echo "Home: $HOME"
        echo "Shell: $SHELL"
        echo ""
        echo "━━━ Tools Available ━━━"
        echo "tmux: $(tmux -V)"
        echo "ranger: $(ranger --version 2>&1 | head -1)"
        echo "micro: $(micro --version 2>&1 | head -1)"
        echo "vim: $(vim --version 2>&1 | head -1)"
        echo "git: $(git --version)"
        echo "bash: $(bash --version | head -1)"
        echo ""
        echo "━━━ Disk Usage ━━━"
        df -h /
        echo ""
        echo "━━━ Memory ━━━"
        free -h
        echo ""
        echo "━━━ Processes ━━━"
        ps aux | head -10
        echo ""
        echo "✅ DEV Container: OK"
    ' 2>&1 || echo "Test failed"
    echo "╚══════════════════════════════════════════════════════════════════╝"
} > "$OUTPUT_DIR/10-dev-container.txt"

# Test KIOSK container and capture
echo ">>> Testing KIOSK container..."
{
    echo "╔══════════════════════════════════════════════════════════════════╗"
    echo "║  TUI-KIOSK CONTAINER                                      ║"
    echo "╠══════════════════════════════════════════════════════════════════╣"
    timeout 15s docker compose run --rm -e HOST_UID="$HOST_UID" -e HOST_GID="$HOST_GID" tui-kiosk /bin/sh -c '
        echo "Hostname: $(hostname)"
        echo "User: $(whoami)"
        echo "Home: $HOME"
        echo "Shell: $SHELL"
        echo ""
        echo "━━━ Tools Available ━━━"
        echo "tmux: $(tmux -V)"
        echo "ranger: $(ranger --version 2>&1 | head -1)"
        echo "micro: $(micro --version 2>&1 | head -1)"
        echo "git: $(git --version)"
        echo "bash: $(bash --version | head -1)"
        echo ""
        echo "━━━ Disk Usage ━━━"
        df -h /
        echo ""
        echo "━━━ Memory ━━━"
        free -h
        echo ""
        echo "━━━ Processes ━━━"
        ps aux | head -10
        echo ""
        echo "✅ KIOSK Container: OK"
    ' 2>&1 || echo "Test failed"
    echo "╚══════════════════════════════════════════════════════════════════╝"
} > "$OUTPUT_DIR/11-kiosk-container.txt"

# Cleanup containers
echo ">>> Cleaning up..."
docker compose down --volumes 2>/dev/null || true

echo ""
echo "=== Container Screenshots ==="
ls -la "$OUTPUT_DIR"/1*.txt
echo ""

# Display
cat "$OUTPUT_DIR/10-dev-container.txt"
echo ""
cat "$OUTPUT_DIR/11-kiosk-container.txt"