# Docker Configuration

## Dockerfile.dev

```dockerfile
FROM alpine:3.19

RUN apk update && apk add --no-cache \
    bash tmux ranger micro vim git curl less ncurses ca-certificates sudo

RUN addgroup -g 1000 dev && \
    adduser -D -u 1000 -G dev dev && \
    echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER dev
WORKDIR /workspace

COPY --chown=dev:dev tmux.conf /home/dev/.tmux.conf
COPY --chown=dev:dev config /home/dev/.config

ENV TERM=xterm-256color
ENV SHELL=/bin/bash

CMD ["bash"]
```

## Dockerfile.kiosk

```dockerfile
FROM alpine:3.19

RUN apk update && apk add --no-cache \
    bash tmux ranger micro git curl less ncurses ca-certificates

RUN addgroup -g 1000 tui && \
    adduser -D -u 1000 -G tui tui

USER tui
WORKDIR /workspace

COPY --chown=tui:tui tmux.conf /home/tui/.tmux.conf
COPY --chown=tui:tui tmux-kiosk.conf /home/tui/.tmux-kiosk.conf
COPY --chown=tui:tui config /home/tui/.config

ENV TERM=xterm-256color
ENV SHELL=/bin/bash

CMD ["tmux", "-f", "/home/tui/.tmux-kiosk.conf"]
```