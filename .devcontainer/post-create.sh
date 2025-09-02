#!/bin/bash

# AI Agents Course - Post-Create Script for Codespaces
# This script runs after the container is created to set up the development environment

set -e

echo "🚀 Starting AI Agents Course setup..."

# Update pip to latest version
echo "📦 Updating pip..."
python -m pip install --upgrade pip

# Install Python requirements
echo "📋 Installing Python requirements..."
if [ -f "requirements.txt" ]; then
    python -m pip install -r requirements.txt
    echo "✅ Requirements installed successfully"
else
    echo "❌ requirements.txt not found"
fi

# Install IPython kernel for Jupyter
echo "🔧 Setting up Jupyter kernel..."
python -m ipykernel install --user --name python3 --display-name "Python 3.12 (AI Agents)"

# Create .env file from template if it doesn't exist
echo "⚙️ Setting up environment configuration..."
if [ ! -f ".env" ] && [ -f ".env.example" ]; then
    cp .env.example .env
    echo "📋 Created .env file from template. Please configure your API keys."
else
    echo "📋 .env file already exists or no template found"
fi

# Set up Git configuration for Codespaces
echo "🔧 Configuring Git..."
git config --global --add safe.directory /workspaces/msft_agents_course

# Create helpful directories
echo "📁 Creating workspace directories..."
mkdir -p ~/workspace/temp
mkdir -p ~/workspace/logs
mkdir -p ~/workspace/data

# Install additional helpful packages for AI development
echo "🤖 Installing additional AI development tools..."
python -m pip install --no-cache-dir \
    jupyterlab-git \
    jupyter-ai \
    jupyterlab-lsp \
    python-lsp-server[all] || echo "⚠️ Some optional packages failed to install"

# Display helpful information
echo ""
echo "🎉 Setup complete! Here's what you can do:"
echo ""
echo "📚 Course Information:"
echo "  • This course has 11+ lessons on AI Agents"
echo "  • Code samples use Semantic Kernel, AutoGen, and Azure AI"
echo "  • Each lesson includes Jupyter notebooks"
echo ""
echo "🔧 Development Environment:"
echo "  • Python 3.12 with all required packages"
echo "  • Jupyter Lab/Notebook ready to use"
echo "  • Azure CLI pre-installed"
echo "  • Ports auto-forwarded: 8000, 7860, 8888, 8501"
echo ""
echo "⚡ Quick Start Commands:"
echo "  • Start Jupyter Lab: jupyter lab --ip=0.0.0.0 --port=8888 --no-browser"
echo "  • Start Jupyter Notebook: jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser"
echo "  • Run Chainlit app: chainlit run app.py --port 8000 --host 0.0.0.0"
echo "  • Check Python packages: pip list"
echo ""
echo "🔐 Environment Setup:"
echo "  • Configure .env file with your API keys"
echo "  • Available services: GitHub Models, Azure OpenAI, Azure AI Foundry"
echo "  • Check .env.example for required variables"
echo ""
echo "📖 Start Learning:"
echo "  • Begin with lesson 01: cd 01-intro-to-ai-agents/code_samples"
echo "  • Open any .ipynb file to start coding!"
echo ""
echo "Happy coding! 🎯"
