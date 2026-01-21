#!/bin/bash
# Apply firewall rules using iptables and enable UFW

echo "Applying firewall rules..."
sudo iptables-restore < ../config/firewall.rules

echo "Enabling UFW..."
sudo ufw enable
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw status verbose

echo "Network and firewall setup complete."

