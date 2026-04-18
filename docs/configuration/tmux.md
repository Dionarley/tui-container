# tmux Configuration

## DEV Configuration

`tmux.conf`:

```tmux
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix

set -g mouse on
set -g history-limit 20000
set -g status-bg black
set -g status-fg green

new-session -n shell
new-window -n files "ranger"
new-window -n editor "micro"
```

## KIOSK Configuration

`tmux-kiosk.conf`:

```tmux
set -g mouse on
set -g status on
set -g status-position bottom
set -g status-bg black
set -g status-fg white

set -g prefix C-a
bind C-a send-prefix

unbind C-b
unbind q
unbind x
unbind d
unbind c

new-session -d -s kiosk -n TUI
split-window -h "ranger"
select-pane -t 0
split-window -v "micro"
select-layout tiled
```