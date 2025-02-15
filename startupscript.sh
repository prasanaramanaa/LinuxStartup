#!/bin/bash
# Exit immediately if any command fails
set -e

echo "Updating system packages..."
apt-get update && apt-get upgrade -y

echo "Installing essential packages (curl, wget, git, python3, python3-pip)..."
apt-get install -y curl wget git python3 python3-pip python3.10-venv python3-tk git git-lfs

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
# Download and setup hfd.sh script permanently
# -----------------------------
echo "Downloading hfd.sh script..."
wget -O hfd.sh https://gist.githubusercontent.com/CCCarloooo/5a568cc3493532807fe01b9819b9977f/raw/1c7c6d5d7fecb99196f2d3beb34deb24d6530cbf/hfd.sh
echo "Making hfd.sh executable..."
chmod a+x hfd.sh

# Create a permanent directory for hfd.sh and move it there.
sudo mkdir -p /opt/hfd
sudo mv hfd.sh /opt/hfd/hfd.sh
sudo chmod a+x /opt/hfd/hfd.sh

# Add a permanent alias to ~/.bashrc so that 'hfd' is always available.
echo "Adding permanent alias 'hfd' to ~/.bashrc..."
echo "alias hfd='/opt/hfd/hfd.sh'" >> ~/.bashrc
source ~/.bashrc

echo "Alias 'hfd' has been set permanently. You can now run 'hfd' from any terminal."

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
