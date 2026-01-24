#!/bin/bash
# Install packages
sudo apt update && sudo apt install -y vim git curl

# Run SSH hardening
bash /vagrant/provisioning/ssh_hardening.sh

echo "Provisioning completed"

