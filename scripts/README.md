# scripts Directory

This folder contains shell scripts used for simulating failure scenarios in the Home Lab Disaster Recovery Automation project.

## Files

- **simulate.sh**  
  Simulates failures on the target server by stopping critical services (web server, database, file share) and unmounting directories. Use this to test your backup and restore automation.

## Usage

1. Make the script executable:
   ```bash
   chmod +x simulate.sh
   ```

2. Run the script on the desired server:
   ```bash
   ./simulate.sh
   ```

3. After running the script, use the Ansible restore playbook to recover your services.

---

**Note:**  
Modify or extend the script to include additional services or failure types based on your home lab setup.
