# Running in GitHub Codespaces

This repo includes a Dev Container configured for GitHub Codespaces. The changes here ensure everything runs smoothly without any local setup.

## What’s included

- Python 3.12 base image (matches course requirement)
- Azure CLI feature preinstalled
- Notebook kernels preconfigured (ipykernel)
- Auto-forwarded ports: 8000 (Uvicorn/Chainlit), 7860 (Gradio), 8888 (Jupyter)

## Secrets and environment variables

Create Codespaces repo secrets for any variables you need from `.env.example` (recommended). Common ones:

- `GITHUB_TOKEN`
- `PROJECT_ENDPOINT`
- `AZURE_OPENAI_API_KEY`, `AZURE_OPENAI_ENDPOINT`, `AZURE_OPENAI_API_VERSION`
- `AZURE_OPENAI_CHAT_DEPLOYMENT_NAME`, `AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME`
- `AZURE_SEARCH_SERVICE_ENDPOINT`, `AZURE_SEARCH_API_KEY`

When defined as Codespaces secrets, they are injected into the container environment automatically. You can also create a local `.env` (not committed) if preferred.

## First run

The container will automatically:

1) Upgrade `pip`
2) Install `requirements.txt`
3) Register the local Jupyter kernel

Open any `*.ipynb` and select the default kernel. If you run web apps (e.g., Chainlit or Uvicorn), Codespaces will prompt to open the forwarded port.

## Helpful commands

- Login to Azure: `az login --use-device-code`
- Run a Uvicorn app: `uvicorn main:app --host 0.0.0.0 --port 8000`
- Run Chainlit: `chainlit run app.py -w --port 8000`

If you use different ports, Codespaces will still auto-forward and notify you.

