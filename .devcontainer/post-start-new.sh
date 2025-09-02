#!/bin/bash

# AI Agents Course - Post-Start Script for Codespaces
# This script runs every time the container starts

echo "🔄 Starting AI Agents Course session..."

# Activate conda environment if it exists
if [ -d "/opt/conda/envs/ai-agents" ]; then
    echo "🐍 Conda Environment:"
    source /opt/conda/etc/profile.d/conda.sh
    conda activate ai-agents
    echo "  Environment: $CONDA_DEFAULT_ENV"
    echo "  Python: $(which python)"
    echo "  Version: $(python --version)"
else
    echo "⚠️  ai-agents environment not found. Run setup first."
fi

# Check if required environment variables are set
echo ""
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

# Track configuration status
config_issues=0

# Check for GitHub Models API
if ! check_env_var "GITHUB_TOKEN"; then
    config_issues=$((config_issues + 1))
fi

# Check for Azure services (optional)
if ! check_env_var "AZURE_OPENAI_API_KEY"; then
    echo "ℹ️  AZURE_OPENAI_API_KEY not configured (optional)"
fi

if ! check_env_var "PROJECT_ENDPOINT"; then
    echo "ℹ️  PROJECT_ENDPOINT not configured (optional)"
fi

echo ""
if [ $config_issues -eq 0 ]; then
    echo "🎉 All required environment variables are configured!"
else
    echo "⚠️  Some environment variables need configuration."
    echo "   Check .env file or add Codespaces secrets."
fi

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
