# Development Environment Quick Reference

## TL;DR - Choose Your Path

### 🚀 Just Want to Start Learning? → Use Codespaces
- Click [![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?repo=ai-agents-for-beginners)
- Wait 30-60 seconds
- Start coding immediately
- Perfect for course completion

### 💻 Building Long-term Projects? → Use Local Setup
- Follow [local setup guide](./README.md)
- 1-3 hours initial setup
- Full control and customization
- Works offline

## Quick Comparison

| Need | Local Setup | Codespaces |
|------|-------------|------------|
| **Start learning in 1 minute** | ❌ | ✅ |
| **No installation required** | ❌ | ✅ |
| **Works on any device** | ❌ | ✅ |
| **Completely free** | ✅ | ❌ ($7-29 for course) |
| **Works offline** | ✅ | ❌ |
| **Full customization** | ✅ | 🟡 Limited |

## Architecture Summary

```
Local Development:
You → Your Machine → Python + Dependencies → Manual Setup (1-3 hours)

Codespaces:
You → Browser/VS Code → GitHub Cloud → Pre-configured Environment (30 seconds)
```

## Common Questions

**Q: I'm new to programming. Which should I choose?**
A: Codespaces. Zero setup means you can focus on learning AI agents, not fighting with installations.

**Q: I'm planning to build production AI agents after this course.**
A: Start with Codespaces for learning, then switch to local setup for extended development.

**Q: I have a slow computer. Will this work?**
A: Codespaces runs in the cloud, so your local hardware doesn't matter. Even works on tablets and Chromebooks.

**Q: I don't have a GitHub account.**
A: You'll need one for course materials anyway (GitHub Models API). Sign up at [github.com](https://github.com).

**Q: How much does Codespaces cost?**
A: Free accounts get 120 core-hours/month. This course needs ~20-40 hours. Cost: $7-29 total.

**Q: Can I switch between local and Codespaces?**
A: Yes! Your code is stored in Git. You can use both approaches with the same repository.

## Quick Setup Links

### For Codespaces:
1. [Create Codespace](https://github.com/codespaces/new?repo=ai-agents-for-beginners) 
2. Set up [GitHub Personal Access Token](https://github.com/settings/personal-access-tokens)
3. Add token to [Codespaces Secrets](https://github.com/settings/codespaces)
4. Start coding! 🎉

### For Local Setup:
1. Install [Python 3.12+](https://python.org)
2. Install [VS Code](https://code.visualstudio.com)
3. Clone repository: `git clone [repo-url]`
4. Install dependencies: `pip install -r requirements.txt`
5. Set up `.env` file with API keys

## Troubleshooting Quick Fixes

### Codespaces Issues:
- **Container won't start**: Check repository permissions
- **Jupyter not working**: Wait for post-create script to finish
- **API keys not working**: Verify Codespaces secrets configuration

### Local Issues:
- **Python not found**: Check PATH and Python installation
- **Package install fails**: Use virtual environment: `python -m venv ai-agents-env`
- **VS Code not detecting Python**: Select interpreter: Ctrl+Shift+P → "Python: Select Interpreter"

## Security Best Practices

### API Key Management:
- **Codespaces**: Use GitHub Secrets (recommended)
- **Local**: Use `.env` files (never commit to git)
- **Both**: Use minimal permissions for tokens
- **Both**: Rotate keys regularly

## Need More Details?

- **Full Architecture Guide**: [Development Environments Architecture Guide](./DEVELOPMENT_ENVIRONMENTS_GUIDE.md)
- **Visual Diagrams**: [Architecture Diagrams](./ARCHITECTURE_DIAGRAMS.md)  
- **Complete Setup**: [Course Setup README](./README.md)
- **Codespaces Guide**: [Codespaces Documentation](../.devcontainer/CODESPACES.md)

## Get Help

- **Discord**: [AI Agents Community](https://aka.ms/ai-agents/discord)
- **Issues**: [GitHub Issues](https://github.com/microsoft/ai-agents-for-beginners/issues)
- **Documentation**: Course README files in each lesson folder

---

**Ready to start building AI agents?** Choose your path above and let's code! 🤖🚀
