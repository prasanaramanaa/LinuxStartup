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

# -----------------------------
# Install FileBrowser (web-based file manager)
# -----------------------------
echo "Installing FileBrowser..."
curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash
echo "To start FileBrowser, run:"
echo "  filebrowser -r / -p 8080"

# -----------------------------
# Install Kohya-ss (Stable Diffusion scripts)
# -----------------------------
echo "Cloning the kohya-ss repository..."
git clone https://github.com/kohya-ss/sd-scripts.git ~/kohya-ss
cd ~/kohya-ss

echo "Installing Python dependencies for kohya-ss..."
pip3 install -r requirements.txt

# Return to the original directory
cd -

# -----------------------------
# Download and setup hfd.sh script
# -----------------------------
echo "Downloading hfd.sh script..."
wget -O hfd.sh https://gist.githubusercontent.com/CCCarloooo/5a568cc3493532807fe01b9819b9977f/raw/1c7c6d5d7fecb99196f2d3beb34deb24d6530cbf/hfd.sh

echo "Making hfd.sh executable..."
chmod a+x hfd.sh

echo "Setting alias 'hfd' for the current session..."
alias hfd="$PWD/hfd.sh"
echo "To make the alias permanent, add the following line to your shell configuration (e.g. ~/.bashrc):"
echo "alias hfd=\"$PWD/hfd.sh\""

echo "Installation complete!"
echo "Next steps:"
echo "1. For Tailscale: Run 'sudo tailscale up --authkey <YOUR_AUTH_KEY>' to authenticate."
echo "2. For FileBrowser: Run 'filebrowser -r / -p 8080' to launch the web file manager."
echo "3. For kohya-ss: Check out the README in ~/kohya-ss for instructions."
echo "4. To run the hfd.sh script, simply type 'hfd' in your terminal."
