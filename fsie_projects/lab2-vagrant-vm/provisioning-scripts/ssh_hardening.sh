#!/bin/bash
SSHD_CONFIG="/etc/ssh/sshd_config"

sudo sed -i 's/^#PermitRootLogin.*/PermitRootLogin no/' $SSHD_CONFIG
sudo sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication no/' $SSHD_CONFIG
sudo sed -i 's/^#PubkeyAuthentication.*/PubkeyAuthentication yes/' $SSHD_CONFIG

sudo systemctl restart sshd

