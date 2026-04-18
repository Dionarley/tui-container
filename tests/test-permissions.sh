#!/usr/bin/env bash
# =============================================================================
# TUI Container - Permissions Test
# =============================================================================
# Test file permissions and ownership
# =============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

echo "=== TUI Container Permissions Test ==="

cd "$PROJECT_DIR"

# Test scripts are executable
echo "Checking run-dev.sh..."
[ -x ./run-dev.sh ] || { echo "Error: run-dev.sh not executable"; exit 1; }

echo "Checking run-kiosk.sh..."
[ -x ./run-kiosk.sh ] || { echo "Error: run-kiosk.sh not executable"; exit 1; }

echo "Checking build.sh..."
[ -x ./build.sh ] || { echo "Error: build.sh not executable"; exit 1; }

# Test directories exist
echo "Checking workspace directory..."
[ -d ./workspace ] || { echo "Error: workspace directory not found"; exit 1; }

echo "Checking config directory..."
[ -d ./config ] || { echo "Error: config directory not found"; exit 1; }

echo "Checking lib directory..."
[ -d ./lib ] || { echo "Error: lib directory not found"; exit 1; }

# Test files are readable
echo "Checking Dockerfile.dev..."
[ -r ./Dockerfile.dev ] || { echo "Error: Dockerfile.dev not readable"; exit 1; }

echo "Checking Dockerfile.kiosk..."
[ -r ./Dockerfile.kiosk ] || { echo "Error: Dockerfile.kiosk not readable"; exit 1; }

echo "Checking docker-compose.yml..."
[ -r ./docker-compose.yml ] || { echo "Error: docker-compose.yml not readable"; exit 1; }

echo "All permissions OK!"
echo "=== Permissions Test: PASSED ==="
exit 0