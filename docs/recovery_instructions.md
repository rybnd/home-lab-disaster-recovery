# Home Lab Disaster Recovery: Recovery Instructions

This document describes how to use Ansible and provided scripts to automate disaster recovery for your home lab setup (web, database, and file server VMs).

---

## 1. Backup All Servers

Run the backup playbook to create backups of web server configurations, database dumps, and file server data.

```bash
ansible-playbook -i ansible/hosts ansible/backup.yml
```

---

## 2. Simulate Failure

You can simulate a failure scenario by either:

### a) Using Ansible Playbook

This playbook will stop important services and unmount file shares on your servers.

```bash
ansible-playbook -i ansible/hosts ansible/failover_test.yml
```

### b) Using the Provided Bash Script

On each server, run the script to stop services/unmount shares:

```bash
cd scripts/
chmod +x simulate.sh
./simulate.sh
```

---

## 3. Restore from Backup

After simulating a failure, use the restore playbook to recover all services and data:

```bash
ansible-playbook -i ansible/hosts ansible/restore.yml
```

---

## 4. Verification

- Check service status after restore (`systemctl status nginx`, `systemctl status mysql`, etc.).
- Verify file shares and website functionality.
- Review Ansible output for error messages.

---

## 5. Troubleshooting

- Ensure correct SSH access and sudo permissions for the Ansible user.
- Adjust inventory file and playbooks as needed for your environment.
- Review logs in `/backup/` on each server for backup/restore activity.

---

## Notes

- Update the playbooks to match your actual service names or backup locations.
- Always test backups and restores in a safe environment before relying on this automation for real data recovery.
