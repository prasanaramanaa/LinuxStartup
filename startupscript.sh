#!/bin/bash
# Exit immediately if any command fails
set -e

echo "Updating system packages..."
apt-get update && apt-get upgrade -y

echo "Installing essential packages (curl, wget, git, python3, python3-pip)..."
apt-get install -y curl wget git python3 python3-pip

# -----------------------------
# Install Tailscale
# -----------------------------
echo "Installing Tailscale..."
curl -fsSL https://tailscale.com/install.sh | sh
# After installation, you must start and authenticate Tailscale:
echo "To start Tailscale, run:"
echo "  sudo tailscale up --authkey <YOUR_AUTH_KEY>"
# For more details, see the official Tailscale install guide. :contentReference[oaicite:0]{index=0}

# -----------------------------
# Install FileBrowser
# -----------------------------
echo "Installing FileBrowser (web-based file manager)..."
curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash
# Once installed, you can start FileBrowser by running, for example:
echo "To start FileBrowser, run:"
echo "  filebrowser -r / -p 8080"
# This command will serve the root directory on port 8080.
# For more details, check out FileBrowser’s documentation. :contentReference[oaicite:1]{index=1}

# -----------------------------
# Install Kohya-ss (Stable Diffusion scripts)
# -----------------------------
echo "Cloning the kohya-ss repository..."
git clone https://github.com/kohya-ss/sd-scripts.git ~/kohya-ss
cd ~/kohya-ss

echo "Installing Python dependencies for kohya-ss..."
pip3 install -r requirements.txt
# Refer to the repository's README for further usage instructions.
# Repository: https://github.com/kohya-ss/sd-scripts :contentReference[oaicite:2]{index=2}

echo "Installation complete!"
echo "Next steps:"
echo "1. For Tailscale: Run 'sudo tailscale up --authkey <YOUR_AUTH_KEY>' to authenticate."
echo "2. For FileBrowser: Run 'filebrowser -r / -p 8080' to launch the web file manager."
echo "3. For kohya-ss: Check out the README in ~/kohya-ss for instructions on running the scripts."
