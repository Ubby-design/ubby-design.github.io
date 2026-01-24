# 📘 Lab 3 – Network & Firewall Configuration

## Objective
Configure secure networks and firewalls:
- Segmentation and isolation
- Firewall rules enforcement
- Basic intrusion protection

## Architecture Overview
- Servers: Linux VMs from Lab 2
- Firewalls: iptables or firewalld
- Network zones: DMZ, Internal, Admin

## Implementation Steps

### 1. Define Network Zones
- **DMZ**: Public-facing services (web, API)
- **Internal**: Application servers
- **Admin**: Operations and management

### 2. Configure Firewall Rules
- Allow **SSH only from Admin zone**
- Allow **HTTP/HTTPS from DMZ**
- Block all other traffic

Example `iptables.rules` snippet:

```bash
*filter

# Default policies
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [0:0]

# Allow loopback
-A INPUT -i lo -j ACCEPT
-A OUTPUT -o lo -j ACCEPT

# Allow established connections
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# SSH from Admin network
-A INPUT -p tcp -s 192.168.10.0/24 --dport 22 -j ACCEPT

# HTTP/HTTPS from DMZ
-A INPUT -p tcp -s 192.168.20.0/24 --dport 80 -j ACCEPT
-A INPUT -p tcp -s 192.168.20.0/24 --dport 443 -j ACCEPT

# Drop invalid packets
-A INPUT -m state --state INVALID -j DROP

# Reject everything else
-A INPUT -j REJECT --reject-with icmp-port-unreachable
-A FORWARD -j REJECT --reject-with icmp-port-unreachable

COMMIT

