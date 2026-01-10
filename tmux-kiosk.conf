# === KIOSK MODE ===
set -g mouse on
set -g status on
set -g status-position bottom
set -g status-bg black
set -g status-fg white

# NÃO permitir sair
unbind-key C-b
unbind-key q
unbind-key x
unbind-key d
unbind-key c
unbind-key &
unbind-key %

# Prefixo simples
set -g prefix C-a
bind C-a send-prefix

# NÃO permitir detach
unbind d

# Painéis fixos
new-session -d -s kiosk

rename-window "TUI"

# Layout:
# [ ranger | micro ]
# [    shell       ]

split-window -h -p 40 "ranger"
split-window -v -p 70 "micro"
select-pane -t 0
send-keys "cd /workspace" Enter

set -g remain-on-exit off
