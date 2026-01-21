#!/bin/bash
# Lab 1 Setup Script

# 1. Create a non-root user
sudo adduser opsadmin --gecos "Ops Admin,,," --disabled-password
echo "opsadmin:ChangeMe123" | sudo chpasswd
sudo usermod -aG sudo opsadmin
echo "User 'opsadmin' created and added to sudo group."

# 2. Apply network configuration
echo "Applying network config..."
sudo cp ../config/network.conf /etc/network/interfaces
sudo systemctl restart networking
echo "Network configuration applied."

