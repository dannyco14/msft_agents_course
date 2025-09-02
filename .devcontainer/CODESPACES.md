# Running in GitHub Codespaces

This repository is fully configured to run in GitHub Codespaces with zero local setup required! 🚀

> 📚 **Want to understand the architecture?** Check out our comprehensive [Development Environments Architecture Guide](../00-course-setup/DEVELOPMENT_ENVIRONMENTS_GUIDE.md) to learn how Codespaces compares to local development and why we built this infrastructure.

## 🌟 What's Included

This Codespaces environment provides everything you need to learn AI Agents:

### 🐍 Python Environment
- **Python 3.12** (latest stable version matching course requirements)
- **All course dependencies** pre-installed from `requirements.txt`
- **Jupyter Lab & Notebook** ready to use
- **Code formatting tools** (Black, isort, flake8)

### 🔧 Development Tools
- **Azure CLI** for Azure service integration
- **Node.js 18** for web-based tools and interfaces
- **Git** configuration optimized for Codespaces
- **VS Code extensions** for Python, Jupyter, and Azure development

### 🌐 Auto-Forwarded Ports
- **8888**: Jupyter Lab/Notebook (opens automatically)
- **8000**: Chainlit/Uvicorn applications
- **7860**: Gradio interfaces
- **8501**: Streamlit applications  
- **5000**: Flask/Debug servers
- **3000**: Node.js/React applications

## 🚀 Quick Start

### 1. Set Up Your Environment

The most important step is configuring your API keys. You have two options:

#### Option A: Codespaces Secrets (Recommended)
1. Go to your GitHub Settings → Codespaces → Secrets
2. Add the following secrets:
   ```
   GITHUB_TOKEN=your_github_token_here
   AZURE_OPENAI_API_KEY=your_azure_key_here (if using Azure)
   AZURE_OPENAI_ENDPOINT=your_azure_endpoint_here (if using Azure)
   ```

#### Option B: Local .env File
1. Copy the template: `cp .env.example .env`
2. Edit `.env` and add your API keys
3. The `.env` file is gitignored for security

### 2. Start Learning!

```bash
# Navigate to the first lesson
cd 01-intro-to-ai-agents/code_samples

# Open a Jupyter notebook
# The notebook will open in VS Code's integrated Jupyter interface
```

### 3. Run Applications

```bash
# Start Jupyter Lab (if you prefer the web interface)
jupyter lab --ip=0.0.0.0 --port=8888 --no-browser

# Run a Chainlit app
chainlit run app.py --host 0.0.0.0 --port 8000

# Run any Python script
python your_script.py
```

## 🔑 Required API Keys

