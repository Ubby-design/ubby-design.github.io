#!/bin/bash
# Basic firewall rules

# Flush existing rules
sudo iptables -F

# Allow loopback
sudo iptables -A INPUT -i lo -j ACCEPT

# Allow SSH from Admin network
sudo iptables -A INPUT -p tcp --dport 22 -s 10.0.0.0/24 -j ACCEPT

# Allow HTTP/HTTPS from DMZ
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Drop everything else
sudo iptables -A INPUT -j DROP

# Save rules
sudo iptables-save | sudo tee /etc/iptables/rules.v4

echo "Firewall rules applied"

