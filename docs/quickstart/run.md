# Run

## Run Commands

### DEV Mode

```bash
./run-dev.sh
```

### KIOSK Mode

```bash
./run-kiosk.sh
```

## Container Access

```bash
# DEV
HOST_UID=$(id -u) HOST_GID=$(id -g) docker compose run --rm tui-dev

# KIOSK
HOST_UID=$(id -u) HOST_GID=$(id -g) docker compose run --rm tui-kiosk
```

## Stop Containers

```bash
docker compose down
```