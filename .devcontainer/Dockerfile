FROM mcr.microsoft.com/devcontainers/python:3.10-bookworm

LABEL maintainer="Microsoft AI Agents Course Team"
LABEL description="Development container for Microsoft AI Agents Course"

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    git \
    bash-completion \
    ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Configure Python environment
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100

# Upgrade pip and install development tools
RUN python -m pip install --upgrade pip && \
    pip install --no-cache-dir \
    black \
    pylint \
    ipykernel \
    pytest \
    pytest-cov

# Create a non-root user
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && rm -rf /var/lib/apt/lists/*

# Set up git configuration
RUN git config --system core.editor "code --wait" && \
    git config --system init.defaultBranch main

# Create and set working directory
WORKDIR /workspace
RUN chown ${USERNAME}:${USERNAME} /workspace

# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=dialog

# Set the default user
USER $USERNAME

# Note: requirements.txt will be mounted and installed by devcontainer.json