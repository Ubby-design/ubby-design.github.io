#!/bin/bash
# Lab 1 Hardening Script

# 1. Disable root SSH login
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo systemctl restart sshd
echo "Root login disabled and SSH restarted."

# 2. Apply firewall rules
echo "Applying firewall rules..."
sudo iptables-restore < ../config/firewall.rules
sudo ufw enable
sudo ufw status verbose
echo "Firewall configured."

