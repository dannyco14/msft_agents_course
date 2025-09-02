#!/bin/bash

# AI Agents Course - Post-Start Script for Codespaces
# This script runs every time the container starts

set -e

echo "🔄 Starting AI Agents Course session..."

# Activate conda environment
source /opt/conda/bin/activate ai-agents

# Check conda environment
echo "🐍 Conda Environment:"
echo "  Environment: $CONDA_DEFAULT_ENV"
echo "  Python: $(which python)"
echo "  Version: $(python --version)"

# Check if required environment variables are set
echo "🔍 Checking environment configuration..."

# Function to check if env var is set and not empty
check_env_var() {
    local var_name=$1
    local var_value=$(printenv "$var_name" 2>/dev/null || echo "")
    
    if [ -z "$var_value" ] || [ "$var_value" = "..." ]; then
        echo "⚠️  $var_name is not configured"
        return 1
    else
        echo "✅ $var_name is configured"
        return 0
    fi
}

# Check common environment variables
env_issues=0

# GitHub Models setup
if ! check_env_var "GITHUB_TOKEN"; then
    env_issues=$((env_issues + 1))
fi

# Azure OpenAI setup (optional)
if [ -n "$(printenv AZURE_OPENAI_ENDPOINT 2>/dev/null)" ]; then
    check_env_var "AZURE_OPENAI_API_KEY" || env_issues=$((env_issues + 1))
    check_env_var "AZURE_OPENAI_CHAT_DEPLOYMENT_NAME" || env_issues=$((env_issues + 1))
fi

# Azure AI Foundry setup (optional)
if [ -n "$(printenv PROJECT_ENDPOINT 2>/dev/null)" ]; then
    echo "✅ Azure AI Foundry PROJECT_ENDPOINT is configured"
fi

# Display environment status
if [ $env_issues -eq 0 ]; then
    echo "🎉 Environment looks good! You're ready to start."
else
    echo ""
    echo "⚙️ Environment Setup Needed:"
    echo "  • Edit your .env file or set Codespaces secrets"
    echo "  • At minimum, set GITHUB_TOKEN for GitHub Models"
    echo "  • See .env.example for all available options"
    echo "  • Restart the terminal after making changes"
fi

# Check if we're in a Codespaces environment
if [ -n "$CODESPACES" ]; then
    echo ""
    echo "🌐 Running in GitHub Codespaces"
    echo "  • Workspace: $GITHUB_REPOSITORY"
    echo "  • Codespace: $CODESPACE_NAME"
    echo ""
fi

# Display port forwarding info
echo "🔗 Available Ports:"
echo "  • 8888: Jupyter Lab/Notebook"
echo "  • 8000: Chainlit/Uvicorn apps"
echo "  • 7860: Gradio apps"
echo "  • 8501: Streamlit apps"
echo ""

# Quick health check
echo "🏥 System Health Check:"
echo "  • Python: $(python --version)"
echo "  • Pip packages: $(pip list | wc -l) installed"
echo "  • Azure CLI: $(az --version | head -1 | cut -d' ' -f2)"
echo "  • Git: $(git --version)"
echo ""

echo "Ready to build AI Agents! 🤖✨"
