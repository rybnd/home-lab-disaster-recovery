# Home Lab Disaster Recovery Automation

Automate backup, restore, and failover simulation for a simple home lab (web, DB, file server) using Ansible and Bash.

## Features
- Automated backup and restore of configs/data for all services
- Simulated hardware/service failure and recovery tests
- Modular playbooks for each step

## Usage
1. Adjust `ansible/hosts` with your VM/server IPs and SSH setup.
2. Run backup: `ansible-playbook -i ansible/hosts ansible/backup.yml`
3. Simulate failure: `ansible-playbook -i ansible/hosts ansible/failover_test.yml`
4. Restore: `ansible-playbook -i ansible/hosts ansible/restore.yml`
5. See `docs/recovery_instructions.md` for more.

## Requirements
- Ansible
- Bash
- VMs (VirtualBox/VMware) or physical servers with SSH access
