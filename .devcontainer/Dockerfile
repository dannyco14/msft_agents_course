FROM mcr.microsoft.com/devcontainers/python:3.12

# Install system dependencies
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install base Python tooling used across notebooks
RUN pip install --no-cache-dir \
    black \
    ipykernel

# The VS Code/Dev Containers spec mounts the repo under /workspaces/<name>
# The workspaceFolder is set in devcontainer.json, so no WORKDIR override here.
