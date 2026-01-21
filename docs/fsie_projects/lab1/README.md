# Lab 1: Linux Setup & Hardening

## Objective
- Create a non-root admin user
- Configure sudo permissions
- Apply network configuration
- Harden SSH and firewall

## Steps
1. Run `scripts/setup.sh` to create user and apply network config.
2. Run `scripts/harden.sh` to disable root SSH and apply firewall rules.
3. Verify user access:
   ```bash
   su - opsadmin
   sudo apt update

