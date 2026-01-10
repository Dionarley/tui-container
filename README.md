# 🖥️ TUI Container — Dev & Kiosk Mode

Um **desktop TUI minimalista**, baseado em **Alpine Linux**, rodando em **Docker**, com dois perfis bem definidos:

- 🧪 **DEV** — ambiente explorável para desenvolvimento e testes
- 🔒 **KIOSK** — ambiente imutável, travado, estilo appliance / thin client

Ideal para:
- terminais TUI
- ambientes restritos
- thin clients
- estudos de imutabilidade
- setups de terminal-first workflow

---

## ✨ Características

- 🐧 Alpine Linux (leve e rápido)
- 🧱 Containers Docker (sem VM)
- 🧠 tmux como “window manager” TUI
- 🗂 ranger (file manager)
- ✍ micro (editor)
- 📦 Persistência apenas em `/workspace`
- 🔐 Sem root no modo kiosk
- 🔁 Dois modos separados (DEV vs KIOSK)

---

## 📁 Estrutura do projeto

```text
tui-container/
├── config/
│   ├── micro/
│   └── ranger/
├── workspace/
├── Dockerfile.dev
├── Dockerfile.kiosk
├── docker-compose.yml
├── run-dev.sh
├── run-kiosk.sh
├── tmux.conf
├── tmux-kiosk.conf
├── .gitignore
└── README.md
```

---

## 🧠 Conceito: DEV vs KIOSK

### 🧪 DEV mode
Ambiente para:
- testar configs
- instalar pacotes
- editar arquivos
- experimentar layouts

Características:
- usuário `dev`
- `sudo` habilitado
- `vim` disponível
- shell livre

### 🔒 KIOSK mode
Ambiente final de uso:
- imutável
- sem root
- sem `apk add`
- sem shell exposto
- entra direto no tmux

Características:
- usuário `tui`
- sem sudo
- sem elevação de privilégios
- layout fixo em tmux

---

## 🔧 Requisitos

- Docker
- Docker Compose v2
- Linux (testado em Arch Linux)
- Terminal compatível com UTF-8

---

## ▶️ Como usar

### 1️⃣ Clonar o repositório

```bash
git clone <repo-url>
cd tui-container
```

---

### 2️⃣ Rodar em modo DEV

```bash
./run-dev.sh
```

---

### 3️⃣ Rodar em modo KIOSK

```bash
./run-kiosk.sh
```

---

## 💾 Persistência

Tudo que estiver em `/workspace` é persistido em `./workspace` no host.

---

## 📜 Licença

MIT

---

## 👤 Autor

Dionarley Ruas Vieira
