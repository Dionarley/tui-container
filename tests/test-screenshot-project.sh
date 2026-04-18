#!/usr/bin/env bash
# =============================================================================
# TUI Container - Project Screenshot Script
# =============================================================================
# Captures project overview for documentation
# =============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
OUTPUT_DIR="$PROJECT_DIR/screenshots"

echo "=== TUI Container - Project Screenshots ==="

cd "$PROJECT_DIR"

# Create output directory
mkdir -p "$OUTPUT_DIR"

# 1. Project Structure
echo ">>> Capturing project structure..."
{
    echo "╔══════════════════════════════════════════════════════════════════╗"
    echo "║  PROJECT STRUCTURE                                         ║"
    echo "╠══════════════════════════════════════════════════════════════════╣"
    tree -L 2 -I 'workspace|.git' --dirsfirst
    echo "╚══════════════════════════════════════════════════════════════════╝"
} > "$OUTPUT_DIR/01-project-structure.txt"

# 2. Git Status
echo ">>> Capturing git status..."
{
    echo "╔══════════════════════════════════════════════════════════════════╗"
    echo "║  GIT STATUS                                             ║"
    echo "╠══════════════════════════════════════════════════════════════════╣"
    git status --short
    echo ""
    echo "╠══════════════════════════════════════════════════════════════════╣"
    git log --oneline -10
    echo "╚══════════════════════════════════════════════════════════════════╝"
} > "$OUTPUT_DIR/02-git-status.txt"

# 3. Docker Images
echo ">>> Capturing Docker images..."
{
    echo "╔══════════════════════════════════════════════════════════════════╗"
    echo "║  DOCKER IMAGES                                           ║"
    echo "╠══════════════════════════════════════════════════════════════════╣"
    docker images | grep -E "tui-|REPOSITORY"
    echo "╚══════════════════════════════════════════════════════════════════╝"
} > "$OUTPUT_DIR/03-docker-images.txt"

# 4. Running Containers
echo ">>> Capturing containers..."
{
    echo "╔══════════════════════════════════════════════════════════════════╗"
    echo "║  CONTAINERS                                               ║"
    echo "╠══════════════════════════════════════════════════════════════════╣"
    docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Image}}"
    echo "╚══════════════════════════════════════════════════════════════════╝"
} > "$OUTPUT_DIR/04-containers.txt"

# 5. Tool Versions
echo ">>> Capturing tool versions..."
{
    echo "╔══════════════════════════════════════════════════════════════════╗"
    echo "║  TOOL VERSIONS                                           ║"
    echo "╠══════════════════════════════════════════════════════════════════╣"
    echo "┌──────────┬────────────────────────────────┬─────────────┐"
    echo "│ Tool     │ Version                       │ Purpose    │"
    echo "├──────────┼────────────────────────────────┼─────────────┤"
    echo "│ tmux     │ $(tmux -V 2>/dev/null || echo 'N/A')            │ Terminal  │"
    echo "│ ranger   │ $(ranger --version 2>/dev/null | head -1) │ File mgr  │"
    echo "│ micro    │ $(micro --version 2>/dev/null | head -1) │ Editor   │"
    echo "│ git      │ $(git --version 2>/dev/null) │ Version   │"
    echo "│ docker   │ $(docker --version 2>/dev/null | cut -d' ' -f3 | tr -d ',')          │ Container │"
    echo "│ compose │ $(docker compose version 2>/dev/null | cut -d' ' -f4 | tr -d ',')         │ Compose  │"
    echo "└──────────┴────────────────────────────────┴─────────────┘"
    echo "╚══════════════════════════════════════════════════════════════════╝"
} > "$OUTPUT_DIR/05-tool-versions.txt"

# 6. File Stats
echo ">>> Capturing file statistics..."
{
    echo "╔══════════════════════════════════════════════════════════════════╗"
    echo "║  FILE STATISTICS                                         ║"
    echo "╠══════════════════════════════════════════════════════════════════╣"
    echo "Total files: $(find . -type f -not -path './.git/*' -not -path './workspace/*' | wc -l)"
    echo "Total lines: $(find . -type f \( -name '*.sh' -o -name '*.md' -o -name '*.yml' -o -name 'Dockerfile*' \) -not -path './.git/*' -not -path './workspace/*' -exec cat {} \; | wc -l)"
    echo ""
    echo "By type:"
    echo "  Dockerfiles: $(find . -maxdepth 1 -name 'Dockerfile*' | wc -l)"
    echo "  Scripts:    $(find . -name '*.sh' | wc -l)"
    echo "  Configs:    $(find . -maxdepth 1 -name '*.conf' -o -name '*.yml' | wc -l)"
    echo "  Docs:      $(find . -maxdepth 1 -name '*.md' | wc -l)"
    echo "  Tests:      $(find ./tests -name '*.sh' 2>/dev/null | wc -l)"
    echo "╚══════════════════════════════════════════════════════════════════╝"
} > "$OUTPUT_DIR/06-file-stats.txt"

echo ""
echo "=== Screenshots captured ==="
ls -la "$OUTPUT_DIR"
echo ""

# Display summary
cat "$OUTPUT_DIR/01-project-structure.txt"
echo ""
cat "$OUTPUT_DIR/05-tool-versions.txt"