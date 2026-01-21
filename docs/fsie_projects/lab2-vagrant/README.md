# Lab 2 – VM & Vagrant Automation

## Objective
Learn how to provision reproducible environments using Vagrant:
- Automate VM creation
- Standardize configuration
- Prepare labs for DevOps workflows

## Architecture Overview
- Vagrant as the VM orchestrator
- Base boxes: Ubuntu 22.04 / CentOS 9
- Provisioning scripts in `/provisioning`

## Implementation Steps
1. **Install Vagrant & VirtualBox**
2. **Initialize Vagrant environment**
   ```bash
   vagrant init ubuntu/bionic64

