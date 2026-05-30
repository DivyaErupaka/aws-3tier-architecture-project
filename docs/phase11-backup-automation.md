# 💾 Phase 11: Database Backup Automation (Bash + Cron)

## 🎯 Objective
Automate MySQL/MariaDB backups using a Bash script and schedule it using cron jobs on the DB server.

---

## 🧱 Server Used
Database Server (MySQL/MariaDB)
Example:
10.0.3.68

---

## 📦 Step 1: Install Cron Service (cronie)

```bash
sudo dnf install cronie -y

Start and enable service:

sudo systemctl start crond
sudo systemctl enable crond

Check status:

sudo systemctl status crond

📸 Screenshot:
screenshots/phase11/cronie-install.png

📁 Step 2: Create Backup Directory
sudo mkdir -p /backup
sudo chmod 777 /backup

Verify:

ls -ld /backup

📸 Screenshot:
screenshots/phase11/backup-directory.png

📝 Step 3: Create Backup Script
vi backup-db.sh
📜 Step 4: Add Script Content
#!/bin/bash

DATE=$(date +%F-%H-%M)
BACKUP_DIR="/backup"
DB_NAME="appdb"
DB_USER="root"
DB_PASS="Root@123"

echo "Starting backup..."

mysqldump -u $DB_USER -p$DB_PASS $DB_NAME > $BACKUP_DIR/$DB_NAME-$DATE.sql

echo "Backup completed successfully"

📸 Screenshot:
screenshots/phase11/backup-script.png

🔐 Step 5: Make Script Executable
chmod +x backup-db.sh

Verify:

ls -l backup-db.sh

📸 Screenshot:
screenshots/phase11/script-permission.png

🚀 Step 6: Run Backup Manually
./backup-db.sh

Verify backup file:

ls /backup

📸 Screenshot:
screenshots/phase11/manual-backup.png

⏰ Step 7: Schedule Cron Job
crontab -e

Add:

0 2 * * * /home/ec2-user/backup-db.sh
📋 Step 8: Verify Cron Job
crontab -l
