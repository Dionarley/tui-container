# Build

## Build Commands

### Build All

```bash
./build.sh
```

### Build Specific

```bash
# DEV only
./build.sh dev

# KIOSK only
./build.sh kiosk
```

### Docker Compose

```bash
docker compose build
docker compose build tui-dev
docker compose build tui-kiosk
```

## Output

```
Image tui-dev:latest Built
Image tui-kiosk:latest Built
```

## Next Steps

- [Run](run.md)