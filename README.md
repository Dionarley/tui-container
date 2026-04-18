# 🖥️ TUI Container — Dev & Kiosk Mode

A minimalist TUI desktop based on Alpine Linux running in Docker with two distinct profiles:

- 🧪 **DEV** — explorable development and testing environment
- 🔒 **KIOSK** — immutable, locked appliance/thin client style

Ideal for:
- TUI terminals
- Restricted environments
- Thin clients
- Immutability studies
- Terminal-first workflows

---

## ✨ Features

- 🐧 Alpine Linux (lightweight and fast)
- 🧱 Docker containers (no VM)
- 🧠 tmux as TUI "window manager"
- 🗂 ranger (file manager)
- ✍ micro (text editor)
- 📦 Persistence only in `/workspace`
- 🔐 No root in kiosk mode
- 🔁 Two separate modes (DEV vs KIOSK)

---

## 📁 Project Structure

```
tui-container/
├── AGENTS.md              # Agentic coding guidelines
├── DEVELOPMENT.md         # Development guide
├── RELEASE.md           # Release procedures
├── CHANGELOG.md         # Change log
├── README.md            # This file
├── Dockerfile.dev      # DEV mode definition
├── Dockerfile.kiosk   # KIOSK mode definition
├── docker-compose.yml  # Container definitions
├── run-dev.sh         # DEV launcher
├── run-kiosk.sh       # KIOSK launcher
├── build.sh           # Build script
├── lib/common.sh      # Shared functions
├── tmux.conf          # DEV tmux config
├── tmux-kiosk.conf    # KIOSK tmux config
├── config/            # User configs
│   ├── micro/
│   └── ranger/
└── workspace/         # Persistent user data
```

---

## 🧠 Concept: DEV vs KIOSK

### 🧪 DEV Mode

Environment for:
- Testing configs
- Installing packages
- Editing files
- Experimenting with layouts

Features:
- User `dev`
- `sudo` enabled
- `vim` available
- Free shell

### 🔒 KIOSK Mode

Production environment:
- Immutable
- No root
- No `apk add`
- No exposed shell
- Starts directly in tmux

Features:
- User `tui`
- No sudo
- No privilege escalation
- Fixed tmux layout

---

## ⚠️ Requirements

- Docker 20.10+
- Docker Compose v2
- Linux (tested on Arch Linux)
- UTF-8 compatible terminal

---

## ▶️ Quick Start

### 1️⃣ Clone Repository

```bash
git clone <repo-url>
cd tui-container
```

### 2️⃣ Build Containers

```bash
# Build all
./build.sh

# Or build specific
./build.sh dev
./build.sh kiosk
```

### 3️⃣ Run DEV Mode

```bash
./run-dev.sh
```

### 4️⃣ Run KIOSK Mode

```bash
./run-kiosk.sh
```

---

## 📖 Documentation

| Document | Description |
|----------|-------------|
| [README.md](README.md) | Project overview |
| [DEVELOPMENT.md](DEVELOPMENT.md) | Contribution guide |
| [RELEASE.md](RELEASE.md) | Release procedures |
| [CHANGELOG.md](CHANGELOG.md) | Change history |
| [AGENTS.md](AGENTS.md) | Agentic coding guidelines |

---

## 💾 Persistence

All data in `/workspace` is persisted to `./workspace` on the host.

---

## 🔧 Configuration

### Add Package to DEV

```dockerfile
# Edit Dockerfile.dev, add to apk add list
RUN apk add --no-cache new-package
```

### Add Package to KIOSK

```dockerfile
# Edit Dockerfile.kiosk, add to apk add list
RUN apk add --no-cache new-package
```

### Modify tmux Layout

```bash
# DEV
vim tmux.conf

# KIOSK
vim tmux-kiosk.conf
```

---

## 📜 License

MIT

---

## 👤 Author

Dionarley Ruas Vieira