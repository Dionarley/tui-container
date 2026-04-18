# Installation

## Prerequisites

| Requirement | Minimum Version |
|-------------|----------------|
| Docker | 20.10+ |
| Docker Compose | v2 |
| Linux | Any |

## Install

### 1. Clone Repository

```bash
git clone https://github.com/Dionarley/tui-container.git
cd tui-container
```

### 2. Make Scripts Executable

```bash
chmod +x *.sh
```

### 3. Build Containers

```bash
./build.sh
```

## Verify Installation

```bash
# Run tests
bash tests/test-build.sh

# Check containers
docker images | grep tui-
```

## Next Steps

- [Build Guide](build.md)
- [Run Guide](run.md)