#!/bin/bash
# Create FSIE users and groups

# Groups
sudo groupadd opsadmin || true
sudo groupadd deploy || true
sudo groupadd auditor || true

# Users
sudo useradd -m -G opsadmin opsadmin
sudo useradd -m -G deploy deploy
sudo useradd -m -G auditor auditor

echo "FSIE users created"