### GitHub Models (Free Tier)
- **What**: Access to OpenAI GPT, Meta Llama, and other models
- **Required**: `GITHUB_TOKEN` with Models scope
- **Setup**: [GitHub Personal Access Tokens](https://github.com/settings/personal-access-tokens)
- **Cost**: Free with rate limits

### Azure OpenAI (Paid)
- **What**: Direct access to Azure OpenAI services
- **Required**: `AZURE_OPENAI_API_KEY`, `AZURE_OPENAI_ENDPOINT`
- **Setup**: [Azure OpenAI Service](https://azure.microsoft.com/products/ai-services/openai-service)
- **Cost**: Pay-per-use

### Azure AI Foundry (Paid)
- **What**: Comprehensive AI development platform
- **Required**: `PROJECT_ENDPOINT`
- **Setup**: [Azure AI Foundry](https://ai.azure.com)
- **Cost**: Pay-per-use

## 📚 Course Structure

This course contains 11+ lessons covering:

1. **Introduction to AI Agents** - Basic concepts and use cases
2. **Agentic Frameworks** - Semantic Kernel, AutoGen exploration  
3. **Design Patterns** - Core agentic design principles
4. **Tool Use** - How agents interact with external tools
5. **Agentic RAG** - Retrieval-Augmented Generation for agents
6. **Trustworthy Agents** - Security and reliability considerations
7. **Planning Design** - Strategic thinking in AI agents
8. **Multi-Agent Systems** - Coordinating multiple agents
9. **Metacognition** - Self-aware and reflective agents
10. **Production Deployment** - Scaling agents for real-world use
11. **Agentic Protocols** - MCP, A2A, and NLWeb standards

## 🛠️ Development Workflow

### Working with Jupyter Notebooks
1. **Open notebooks** directly in VS Code (recommended)
2. **Select kernel**: Choose "Python 3.12 (AI Agents)" kernel
3. **Auto-save**: Notebooks save automatically
4. **Run cells**: Use Shift+Enter or click Run button

### Code Quality
- **Auto-formatting**: Black runs on save for Python files
- **Import organization**: isort organizes imports automatically  
- **Linting**: flake8 highlights potential issues
- **Type checking**: Pylance provides rich IntelliSense

### Azure Integration
```bash
# Login to Azure (device code flow for Codespaces)
az login --use-device-code

# Check your subscription
az account show

# List available resources
az resource list --output table
```

## 🎯 Course Examples

Each lesson includes multiple code samples:

### Semantic Kernel Examples
- File pattern: `*-semantic-kernel.ipynb`
- Uses: Semantic Kernel framework + GitHub Models or Azure OpenAI
- Best for: Learning SK-specific patterns and plugins

### AutoGen Examples  
- File pattern: `*-autogen.ipynb`
- Uses: AutoGen framework + GitHub Models
- Best for: Multi-agent conversations and workflows

### Azure AI Agent Service Examples
- File pattern: `*azureaiagent.ipynb`
- Uses: Azure AI Foundry + Azure AI Agent Service
- Best for: Production-ready agent deployments

## 🐛 Troubleshooting

### Common Issues

**Jupyter kernel not found**
```bash
python -m ipykernel install --user --name python3 --display-name "Python 3.12 (AI Agents)"
```

**Package import errors**
```bash
pip install -r requirements.txt --force-reinstall
```

**Azure CLI login issues**
```bash
az login --use-device-code
az account set --subscription "your-subscription-id"
```

**Port forwarding not working**
- Check the Ports tab in VS Code terminal panel
- Manually forward ports: F1 → "Forward a Port"

### Environment Issues

**API keys not working**
1. Verify keys are correctly set in Codespaces secrets or `.env`
2. Restart the terminal: `source ~/.bashrc`
3. Check environment: `printenv | grep -E "(GITHUB_TOKEN|AZURE_)"` 

**Permission errors**
```bash
sudo chown -R vscode:vscode /workspaces/msft_agents_course
```

## 🔒 Security Best Practices

1. **Never commit API keys** to git (use secrets or .env)
2. **Use minimal permissions** for GitHub tokens
3. **Rotate keys regularly**, especially for production use
4. **Monitor usage** to detect unexpected API consumption
5. **Use different keys** for different environments

## 📝 Additional Resources

- **Course Discord**: [AI Agents Discord Channel](https://aka.ms/ai-agents/discord)
- **Course Repository**: [AI Agents for Beginners](https://github.com/microsoft/ai-agents-for-beginners)
- **GitHub Models**: [GitHub Models Marketplace](https://github.com/marketplace/models)
- **Azure AI Foundry**: [AI Foundry Documentation](https://docs.microsoft.com/azure/ai-foundry/)
- **Semantic Kernel**: [SK Documentation](https://docs.microsoft.com/semantic-kernel/)
- **AutoGen**: [AutoGen Documentation](https://microsoft.github.io/autogen/)

## 💡 Tips for Success

1. **Start with GitHub Models** - Free tier is perfect for learning
2. **Progress through lessons** in order for best understanding
3. **Experiment freely** - Codespaces provides a safe sandbox
4. **Ask questions** in the Discord community
5. **Share your projects** - Show what you've built!

---

Ready to build amazing AI Agents? Let's get started! 🎉🤖
