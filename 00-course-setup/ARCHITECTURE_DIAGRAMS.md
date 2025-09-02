# Development Environment Architecture Diagrams

## Local Development Architecture

### Option 1: Direct Local Installation
```
┌─────────────────────────────────────────────────────────────┐
│                    YOUR LOCAL MACHINE                      │
├─────────────────────────────────────────────────────────────┤
│  Operating System (Windows/macOS/Linux)                    │
│  ┌───────────────────────────────────────────────────────┐ │
│  │               Development Stack                       │ │
│  ├───────────────────────────────────────────────────────┤ │
│  │ 🐍 Python 3.12 (manually installed)                 │ │
│  │ 📦 AI/ML Packages (pip install -r requirements.txt) │ │
│  │ 🔧 Azure CLI (manual installation)                   │ │
│  │ 🌐 Node.js + npm (manual installation)              │ │
│  │ 💻 VS Code + Extensions (manual setup)              │ │
│  │ 🔑 .env file with API keys (manual management)      │ │
│  │ 📚 Course Dependencies (manual resolution)          │ │
│  └───────────────────────────────────────────────────────┘ │
│                                                             │
│  Setup Time: 1-3 hours + ongoing maintenance               │
│  Consistency: Varies by developer machine                  │
│  Isolation: Shares system with other projects              │
└─────────────────────────────────────────────────────────────┘
```

### Option 2: Local Dev Containers (Recommended)
```
┌─────────────────────────────────────────────────────────────┐
│                    YOUR LOCAL MACHINE                      │
├─────────────────────────────────────────────────────────────┤
│  Operating System (Windows/macOS/Linux)                    │
│  ┌───────────────────────────────────────────────────────┐ │
│  │            Required Infrastructure                    │ │
│  ├───────────────────────────────────────────────────────┤ │
│  │ 🐳 Docker Desktop (required for containers)          │ │
│  │ 🐧 WSL 2 (Windows only - Linux subsystem)           │ │
│  │ 💻 VS Code + Dev Containers Extension               │ │
│  │ 📁 Git (for repository cloning)                     │ │
│  └───────────────────────────────────────────────────────┘ │
│  ┌───────────────────────────────────────────────────────┐ │
│  │              Dev Container                            │ │
│  ├───────────────────────────────────────────────────────┤ │
│  │ 🐍 Python 3.12 (auto-configured)                    │ │
│  │ 📦 All Dependencies (pre-installed)                 │ │
│  │ 🔧 Azure CLI (pre-configured)                       │ │
│  │ 🌐 Node.js + MCP tools (ready to use)              │ │
│  │ 🚀 Zero manual package management                   │ │
│  │ 🔒 Isolated from host system                        │ │
│  └───────────────────────────────────────────────────────┘ │
│                                                             │
│  Setup Time: 30 min Docker + 2 min container build         │
│  Consistency: Identical across all machines                │
│  Isolation: Complete container isolation                   │
└─────────────────────────────────────────────────────────────┘
```

## GitHub Codespaces Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                  YOUR DEVICE (Any Platform)                │
├─────────────────────────────────────────────────────────────┤
│  🌐 Web Browser OR VS Code (Remote Connection)            │
│                           │                                 │
│                           ▼ HTTPS/WebSocket                │
│  ┌─────────────────────────────────────────────────────┐   │
│  │              GITHUB CODESPACES CLOUD               │   │
│  │  ┌─────────────────────────────────────────────┐   │   │
│  │  │            Dedicated Azure VM               │   │   │
│  │  ├─────────────────────────────────────────────┤   │   │
│  │  │ 🐧 Ubuntu Linux Kernel                     │   │   │
│  │  │  ┌─────────────────────────────────────┐   │   │   │
│  │  │  │         Dev Container               │   │   │   │
│  │  │  ├─────────────────────────────────────┤   │   │   │
│  │  │  │ 🐍 Python 3.12 + Conda (auto)     │   │   │   │
│  │  │  │ 📦 All Packages (pre-installed)    │   │   │   │
│  │  │  │ 🔧 Azure CLI (pre-configured)      │   │   │   │
│  │  │  │ 🌐 Node.js + MCP tools (ready)     │   │   │   │
│  │  │  │ 💻 VS Code Server (auto-setup)     │   │   │   │
│  │  │  │ 🔑 Secrets (GitHub-managed)        │   │   │   │
│  │  │  │ 🚀 Zero manual configuration       │   │   │   │
│  │  │  └─────────────────────────────────────┘   │   │   │
│  │  └─────────────────────────────────────────────┘   │   │
│  └─────────────────────────────────────────────────────┐   │
│                                                          │
│  Setup Time: 30-60 seconds (fully automated)            │
│  Consistency: Identical for every developer             │
│  Isolation: Complete container + VM isolation           │
└─────────────────────────────────────────────────────────────┘
```

## Container Architecture Deep Dive

### Dev Container Structure

```
📁 .devcontainer/
├── 📄 devcontainer.json          # Environment definition
├── 🔧 post-create.sh            # One-time setup script
├── ⚡ post-start.sh             # Session startup script
├── 📊 environment.yml           # Conda environment spec
└── 📚 CODESPACES.md             # User guide

