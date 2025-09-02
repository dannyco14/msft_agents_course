#!/bin/bash

# AI Agents Course - Post-Create Script for Codespaces
# This script runs after the container is created to set up the conda environment

set -e

echo "🚀 Starting AI Agents Course setup with Conda..."

# Initialize conda for bash
echo "� Initializing conda..."
/opt/conda/bin/conda init bash
source ~/.bashrc

# Create conda environment from environment.yml
echo "� Creating AI Agents conda environment..."
if [ -f "environment.yml" ]; then
    /opt/conda/bin/conda env create -f environment.yml
    echo "✅ Conda environment 'ai-agents' created successfully"
else
    echo "❌ environment.yml not found, creating basic environment..."
    /opt/conda/bin/conda create -n ai-agents python=3.12 -y
fi

# Activate the environment
echo "🔄 Activating ai-agents environment..."
source /opt/conda/bin/activate ai-agents

# Install additional packages if requirements.txt exists (fallback)
if [ -f "requirements.txt" ]; then
    echo "📋 Installing additional packages from requirements.txt..."
    pip install -r requirements.txt
fi

# Install IPython kernel for Jupyter
echo "🔧 Setting up Jupyter kernel..."
python -m ipykernel install --user --name ai-agents --display-name "Python 3.12 (AI Agents)"

# Configure VS Code Python interpreter
echo "🐍 Configuring Python interpreter for VS Code..."
mkdir -p .vscode
cat > .vscode/settings.json << 'EOF'
{
    "python.defaultInterpreterPath": "/opt/conda/envs/ai-agents/bin/python",
    "python.pythonPath": "/opt/conda/envs/ai-agents/bin/python",
    "python.condaPath": "/opt/conda/bin/conda"
}
EOF

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
