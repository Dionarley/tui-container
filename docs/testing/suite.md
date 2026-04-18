# Test Suite

## Run Tests

### All Tests

```bash
bash tests/test-all.sh
```

### Individual Tests

```bash
bash tests/test-tools.sh        # Host tools
bash tests/test-permissions.sh # File permissions
bash tests/test-build.sh     # Docker build
bash tests/test-run-dev.sh # DEV container
bash tests/test-run-kiosk.sh # KIOSK container
```

## Test Results

```
| Test         | Status    | Duration |
|--------------|-----------|----------|
| Tools        | ✅ PASSED | -        |
| Permissions | ✅ PASSED | -        |
| Build       | ✅ PASSED | ~30s     |
| Run DEV     | ✅ PASSED | ~10s     |
| Run KIOSK   | ✅ PASSED | ~10s     |
```