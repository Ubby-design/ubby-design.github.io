# Lab 3: Network & Firewall Configuration

## Objective
- Configure firewall and network policies
- Harden SSH and web access
- Restrict all other ports

## Steps
1. Run `scripts/setup_network.sh` to apply firewall rules.
2. Verify firewall rules:
   ```bash
   sudo ufw status verbose
   sudo iptables -L -v

