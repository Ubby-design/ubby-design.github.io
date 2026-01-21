# Lab 1 – Linux Setup & Hardening

## Objective
Teach core Linux hardening principles:
- Secure user accounts
- Controlled privilege escalation
- SSH hardening
- Auditing and logging

## Architecture Overview
- Base Linux VM (Ubuntu/Debian/CentOS)
- Users: opsadmin, deploy, auditor
- Privilege escalation via sudo, controlled by `/etc/sudoers.d/`
- Logging via `rsyslog` and `auditd`

## Implementation Steps
1. **Create users and groups**
   - opsadmin: sudo privileges
   - deploy: limited deployment tasks
   - auditor: read-only
2. **SSH hardening**
   - Disable root login: `PermitRootLogin no`
   - Use key-based authentication: `PubkeyAuthentication yes`
   - Disable password authentication: `PasswordAuthentication no`
3. **Configure sudo**
   - Fine-grained sudo access in `/etc/sudoers.d/`
   - PAM enforcement
4. **Enable logging**
   - `auditd` for command tracking
   - Syslog forwarding for central logging
5. **Test**
   - Confirm login restrictions
   - Attempt prohibited commands

## Scripts & Configs
- `scripts/create_users.sh`
- `scripts/ssh_hardening.sh`
- `configs/sudoers.fsie`
- `configs/audit.rules`

## Verification
- Log in as deploy → cannot run restricted commands
- Log in as opsadmin → can run allowed sudo commands
- Confirm logs in `/var/log/audit/audit.log`

## Failure Modes
- Root SSH enabled → potential compromise
- Misconfigured sudo → privilege escalation risk
- Audit not running → missed security events

## Real-World Use
- Production servers in financial and healthcare environments
- Foundation for secure infrastructure

