
# Pyenv Installer and Uninstaller

This repository provides standalone shell scripts to **install** and **uninstall** [pyenv](https://github.com/pyenv/pyenv) on Linux-based systems. These scripts automate the setup and cleanup process, making it easy for users to manage `pyenv` without manual intervention.

---

## Usage

### Install Pyenv
To install `pyenv` and the latest stable Python version:
```bash
wget -qO- https://raw.githubusercontent.com/therepos/main/scripts/install-pyenv.sh | bash
```
or:
```bash
curl -sSL https://raw.githubusercontent.com/therepos/main/scripts/install-pyenv.sh | bash
```

### Uninstall Pyenv
To completely remove `pyenv` and all its configurations:
```bash
wget -qO- https://raw.githubusercontent.com/therepos/main/scripts/uninstall-pyenv.sh | bash
```
or:
```bash
curl -sSL https://raw.githubusercontent.com/therepos/main/scripts/uninstall_pyenv.sh | bash
```

---

## Features
- **Installation Script**:
  - Installs `pyenv` and its dependencies.
  - Automatically detects and installs the latest stable Python version.
  - Configures the shell environment for `pyenv`.

- **Uninstallation Script**:
  - Removes `pyenv`, all installed Python versions, and associated shell configurations.
  - Cleans up system dependencies installed during the setup.

---

## Prerequisites
- Linux-based system with `bash`.
- `wget` or `curl` installed.

For uninstallation, you may need `sudo` access to remove system dependencies.

---

## Notes
- These scripts are designed for **Linux-based systems** (e.g., Ubuntu). They may need adjustments for other operating systems or distributions.
- Changes to shell initialization files (`~/.bashrc` or `~/.profile`) will apply after restarting your terminal or reloading the shell (`source ~/.bashrc`).

---

## Contributing
Feel free to submit issues or pull requests if you encounter any bugs or have suggestions for improvement.

---

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
