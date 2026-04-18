# DEVELOPMENT.md - Development Guide

This document provides guidelines for contributing to the TUI Container project.

---

## Table of Contents

1. [Getting Started](#getting-started)
2. [Development Workflow](#development-workflow)
3. [Branch Management](#branch-management)
4. [Coding Standards](#coding-standards)
5. [Testing](#testing)
6. [Code Review](#code-review)
7. [Commit Messages](#commit-messages)

---

## Getting Started

### Prerequisites

- Docker 20.10+
- Docker Compose v2
- Linux terminal
- Git

### Clone and Setup

```bash
git clone <repository-url>
cd tui-container

# Build containers
./build.sh

# Test dev container
./run-dev.sh

# Test kiosk container
./run-kiosk.sh
```

---

## Development Workflow

### Environment Modes

| Mode | Purpose | User | Sudo | Shell |
|------|---------|------|-----|------|
| DEV | Development/testing | `dev` | Yes | Bash |
| KIOSK | Production/appliance | `tui` | No | tmux |

### Common Tasks

#### Add new package to DEV

```bash
./run-dev.sh
apk add <package>
# Test in container
# Then update Dockerfile.dev
```

#### Add new package to KIOSK

```bash
# KIOSK is immutable - only via rebuild
# Update Dockerfile.kiosk with new package
./build.sh kiosk
./run-kiosk.sh
```

#### Modify tmux layout

```bash
# DEV mode
vim tmux.conf

# KIOSK mode
vim tmux-kiosk.conf
```

---

## Branch Management

### GitFlow Structure

```
main (production)
├── develop (development)
│   ├── feature/* (new features)
│   ├── bugfix/* (fixes)
│   └── refactor/* (refactoring)
├── release/* (release prep)
└── hotfix/* (urgent fixes)
```

### Branch Naming

| Type | Pattern | Example |
|------|---------|---------|
| Feature | `feature/<description>` | `feature/add-zsh-support` |
| Bugfix | `bugfix/<description>` | `bugfix/fix-tmux-crash` |
| Refactor | `refactor/<description>` | `refactor/improve-dockerfiles` |
| Release | `release/v<version>` | `release/v1.1.0` |
| Hotfix | `hotfix/<description>` | `hotfix/fix-security-issue` |

---

## Coding Standards

### Shell Scripts

```bash
#!/usr/bin/env bash
set -e

# Functions
function_name() {
    local arg="$1"
    # ...
}
```

### Dockerfiles

```dockerfile
# Section separator
# -----------------------------------------------------------------------------
# Package installation
# -----------------------------------------------------------------------------
RUN apk update && apk add --no-cache \
    package1 \
    package2
```

### YAML Files

- 4-space indentation
- Double quotes for special chars
- Descriptive comments

### Tmux Configuration

- Comments with `#`
- Use `set -g` for global options
- Unbind dangerous keys in kiosk mode

---

## Testing

### Build Verification

```bash
# Build all
docker compose build

# Build specific
docker compose build tui-dev
docker compose build tui-kiosk
```

### Container Testing

```bash
# Test dev container
HOST_UID=$(id -u) HOST_GID=$(id -g) docker compose run --rm tui-dev /bin/sh

# Test kiosk container
HOST_UID=$(id -u) HOST_GID=$(id -g) docker compose run --rm tui-kiosk /bin/sh
```

### Interactive Testing

```bash
# Dev mode
./run-dev.sh

# KIOSK mode
./run-kiosk.sh
```

### Verify Tools

```bash
tmux list-sessions
ranger --version
micro --version
vim --version
```

---

## Code Review

### Checklist

- [ ] Code builds without errors
- [ ] Containers start correctly
- [ ] Interactive mode works (tmux, ranger, micro)
- [ ] KIOSK mode is immutable
- [ ] No sensitive data in configs
- [ ] Documentation updated

### PR Process

1. Create feature branch from `develop`
2. Make changes and test locally
3. Push to remote
4. Create PR to `develop`
5. Request review
6. Address feedback
7. Merge after approval

---

## Commit Messages

### Format

```
<type>(<scope>): <description>

[optional body]
[optional footer]
```

### Types

| Type | Description |
|------|-------------|
| `feat` | New feature |
| `fix` | Bug fix |
| `refactor` | Code refactoring |
| `docs` | Documentation |
| `chore` | Maintenance |
| `test` | Tests |
| `style` | Formatting |

### Examples

```
feat(kiosk): add immutable tmux layout

fix(tmux): resolve panel resize issue

refactor(dockerfiles): improve organization

docs(readme): add installation examples

chore: update .gitignore patterns
```

### Rules

- Use imperative mood
- Keep subject line under 50 chars
- Reference issues in footer: `Closes #123`

---

## Contact

For questions or issues, please open an issue on the repository.