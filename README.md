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
├── config/               # Configurações persistentes
│   ├── micro/
│   └── ranger/
├── workspace/            # Diretório persistente de trabalho
├── Dockerfile.dev        # Imagem DEV (explorável)
├── Dockerfile.kiosk      # Imagem KIOSK (imutável)
├── docker-compose.yml
├── run-dev.sh
├── run-kiosk.sh
├── tmux.conf
├── tmux-kiosk.conf
├── .gitignore
└── README.md

```

🧠 Conceito: DEV vs KIOSK

🧪 DEV mode
Ambiente para:

testar configs

instalar pacotes

editar arquivos

experimentar layouts

Características:

usuário dev

sudo habilitado

vim disponível

shell livre

🔒 KIOSK mode
Ambiente final de uso:

imutável

sem root

sem apk add

sem shell exposto

entra direto no tmux

Características:

usuário tui

sem sudo

sem elevação de privilégios

layout fixo em tmux

🔧 Requisitos
Docker

Docker Compose v2

Linux (testado em Arch Linux)

Terminal compatível com UTF-8

▶️ Como usar
1️⃣ Clonar o repositório
bash
Copiar código
git clone <repo-url>
cd tui-container
2️⃣ Rodar em modo DEV
bash
Copiar código
./run-dev.sh
Você entra em um shell Alpine com:

tmux

ranger

micro

vim

sudo habilitado

Ideal para ajustes e experimentação.

3️⃣ Rodar em modo KIOSK
bash
Copiar código
./run-kiosk.sh
Você entra diretamente em um desktop TUI travado, com:

layout fixo em tmux

ranger + micro

persistência apenas em /workspace

Sem acesso root.

💾 Persistência
Tudo que estiver em:

text
Copiar código
/workspace
é persistido no host em:

text
Copiar código
./workspace
Nada fora disso deve ser alterado no modo kiosk.

🧪 Teste rápido de persistência
Dentro do container:

bash
Copiar código
touch /workspace/teste.txt
No host:

bash
Copiar código
ls workspace
🔐 Segurança e imutabilidade
No modo kiosk:

apk add falha

su falha

sudo não existe

filesystem fora /workspace é efetivamente somente leitura

Esse comportamento é intencional.

📌 Casos de uso
Thin client TUI

Terminais industriais

Ambientes educacionais

Kiosks offline

Base para distro minimalista

Estudos de containers imutáveis

🚀 Próximos passos (ideias)
🔐 filesystem read-only explícito

🔁 hotkey para reset de sessão tmux

🧊 build como ISO Alpine

🧩 integração com Wayland + foot (fora do Docker)

🤖 CI para build das imagens

📜 Licença
MIT — use, modifique e distribua livremente.

👤 Autor
Projeto criado por Dionarley Ruas Vieira
Linux / DevOps / Sistemas Minimalistas
