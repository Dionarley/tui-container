# 🖥️ TUI Container

<!-- Badges -->
[![Docker Build](https://github.com/Dionarley/tui-container/actions/workflows/build.yml/badge.svg)](https://github.com/Dionarley/tui-container/actions)
[![Docker Image Size](https://img.shields.io/docker/image-size/dionarley/tui-container?label=image)](https://hub.docker.com/r/dionarley/tui-container)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Alpine](https://img.shields.io/badge/Alpine-3.19-0D597F.svg)](https://alpinelinux.org)
[![Docker](https://img.shields.io/badge/Docker-20.10+-2496ED.svg)](https://docker.com)
[![GitHub release](https://img.shields.io/github/v/release/Dionarley/tui-container?label=release)](https://github.com/Dionarley/tui-container/releases/latest)
[![GitHub commits](https://img.shields.io/github/last-commit/Dionarley/tui-container/main?label=lastcommit)](https://github.com/Dionarley/tui-container/commits/main)

```
╔══════════════════════════════════════════════════════════════════════════════╗
║                                                                              ║
║   ███████╗ ██████╗ ██╗     ███████╗     ██╗    ██╗ █████╗ ██╗     ███████╗  ║
║   ██╔══██╗██╔══██╗██║     ██╔══██╗     ██║    ██║██╔══██╗██║     ██╔══██╗  ║
║   ██████╔╝██████╔╝██║     █████╗╗      ██║ █╗ ██║███████║██║     █████╔╝  ║
║   ██╔═══╝ ██╔══██╗██║     ██╔══╝╝      ╚██╗██╔╝ ██╔══██╗██║     ██╔══██╗  ║
║   ██║     ██║  ██║███████╗██║          ╚████╔╝  ██║  ██║███████╗██║  ██║  ║
║   ╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝           ╚═══╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝  ║
║                                                                              ║
║   ██████╗  ██████╗  ██████╗ ██████╗ ██████╗ ██╗     ███████╗ ██████╗  ██████╗  ║
║   ██╔══██╗██╔════╝ ██╔═══██╗██╔══██╗██╔══██╗██║     ██╔════╝██╔═══██╗██╔══██╗  ║
║   ██████╔╝██║  ███╗██║   ██║██████╔╝██████╔╝██║     █████╗  ██║   ██║██████╔╝  ║
║   ██╔══██╗██║   ██║██║   ██║██╔══██╗██╔══██╗██║     ██╔══╝  ██║   ██║██╔══██╗  ║
║   ██║  ██║╚██████╔╝╚██████╔╝██║  ██║██║  ██║███████╗███████╗╚██████╔╝██████╔╝  ║
║   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝ ╚═════╝  ╚═════╝  ╚══╩══╝   ║
║                                                                              ║
║          Dev Mode • KIOSK Mode • Alpine Linux • Docker • tmux • ranger            ║
║                                                                              ║
╚══════════════════════════════════════════════════════════════════════════════╝
```

A production-ready **TUI desktop environment** based on Alpine Linux running in Docker with two distinct operational profiles. Designed for enterprise deployments, development workflows, and immutable kiosk environments.

---

## Table of Contents

- [Features](#features)
- [Architecture](#architecture)
- [Quick Start](#quick-start)
- [Modes](#modes)
- [Tools](#tools)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Configuration](#configuration)
- [CLI Reference](#cli-reference)
- [Testing](#testing)
- [CI/CD Pipeline](#cicd-pipeline)
- [Documentation](#documentation)
- [Troubleshooting](#troubleshooting)
- [Security](#security)
- [Contributing](#contributing)
- [License](#license)

---

## Features

| Feature | Description | Enterprise Ready |
|---------|-------------|-----------------|
| 🐧 Alpine Linux | Minimal footprint (~5MB base) | ✅ |
| 🧱 Docker | Containerized, no VM overhead | ✅ |
| 🧠 tmux | Terminal multiplexing | ✅ |
| 🗂 ranger | Vi-style file manager | ✅ |
| ✍ micro | Modern terminal editor | ✅ |
| 💾 Persistence | Data in `./workspace` | ✅ |
| 🔐 Security | No root in KIOSK mode | ✅ |
| 🔄 Two modes | DEV vs KIOSK operational profiles | ✅ |
| 🧪 TDD | Test-driven development | ✅ |
| 📊 Screenshots | Auto-generated documentation | ✅ |
| 🔒 Immutability | KIOSK mode is locked down | ✅ |

---

## Architecture

```
┌─────────────────────────────────────────────────────────────────────────────────────────────┐
│                        HOST SYSTEM                              │
│  ┌──────────────────────────────────────────────────────────┐        │
│  │              Docker Engine                          │        │
│  │  ┌─────────────┐    ┌─────────────┐             │        │
│  │  │  tui-dev  │    │tui-kiosk  │             │        │
│  │  │ :latest   │    │ :latest   │             │        │
│  │  └─────────────┘    └─────────────┘             │        │
│  │       │                 │                     │        │
│  │       ▼                 ▼                     │        │
│  │  ┌─────────────────────────────────┐          │        │
│  │  │      Shared volumes             │          │        │
│  │  │  ./workspace ←──→ /workspace  │          │        │
│  │  │  ./config  ←──→ /home/*/.config│          │        │
│  │  └─────────────────────────────────┘          │        │
│  └──────────────────────────────────────────────────────────┘        │
└──────────────────────────────────────────────────────���──────────────────────┘
```

### Component Overview

| Component | Image Size | Purpose |
|-----------|------------|---------|
| tui-dev | ~50MB | Development with sudo |
| tui-kiosk | ~45MB | Production, immutable |

---

## Quick Start

```bash
# 1. Clone repository
git clone https://github.com/Dionarley/tui-container.git
cd tui-container

# 2. Build containers
./build.sh                    # All
./build.sh dev               # DEV only
./build.sh kiosk             # KIOSK only

# 3. Run containers
./run-dev.sh                 # Development mode
./run-kiosk.sh             # KIOSK mode
```

---

## Modes

### Comparison Matrix

| Feature | DEV Mode | KIOSK Mode | Priority |
|---------|---------|-----------|----------|
| User | `dev` | `tui` | Required |
| sudo access | ✅ Yes | ❌ No | Critical |
| apk add | ✅ Yes | ❌ No | Critical |
| vim | ✅ Yes | ❌ No | Required |
| Free shell | ✅ Yes | ❌ No | Required |
| Fixed layout | ❌ No | ✅ Yes | Required |
| Auto tmux | ❌ No | ✅ Yes | Required |
| Auto-start | ❌ No | ✅ Yes | Optional |

### DEV Mode

**Purpose:** Development, testing, configuration

```bash
./run-dev.sh
# Manual: tmux new-session -n shell
```

**Use cases:**
- Testing new configurations
- Installing packages temporarily
- Editing files
- Exploring layouts

### KIOSK Mode

**Purpose:** Production, immutable environments

```bash
./run-kiosk.sh
# Auto-starts in fixed tmux layout
```

**Use cases:**
- Thin clients
- Restricted environments
- Public terminals
- Appliance deployment

---

## Tools

| Tool | Version | Purpose | Package |
|------|---------|---------|--------|
| tmux | 3.4+ | Terminal multiplexer | tmux |
| ranger | 1.9.3+ | File manager | ranger |
| micro | 2.0.13+ | Text editor | micro |
| vim | 9.0+ | Vi editor | vim |
| git | 2.43+ | Version control | git |
| bash | 5.3+ | Shell | bash |
| curl | - | HTTP client | curl |

---

## Project Structure

```
tui-container/
├── .github/                     # GitHub Actions
│   └── workflows/
│       └── build.yml            # CI pipeline
├── .gitignore                  # Git ignore
├── LICENSE                    # MIT License
├── README.md                  # This file
├── AGENTS.md                 # AI agent guidelines
├── DEVELOPMENT.md           # Contributing guide
├── RELEASE.md              # Release procedures
├── CHANGELOG.md           # Version history
├── Dockerfile.dev          # DEV mode image
├── Dockerfile.kiosk       # KIOSK mode image
├── docker-compose.yml      # Container orchestration
├── build.sh             # Build CLI
├── run-dev.sh           # DEV launcher
├── run-kiosk.sh        # KIOSK launcher
├── lib/                    # Shared libraries
│   └── common.sh        # Common functions
├── tmux.conf             # DEV tmux config
├── tmux-kiosk.conf       # KIOSK tmux config
├── tests/                  # Test suite
│   ├── test-all.sh
│   ├── test-build.sh
│   ├── test-permissions.sh
│   ├── test-run-dev.sh
│   ├── test-run-kiosk.sh
│   ├── test-screenshot-*.sh
│   └── test-tools.sh
├── config/                 # User configurations
│   ├── micro/
│   └── ranger/
└── workspace/            # Persistent data (gitignored)
```

---

## Installation

### Prerequisites

| Requirement | Minimum Version | Verification |
|-------------|-----------------|--------------|
| Docker | 20.10+ | `docker --version` |
| Docker Compose | v2 | `docker compose version` |
| Linux | Any | `uname -a` |
| Terminal | UTF-8 | Check terminal docs |

### Automated Install

```bash
# Clone and setup
git clone https://github.com/Dionarley/tui-container.git
cd tui-container

# Make executable
chmod +x *.sh

# Build
./build.sh

# Verify
bash tests/test-build.sh
```

---

## Configuration

### Adding Packages

**DEV Mode:**
```dockerfile
# Edit Dockerfile.dev
RUN apk add --no-cache new-package
```

**KIOSK Mode:**
```dockerfile
# Edit Dockerfile.kiosk
RUN apk add --no-cache new-package
```

### tmux Layouts

**DEV:**
```bash
vim tmux.conf
```

**KIOSK:**
```bash
vim tmux-kiosk.conf
```

### Permissions

```bash
# Scripts
chmod +x *.sh

# Workspace
chown -R $(id -u):$(id -g) workspace/
```

---

## CLI Reference

| Command | Description | Example |
|---------|------------|---------|
| `./build.sh` | Build all containers | `./build.sh` |
| `./build.sh dev` | Build DEV only | `./build.sh dev` |
| `./build.sh kiosk` | Build KIOSK only | `./build.sh kiosk` |
| `./run-dev.sh` | Run DEV container | `./run-dev.sh` |
| `./run-kiosk.sh` | Run KIOSK container | `./run-kiosk.sh` |
| `docker compose ps` | List containers | `docker compose ps` |
| `docker compose logs` | View logs | `docker compose logs` |
| `docker compose down` | Stop containers | `docker compose down` |

---

## Testing

### Test Suite

```bash
# All tests
bash tests/test-all.sh

# Individual
bash tests/test-tools.sh        # Host tools
bash tests/test-permissions.sh  # File permissions
bash tests/test-build.sh     # Docker build
bash tests/test-run-dev.sh   # DEV container
bash tests/test-run-kiosk.sh # KIOSK container
```

### Screenshot Generation

```bash
# Project overview
bash tests/test-screenshot-project.sh

# Container states
bash tests/test-screenshot-containers.sh

# Test results
bash tests/test-screenshot-tests.sh
```

### Test Results

```
╔══════════════════════════════════════════════════════════════════════╗
║  TEST RESULTS SUMMARY                                         ║
╠══════════════════════════════════════════════════════════════════════╣
║  ┌───────────────────┬────────────┬────────────────────┐       ║
║  │ Test              │ Status    │ Duration          │       ║
║  ├───────────────────┼────────────┼────────────────────┤       ║
║  │ Tools            │ ✅ PASSED │ -                │       ║
║  │ Permissions     │ ✅ PASSED │ -                │       ║
║  │ Build           │ ✅ PASSED │ ~30s             │       ║
║  │ Run DEV         │ ✅ PASSED │ ~10s             │       ║
║  │ Run KIOSK       │ ✅ PASSED │ ~10s             │       ║
║  └───────────────────┴────────────┴────────────────────┘       ║
║  RESULT: ALL TESTS PASSED                                   ║
╚══════════════════════════════════════════════════════════════════════╝
```

---

## CI/CD Pipeline

### Workflow

```
┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│   canary ★   │────▶│     main     │────▶│   v1.0.0 ★   │
└──────────────┘     └──────────────┘     └──────────────┘
       │                                      │
       ▼                                      ▼
┌──────────────┐                      ┌──────────────┐
│  tests/* ★   │                      │    Docker    │
└──────────────┘                      │    Hub ★     │
                                     └──────────────┘
```

### GitHub Actions

- Build on push to `main`
- Build on push to `canary`
- Run tests on PR

---

## Documentation

| Document | Description | Audience |
|----------|-------------|----------|
| [README.md](README.md) | This file | All users |
| [AGENTS.md](AGENTS.md) | AI agent guidelines | Developers |
| [DEVELOPMENT.md](DEVELOPMENT.md) | Contribution guide | Contributors |
| [RELEASE.md](RELEASE.md) | Release process | Maintainers |
| [CHANGELOG.md](CHANGELOG.md) | Version history | All users |

---

## Troubleshooting

### Common Issues

| Issue | Cause | Solution |
|-------|-------|---------|
| Container won't start | Docker not running | `systemctl start docker` |
| Permission denied | Scripts not executable | `chmod +x *.sh` |
| tmux not starting | Config missing | `cp tmux.conf ~/.tmux.conf` |
| Network error | Network conflict | `docker compose down && up` |
| Disk full | No space | `docker system prune -a` |

### Debug Commands

```bash
# Check Docker
docker ps -a
docker compose logs

# Rebuild from scratch
docker compose build --no-cache
docker compose up

# Check permissions
ls -la *.sh
chmod +x *.sh
```

---

## Security

### Security Features

| Feature | Implementation | DEV | KIOSK |
|---------|---------------|-----|------|
| Non-root user | `dev`/`tui` | ✅ | ✅ |
| No sudo | N/A | ✅ | ❌ |
| Immutable | Read-only config | ❌ | ✅ |
| Network isolation | Bridge network | ✅ | ✅ |

### Best Practices

- Never run containers as root in production
- Use KIOSK mode for public endpoints
- Regularly update base images
- Scan images for vulnerabilities

---

## Contributing

See [DEVELOPMENT.md](DEVELOPMENT.md) for contribution guidelines.

### Development Workflow

```bash
# Create feature branch
git checkout -b feature/description develop

# Make changes
# Test locally
bash tests/test-all.sh

# Commit and push
git commit -m "feat: description"
git push origin feature/description

# Create PR
```

---

## License

MIT License - See [LICENSE](LICENSE)

---

## Version

**Current Release:** v1.0.0

See [CHANGELOG.md](CHANGELOG.md) for version history.

---

## Author

| Role | Name | Contact |
|------|------|---------|
| Maintainer | Dionarley Ruas Vieira | [@Dionarley](https://github.com/Dionarley) |

---

## Support

- 📋 Issues: [GitHub Issues](https://github.com/Dionarley/tui-container/issues)
- 💬 Discussions: [GitHub Discussions](https://github.com/Dionarley/tui-container/discussions)
- 📦 Releases: [GitHub Releases](https://github.com/Dionarley/tui-container/releases)

---

```
┌────────────────────────────────────────────────────────────────────────────┐
│                                                                              │
│   🖥️ TUI Container - Enterprise TUI Desktop in Docker                       │
│                                                                              │
│   © 2026 Dionarley Ruas Vieira                                              │
│   License: MIT                                                               │
│   Version: v1.0.0                                                            │
│                                                                              │
│   Made with 🐧 on Alpine Linux                                               │
│                                                                              │
└────────────────────────────────────────────────────────────────────────────┘
```