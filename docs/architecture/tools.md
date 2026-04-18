# Tools

## Available Tools

| Tool | Version | Purpose | Package |
|------|---------|---------|--------|
| tmux | 3.4+ | Terminal multiplexer | tmux |
| ranger | 1.9.3+ | File manager | ranger |
| micro | 2.0.13+ | Text editor | micro |
| vim | 9.0+ | Vi editor | vim |
| git | 2.43+ | Version control | git |
| bash | 5.3+ | Shell | bash |
| curl | - | HTTP client | curl |

## Usage

### tmux

```bash
tmux new-session -n shell
tmux new-window -n files "ranger"
tmux new-window -n editor "micro"
```

### ranger

```bash
ranger
```

### micro

```bash
micro filename
```