#!/bin/bash
# Exit immediately if any command fails
set -e

echo "Updating system packages..."
apt-get update && apt-get upgrade -y

echo "Installing essential packages (curl, wget, git, python3, python3-pip)..."
apt-get install -y curl wget git python3 python3-pip python3.10-venv python3-tk git git-lfs libgl1-mesa-glx

# -----------------------------
# Install Tailscale
# -----------------------------
echo "Installing Tailscale..."
curl -fsSL https://tailscale.com/install.sh | sh
echo "To start Tailscale, run:"
echo "  sudo tailscale up --authkey <YOUR_AUTH_KEY>  --advertise-exit-node --advertise-routes=192.168.x.0/24 --reset
"

# -----------------------------
# Install FileBrowser (web-based file manager)
# -----------------------------
echo "Installing FileBrowser..."
curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash
echo "To start FileBrowser, run:"
echo "  filebrowser -r / -p 8080"

# -----------------------------
# Install Kohya-ss (Kohya's GUI) from sd3-flux.1 branch
# -----------------------------
echo "Cloning Kohya-ss (sd3-flux.1 branch)..."
git clone -b sd3-flux.1 https://github.com/bmaltais/kohya_ss.git ~/kohya_ss
cd ~/kohya_ss
echo "Running Kohya-ss setup script (this may take a few minutes)..."
./setup.sh
cd -
echo "Kohya-ss installation complete!"
echo "To run Kohya-ss GUI, navigate to ~/kohya_ss and execute:"
echo "  ./gui.sh"

echo "All installations complete! Enjoy your development environment."
