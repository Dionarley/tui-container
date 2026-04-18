# TUI Container

<p align="center">
  <img src="https://img.shields.io/badge/Docker-20.10+-2496ED?style=for-the-badge&logo=docker" alt="Docker">
  <img src="https://img.shields.io/badge/Alpine-3.19-0D597F?style=for-the-badge&logo=alpine-linux" alt="Alpine">
  <img src="https://img.shields.io/badge/License-MIT-blue?style=for-the-badge" alt="License">
</p>

A production-ready **TUI desktop environment** based on Alpine Linux running in Docker with two distinct operational profiles.

## Features

- 🐧 Alpine Linux (~5MB base)
- 🧱 Docker containers
- 🧠 tmux terminal multiplexer
- 🗂 ranger file manager
- ✍ micro text editor
- 🔐 Security (no root in KIOSK)
- 🧪 TDD test suite

## Quick Start

```bash
git clone https://github.com/Dionarley/tui-container.git
cd tui-container
./build.sh
./run-dev.sh
```

## Documentation

- [Quick Start](quickstart/installation.md) - Installation guide
- [Architecture](architecture/overview.md) - System architecture
- [Configuration](configuration/docker.md) - Configuration guide
- [Testing](testing/suite.md) - Test suite
- [CI/CD](cicd/pipeline.md) - Pipeline documentation
- [Security](security.md) - Security features
- [Contributing](contributing.md) - Contribution guide

## Modes

| Mode | User | sudo | Auto tmux | Use Case |
|------|------|------|----------|---------|
| DEV | `dev` | ✅ | ❌ | Development |
| KIOSK | `tui` | ❌ | ✅ | Production |

## License

MIT License - See [license.md](license.md)