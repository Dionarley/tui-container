# 🖥️ TUI Container

![Docker Build](https://github.com/Dionarley/tui-container/actions/workflows/build.yml/badge.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)
![Alpine](https://img.shields.io/badge/Alpine-3.19-0D597F.svg)
![Docker](https://img.shields.io/badge/Docker-20.10+-2496ED.svg)

```
╔═══════════════════════════════════════════════════════════╗
║   🖥️ TUI Container                                         ║
║   ──────────────────────────────────────────────────────  ║
║   Dev Mode  •  KIOSK Mode  •  Alpine Linux  •  Docker      ║
║   tmux + ranger + micro                                    ║
╚═══════════════════════════════════════════════════════════╝
```

A minimalist TUI desktop environment based on **Alpine Linux** running in **Docker** with two distinct operational profiles.

---

## Table of Contents

- [Features](#features)
- [Quick Start](#quick-start)
- [Modes](#modes)
- [Tools](#tools)
- [Project Structure](#project-structure)
- [Configuration](#configuration)
- [Documentation](#documentation)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

---

## Features

| Feature | Description |
|---------|-------------|
| 🐧 Alpine Linux | Lightweight (5MB base) and fast |
| 🧱 Docker | No VM overhead, runs anywhere |
| 🧠 tmux | Terminal multiplexer/window manager |
| 🗂 ranger | Vi-style file manager |
| ✍ micro | Modern terminal text editor |
| 💾 Persistence | Data persists in `./workspace` |
| 🔐 Security | No root in KIOSK mode |
| 🔄 Two modes | DEV (development) vs KIOSK (production) |

---

## Quick Start

```bash
# Clone and enter
git clone https://github.com/Dionarley/tui-container.git
cd tui-container

# Build containers
./build.sh                    # All containers
./build.sh dev               # DEV only
./build.sh kiosk             # KIOSK only

# Run containers
./run-dev.sh                 # Development mode
./run-kiosk.sh               # KIOSK mode
```

---

## Modes

| Feature | DEV Mode | KIOSK Mode |
|---------|---------|-----------|
| User | `dev` | `tui` |
| sudo | ✅ Yes | ❌ No |
| apk add | ✅ Yes | ❌ No |
| vim | ✅ Yes | ❌ No |
| Free shell | ✅ Yes | ❌ No |
| Fixed layout | ❌ No | ✅ Yes |
| Starts in tmux | ❌ Manual | ✅ Auto |

### DEV Mode

Development environment for:
- Testing configurations
- Installing packages
- Editing files
- Experimenting with layouts

```bash
./run-dev.sh
# Then: tmux new-session -n shell
```

### KIOSK Mode

Immutable production environment:
- No root access
- No package installation
- Locked tmux layout
- Direct tmux start

```bash
./run-kiosk.sh
# Starts directly in tmux layout
```

---

## Tools

| Tool | Version | Purpose |
|------|---------|---------|
| tmux | 3.4 | Terminal multiplexer |
| ranger | 1.9.3 | File manager |
| micro | 2.0.13 | Text editor |
| vim | 9.0 | Vi editor |
| git | 2.43 | Version control |
| bash | 5.3 | Shell |

---

## Project Structure

```
tui-container/
├── README.md              # This file
├── AGENTS.md             # Agentic coding guidelines
├── DEVELOPMENT.md        # Contribution guide
├── RELEASE.md           # Release procedures
├── CHANGELOG.md          # Change log
├── Dockerfile.dev       # DEV mode
├── Dockerfile.kiosk     # KIOSK mode
├── docker-compose.yml   # Container definitions
├── build.sh            # Build script
├── run-dev.sh           # DEV launcher
├── run-kiosk.sh         # KIOSK launcher
├── lib/common.sh       # Shared functions
├── tmux.conf           # DEV tmux config
├── tmux-kiosk.conf     # KIOSK tmux config
├── tests/              # Test suite
│   └── test-*.sh
├── config/             # User configs
│   ├── micro/
│   └── ranger/
└── workspace/          # Persistent data
```

---

## Configuration

### Adding Packages

```dockerfile
# DEV mode - Edit Dockerfile.dev
RUN apk add --no-cache new-package

# KIOSK mode - Edit Dockerfile.kiosk
RUN apk add --no-cache new-package
```

### Modifying tmux Layout

```bash
# DEV layout
vim tmux.conf

# KIOSK layout
vim tmux-kiosk.conf
```

### Permissions

```bash
# Fix scripts
chmod +x *.sh

# Fix workspace ownership
chown -R $(id -u):$(id -g) workspace/
```

---

## Documentation

| Document | Description |
|----------|-------------|
| [AGENTS.md](AGENTS.md) | Guidelines for AI agents |
| [DEVELOPMENT.md](DEVELOPMENT.md) | How to contribute |
| [RELEASE.md](RELEASE.md) | Release process |
| [CHANGELOG.md](CHANGELOG.md) | Version history |

---

## Troubleshooting

### Container Won't Start

```bash
# Check Docker status
docker compose ps

# View logs
docker compose logs

# Rebuild
docker compose build --no-cache
docker compose up
```

### Permission Denied

```bash
# Fix script permissions
chmod +x run-dev.sh run-kiosk.sh build.sh

# Fix workspace ownership
sudo chown -R $(id -u):$(id -g) workspace/
```

### tmux Not Starting

```bash
# Check config exists
ls -la ~/.tmux.conf

# Restore if missing
cp tmux.conf ~/.tmux.conf
```

### Network Issues

```bash
# Recreate network
docker compose down
docker network prune
docker compose up
```

### Disk Space

```bash
# Clean Docker
docker system prune -a

# Remove unused volumes
docker volume prune
```

---

## Contributing

See [DEVELOPMENT.md](DEVELOPMENT.md) for contribution guidelines.

### CI/CD Pipeline

```
┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│   canary ★   │────▶│     main     │────▶│   v1.0.0 ★   │
└──────────────┘     └──────────────┘     └──────────────┘
       │                                      │
       ▼                                      ▼
┌──────────────┐                      ┌──────────────┐
│  tests/* ★   │                      │    Docker     │
└──────────────┘                      │    Hub ★     │
                                     └──────────────┘
```

### Test Suite

```bash
# Run all tests
bash tests/test-all.sh

# Individual tests
bash tests/test-build.sh
bash tests/test-run-dev.sh
bash tests/test-run-kiosk.sh
```

---

## License

MIT License - See [LICENSE](LICENSE)

---

## Author

**Dionarley Ruas Vieira**
- GitHub: [@Dionarley](https://github.com/Dionarley)
- Email: dionarley@gmail.com

---

```
┌─────────────────────────────────────────────────────────────────┐
│                                                                 │
│   🖥️ TUI Container - Minimalist TUI Desktop in Docker            │
│                                                                 │
│   Made with 🐧 on Alpine Linux                                  │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```