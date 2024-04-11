#!/bin/bash

# Function to install Ansible
install_ansible() {
    echo "Installing Ansible..."
    sudo apt update
    sudo apt install -y software-properties-common
    sudo apt-add-repository --yes --update ppa:ansible/ansible
    sudo apt install -y ansible
    echo "Ansible installed successfully."
}

# Determine the directory of the script
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

# Check if Ansible is installed
if ! command -v ansible &> /dev/null; then
    install_ansible
else
    echo "Ansible is already installed."
fi

# Change directory to the cloned repo
cd "$SCRIPT_DIR"

# Run the playbook
ansible-playbook secure_server_setup.yml
