# AGENTS.md - Agentic Coding Guidelines

This file provides guidelines for coding agents operating in this repository.

---

## Overview

This is a Docker-based TUI container project using Alpine Linux, tmux, ranger, and micro. It consists of:
- Dockerfiles (DEV and KIOSK modes)
- Shell scripts for running containers
- Configuration files (tmux, ranger, micro)
- Docker Compose definitions

Two operating modes:
- **DEV**: Development environment with sudo, vim, editable workspace
- **KIOSK**: Immutable appliance-style environment, no sudo, fixed layout

---

## Build Commands

### Build all containers
```bash
docker compose build
```

### Build specific mode
```bash
docker compose build tui-dev
docker compose build tui-kiosk
```

### Run containers
```bash
./run-dev.sh
./run-kiosk.sh
```

### Run with Docker Compose directly
```bash
HOST_UID=$(id -u) HOST_GID=$(id -g) docker compose run --rm tui-dev
HOST_UID=$(id -u) HOST_GID=$(id -g) docker compose run --rm tui-kiosk
```

### Single container test/debug
```bash
# Quick dev container test
HOST_UID=$(id -u) HOST_GID=$(id -g) docker compose run --rm tui-dev /bin/sh

# Quick kiosk container test  
HOST_UID=$(id -u) HOST_GID=$(id -g) docker compose run --rm tui-kiosk /bin/sh

# Test specific command in container
HOST_UID=$(id -u) HOST_GID=$(id -g) docker compose run --rm tui-dev <command>
```

### Remove containers
```bash
docker compose down
```

---

## Code Style Guidelines

### Shell Scripts

**File header**: Use `#!/usr/bin/env bash` with `set -e` for error handling.

```bash
#!/usr/bin/env bash
set -e
```

**Variable naming**: Use lowercase with underscores, e.g., `host_uid`, `host_gid`.

**Always quote variables** when using them in commands:
```bash
HOST_UID=$HOST_UID HOST_GID=$HOST_GID docker compose run --rm tui-dev
```

**Use command substitution** with `$(...)` not backticks:
```bash
HOST_UID=$(id -u)
HOST_GID=$(id -g)
```

---

### Dockerfiles

**Base image**: Alpine Linux 3.19
```dockerfile
FROM alpine:3.19
```

**Package installation**: Use `--no-cache` to reduce image size:
```dockerfile
RUN apk update && apk add --no-cache \
    bash \
    tmux \
    ...
```

**Multi-line commands**: Use backslash for continuation with proper indentation.

**User creation**: Create non-root users with specific UIDs:
```dockerfile
RUN addgroup -g 1000 dev && \
    adduser -D -u 1000 -G dev dev
```

**Copy configs** after setting user and workdir.

**Environment variables**: Set TERM and SHELL:
```dockerfile
ENV TERM=xterm-256color
ENV SHELL=/bin/bash
```

---

### Docker Compose

**Service definition**: Use clean YAML with 4-space indentation.

**Volume mounts**: Use relative paths from project root.

**User**: Pass host UID/GID as environment variables:
```yaml
user: "${HOST_UID}:${HOST_GID}"
```

**stdin/tty**: Enable for interactive shells:
```yaml
stdin_open: true
tty: true
```

---

### Tmux Configuration

**Comments**: Use `#` for section headers:
```tmux
# === KIOSK MODE ===
```

**Settings**: Use `set -g` for global options.

**Key bindings**: Unbind dangerous keys in kiosk mode:
```tmux
unbind C-b
unbind q
unbind x
```

**Sessions**: Use descriptive names:
```tmux
new-session -n shell
new-window -n files "ranger"
```

---

### YAML Files (docker-compose.yml)

**Indentation**: 4 spaces, no tabs.

**Quotes**: Use double quotes for strings with special characters.

**List items**: Use dash with space:
```yaml
volumes:
  - ./workspace:/workspace
```

---

## Error Handling

- Shell scripts must use `set -e` to exit on errors
- Use `||` for commands that may legitimately fail
- Check exit codes when needed:
```bash
command || echo "Failed but continuing"
```

---

## Naming Conventions

| Type | Convention | Example |
|------|------------|---------|
| Files | lowercase, hyphens | `run-dev.sh`, `tmux.conf` |
| Docker services | kebab-case | `tui-dev`, `tui-kiosk` |
| Docker images | kebab-case | `tui-dev`, `tui-kiosk` |
| Users | lowercase | `dev`, `tui` |
| Groups | lowercase | `dev`, `tui` |
| tmux sessions | lowercase | `shell`, `kiosk` |
| tmux windows | lowercase | `shell`, `files`, `editor` |

---

## Import Conventions

### Shell scripts
No imports needed - use external commands directly.

### Dockerfiles
- System packages via `apk add`
- Each package on its own line in multi-line list

---

## Security Guidelines

- Never add packages not needed for TUI functionality
- KIOSK mode: no sudo, no shell spawning from tmux
- Use specific base image versions (e.g., `alpine:3.19` not `latest`)
- Avoid sensitive data in Dockerfiles or configs

---

## Testing Guidelines

Since this is a configuration project, testing involves:

1. **Build verification**: Ensure Dockerfiles build without errors
2. **Container startup**: Verify containers start and show expected output  
3. **Interactive testing**: Run `./run-dev.sh` or `./run-kiosk.sh` and verify tmux layout
4. **Configuration validation**: Check tmux, ranger, and micro configs load correctly

To test a single configuration change:
```bash
# Rebuild after config change
docker compose build tui-dev
./run-dev.sh

# Verify within container
tmux list-sessions
ranger --version
micro --version
```

---

## Git Conventions

- Commit messages in English, imperative mood
- Meaningful commit descriptions
- Track config files, scripts, Dockerfiles
- Ignore workspace directory and temp files

---

## Common Tasks

### Add new package to DEV mode
Edit `Dockerfile.dev`, add package to `apk add` list.

### Add new package to KIOSK mode
Edit `Dockerfile.kiosk`, add package to `apk add` list.

### Modify tmux layout
Edit `tmux.conf` (dev) or `tmux-kiosk.conf` (kiosk).

### Change default editor
Edit `tmux.conf` window commands.

### Add persistent directory
Edit `.gitignore` to untrack new directory in workspace.

---

## File Structure

```
tui-container/
├── AGENTS.md              # This file
├── README.md              # Project documentation
├── Dockerfile.dev         # DEV mode definition
├── Dockerfile.kiosk      # KIOSK mode definition
├── docker-compose.yml    # Container definitions
├── run-dev.sh            # DEV launcher
├── run-kiosk.sh         # KIOSK launcher
├── tmux.conf            # DEV tmux config
├── tmux-kiosk.conf      # KIOSK tmux config
├── config/              # User configs (ranger, micro)
│   ├── micro/
│   └── ranger/
└── workspace/          # Persistent user data
```

---

## Notes for Agents

- This project does NOT have a traditional test suite
- All "testing" is manual verification via container interaction
- Focus on correctness of Dockerfiles and configuration files
- Verify changes work by running containers locally
- No lint tools configured - review code visually before committing