#!/usr/bin/env bash
# =============================================================================
# TUI Container - All Tests Runner
# =============================================================================
# Run all TDD tests
# =============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=========================================="
echo "TUI Container - Running All Tests"
echo "=========================================="
echo ""

TESTS_PASSED=0
TESTS_FAILED=0

run_test() {
    local test_name="$1"
    local test_script="$2"
    
    echo ">>> Running: $test_name"
    if [ -x "$test_script" ]; then
        if "$test_script"; then
            echo "✓ PASSED: $test_name"
            TESTS_PASSED=$((TESTS_PASSED + 1))
        else
            echo "✗ FAILED: $test_name"
            TESTS_FAILED=$((TESTS_FAILED + 1))
        fi
    else
        echo "✗ SKIPPED: $test_script not executable"
        TESTS_FAILED=$((TESTS_FAILED + 1))
    fi
    echo ""
}

# Make scripts executable
chmod +x "$SCRIPT_DIR"/test-*.sh 2>/dev/null || true

# Run tests
run_test "Tools Availability" "$SCRIPT_DIR/tools.sh"
run_test "Permissions" "$SCRIPT_DIR/permissions.sh"
run_test "Build" "$SCRIPT_DIR/build.sh"
run_test "DEV Container" "$SCRIPT_DIR/run-dev.sh"
run_test "KIOSK Container" "$SCRIPT_DIR/run-kiosk.sh"

echo "=========================================="
echo "Test Results"
echo "=========================================="
echo "Passed: $TESTS_PASSED"
echo "Failed: $TESTS_FAILED"
echo ""

if [ $TESTS_FAILED -eq 0 ]; then
    echo "=== ALL TESTS PASSED ==="
    exit 0
else
    echo "=== SOME TESTS FAILED ==="
    exit 1
fi