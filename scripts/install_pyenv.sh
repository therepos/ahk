#!/bin/bash

# wget -qO- https://raw.githubusercontent.com/<username>/<repo>/<branch>/scripts/install_pyenv.sh | sudo bash
# curl -sSL https://raw.githubusercontent.com/<username>/<repo>/<branch>/scripts/install_pyenv.sh | sudo bash

# Ensure sudo is available
if ! command -v sudo &> /dev/null; then
    echo "sudo is not installed or available. Please install sudo or run as root."
    exit 1
fi

# Update and install required dependencies
echo "Updating system packages and installing dependencies..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y build-essential curl libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python3-openssl git

# Install pyenv
echo "Installing pyenv..."
curl https://pyenv.run | bash

# Configure shell for pyenv
echo "Configuring shell to enable pyenv..."
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if ! grep -q 'export PYENV_ROOT' ~/.bashrc; then
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
  echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
  echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init --path)"\nfi' >> ~/.bashrc
fi

# Apply changes to the current session
eval "$(pyenv init --path)"

# Verify pyenv installation
echo "Verifying pyenv installation..."
if command -v pyenv >/dev/null 2>&1; then
  echo "pyenv installed successfully!"
  pyenv --version
else
  echo "pyenv installation failed!"
  exit 1
fi

# Automatically detect the latest stable Python version
echo "Detecting the latest stable Python version..."
latest_python_version=$(pyenv install --list | grep -E "^\s*3\.[0-9]+\.[0-9]+$" | tail -1 | tr -d '[:space:]')
if [[ -n "$latest_python_version" ]]; then
  echo "Latest Python version detected: $latest_python_version"
  echo "Installing Python $latest_python_version..."
  pyenv install "$latest_python_version"
  pyenv global "$latest_python_version"
  echo "Python $latest_python_version installed and set as global default!"
else
  echo "Failed to detect the latest Python version."
  exit 1
fi

# Final verification
echo "Installation complete. Verifying Python version..."
python --version
pip --version
