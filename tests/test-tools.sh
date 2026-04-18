#!/usr/bin/env bash
# =============================================================================
# TUI Container - Tools Availability Test
# =============================================================================
# Test that required tools are available on host
# =============================================================================

set -e

echo "=== TUI Container Tools Test ==="

echo "Checking docker..."
command -v docker >/dev/null 2>&1 || { echo "Error: docker not found"; exit 1; }
docker --version

echo "Checking docker compose..."
command -v docker compose >/dev/null 2>&1 || { echo "Error: docker compose not found"; exit 1; }
docker compose version

echo "Checking bash..."
command -v bash >/dev/null 2>&1 || { echo "Error: bash not found"; exit 1; }
bash --version

echo "Checking chmod..."
command -v chmod >/dev/null 2>&1 || { echo "Error: chmod not found"; exit 1; }

echo "Checking id..."
command -v id >/dev/null 2>&1 || { echo "Error: id not found"; exit 1; }

echo "All required tools available!"
echo "=== Tools Test: PASSED ==="
exit 0