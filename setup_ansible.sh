#!/bin/bash
# Define the playbook file path
PLAYBOOK_FILE="/ansible-secure-server/secure-server-setup.yml"
# Function to install Ansible
install_ansible() {
    echo "Installing Ansible..."
    sudo apt update
    sudo apt install -y software-properties-common
    sudo apt-add-repository --yes --update ppa:ansible/ansible
    sudo apt install -y ansible
    echo "Ansible installed successfully."
}
# Check if Ansible is installed
if ! command -v ansible &> /dev/null
then
    install_ansible
else
    echo "Ansible is already installed."
fi
# Run the playbook
echo "Running Secure setup playbook..."
ansible-playbook $PLAYBOOK_FILE
echo "Setup completed."

