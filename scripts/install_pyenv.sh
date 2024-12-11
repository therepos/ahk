#!/bin/bash

# wget -qO- https://raw.githubusercontent.com/<username>/<repo>/<branch>/scripts/install_pyenv.sh | sudo bash
# curl -sSL https://raw.githubusercontent.com/<username>/<repo>/<branch>/scripts/install_pyenv.sh | sudo bash

#!/bin/bash

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
if ! grep -q 'export PYENV_ROOT' ~/.bashrc; then
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
  echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
  echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init --path)"\nfi' >> ~/.bashrc
fi

# Reload bashrc
source ~/.bashrc

# Verify installation
echo "Verifying pyenv installation..."
if command -v pyenv >/dev/null 2>&1; then
  echo "pyenv installed successfully!"
  pyenv --version
else
  echo "pyenv installation failed!"
  exit 1
fi

# Prompt for Python version
read -p "Enter the Python version you want to install (e.g., 3.11.5): " python_version
if [[ -n "$python_version" ]]; then
  echo "Installing Python $python_version..."
  pyenv install "$python_version"
  pyenv global "$python_version"
  echo "Python $python_version installed and set as global default!"
else
  echo "No Python version provided. Skipping Python installation."
fi

# Final verification
echo "Installation complete. Verifying Python version..."
python --version
pip --version