devcontainer.json defines:
┌─────────────────────────────────────┐
│ Base Image: Python 3.12            │
│ Features: Azure CLI, Conda, Git     │
│ Extensions: Jupyter, Python, AI     │
│ Ports: 8000, 7860, 8888, 8501     │
│ Scripts: Automated setup commands   │
│ Settings: Python path, formatters   │
└─────────────────────────────────────┘
```

### Automation Workflow

```
🚀 Codespace Creation
    │
    ▼
📥 Clone Repository
    │
    ▼
🐳 Build Container (devcontainer.json)
    │
    ├── Pull base image (Python 3.12)
    ├── Install features (Azure CLI, Conda)
    ├── Configure VS Code extensions
    └── Set environment variables
    │
    ▼
⚙️ Post-Create Setup (post-create.sh)
    │
    ├── Create conda environment
    ├── Install AI/ML packages
    ├── Configure Jupyter kernels
    └── Verify installations
    │
    ▼
✅ Environment Ready
    │
    ▼
🎯 Every Session Start (post-start.sh)
    │
    ├── Activate conda environment
    ├── Check API key configuration
    ├── Display welcome message
    └── Ready for development
```

## Port Forwarding Architecture

### Local Development Ports

```
Your Local Machine:
┌─────────────────────────────────────┐
│ 🌐 localhost:8888 → Jupyter Lab    │
│ 🔗 localhost:8000 → Chainlit Apps  │
│ 📊 localhost:8501 → Streamlit      │
│ 🎨 localhost:7860 → Gradio         │
│ 🔧 localhost:5000 → Flask/Debug    │
└─────────────────────────────────────┘
```

### Codespaces Port Forwarding

```
GitHub Codespaces:
┌─────────────────────────────────────┐
│          Cloud Container            │
│ ┌─────────────────────────────────┐ │
│ │ 🌐 :8888 → Jupyter Lab         │ │
│ │ 🔗 :8000 → Chainlit Apps       │ │
│ │ 📊 :8501 → Streamlit           │ │
│ │ 🎨 :7860 → Gradio              │ │
│ └─────────────────────────────────┘ │
│              ▼ Automatic            │
│           Port Forwarding           │
│              ▼                      │
│ 🔒 Secure HTTPS URLs:              │
│ • https://[random]-8888.app.github. │
│   dev (Jupyter - opens browser)    │
│ • https://[random]-8000.app.github. │
│   dev (Apps - opens preview)       │
└─────────────────────────────────────┘
```

## Security Architecture

### Local Development Security

```
┌─────────────────────────────────────┐
│           Local Security            │
├─────────────────────────────────────┤
│ 🔑 .env file (plain text)          │
│ 📁 Git ignore patterns (.env)      │
│ 🔒 File system permissions         │
│ ⚠️  Risk: Accidental commits       │
│ ⚠️  Risk: Shared computer access    │
│ ⚠️  Risk: Backup exposure          │
└─────────────────────────────────────┘
```

### Codespaces Security

```
┌─────────────────────────────────────┐
│         GitHub Codespaces           │
├─────────────────────────────────────┤
│ 🔐 GitHub Secrets (encrypted)      │
│ 🛡️  Enterprise key management      │
│ 🚫 No git commit risk              │
│ 🔄 Automatic key rotation support  │
│ 👥 Team/org secret sharing         │
│ 🏢 SOC 2 / ISO 27001 compliance    │
└─────────────────────────────────────┘
```

## Resource Architecture

### Local Development Resources

```
Your Hardware:
┌─────────────────────────────────────┐
│ 💾 RAM: Limited by your system     │
│ 🖥️  CPU: Your processor cores      │
│ 💿 Storage: Your available disk    │
│ 🔋 Battery: Laptop power drain     │
│ 🌡️  Thermal: Potential throttling   │
│ 🌐 Network: Your internet speed    │
└─────────────────────────────────────┘
```

### Codespaces Resources

```
Azure Cloud Infrastructure:
┌─────────────────────────────────────┐
│ 💾 RAM: 8GB-32GB (configurable)    │
│ 🖥️  CPU: 2-8 cores (configurable)  │
│ 💿 Storage: 32GB+ SSD              │
│ ⚡ Power: Always plugged in        │
│ ❄️  Cooling: Datacenter optimal     │
│ 🌐 Network: High-speed backbone    │
└─────────────────────────────────────┘
```

This visual guide complements the comprehensive architecture documentation and helps developers understand the technical differences between development approaches.
