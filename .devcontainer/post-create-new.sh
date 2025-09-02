#!/bin/bash

# AI Agents Course - Post-Create Script for Codespaces
# This script runs after the container is created to set up the conda environment

set -e

echo "🚀 Starting AI Agents Course setup with Conda..."

# Initialize conda for bash
echo "🔧 Initializing conda..."
source /opt/conda/etc/profile.d/conda.sh

# Create conda environment from environment.yml
echo "📦 Creating AI Agents conda environment..."
if [ -f "environment.yml" ]; then
    conda env create -f environment.yml
    echo "✅ Conda environment 'ai-agents' created successfully"
else
    echo "❌ environment.yml not found, creating basic environment..."
    conda create -n ai-agents python=3.12 jupyter ipykernel -y
fi

# Activate the environment
echo "🔄 Activating ai-agents environment..."
conda activate ai-agents

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
    "python.condaPath": "/opt/conda/bin/conda"
}
EOF

# Create .env file from template if it doesn't exist
echo "⚙️ Setting up environment configuration..."
if [ ! -f ".env" ] && [ -f ".env.example" ]; then
    cp .env.example .env
    echo "✅ Created .env file from template"
    echo "⚠️  Please configure your API keys in .env"
else
    echo "ℹ️  .env file already exists or no template found"
fi

# Set up useful aliases
echo "🔧 Setting up helpful aliases..."
cat >> ~/.bashrc << 'EOF'

# AI Agents Course aliases
alias ll='ls -la'
alias activate-ai='conda activate ai-agents'
alias start-jupyter='jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root'
alias env-info='conda info --envs && python --version && which python'
EOF

echo ""
echo "🎉 Setup complete!"
echo ""
echo "📚 Next steps:"
echo "  1. Configure .env file with your API keys"
echo "  2. Run 'conda activate ai-agents' to activate the environment"
echo "  3. Check lesson 01: cd 01-intro-to-ai-agents/code_samples"
echo ""
echo "Happy coding! 🎯"
