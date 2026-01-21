#!/bin/bash
# Provision VM with Apache and basic page

sudo apt update
sudo apt install -y apache2 git curl

# Enable and start Apache
sudo systemctl enable apache2
sudo systemctl start apache2

# Create a sample web page
echo "<h1>Lab 2: VM & Vagrant Automation</h1>" | sudo tee /var/www/html/index.html

echo "VM provisioned and sample web page deployed."

