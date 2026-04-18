# CHANGELOG.md - Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [v1.0.0] - 2026-04-18

### Added

- **DEV Mode**: Development container with sudo and vim
- **KIOSK Mode**: Immutable appliance-style container
- **tmux layouts**: Config for DEV (shell, files, editor) and KIOSK (locked layout)
- **ranger**: File manager configuration
- **micro**: Text editor configuration
- **Workspace persistence**: `/workspace` mounted from host
- **Docker Compose**: Service definitions for both modes

### Changed

- Refactored Dockerfiles with better organization
- Improved shell scripts with error handling
- Added lib/common.sh for shared functions

### Infrastructure

- GitFlow branching strategy
- SemVer versioning
- Per-feature release process
- Development and release documentation

---

## [Unreleased]

### Added

- New features (coming soon)

### Changed

- improvements (coming soon)

### Fixed

- Bug fixes (coming soon)

---

## Previous Versions

- v0.0.1 - Initial prototype (not tagged)

---

## Upgrade Guide

### From v0.x to v1.0

```bash
# Pull latest
git pull origin main

# Rebuild containers
./build.sh all

# Test new containers
./run-dev.sh
./run-kiosk.sh
```

---

## Migration Notes

### Workspace

- Workspace directory is now `./workspace` on host
- Data persists between container runs

### Permissions

- Containers run as host UID/GID
- Ensure correct ownership: `chown -R $(id -u):$(id -g) workspace`

---

## Support

For version-specific issues, please check the [Issues](https://github.com/issues) page.

---

## Credits

See [README.md](README.md) for project information.