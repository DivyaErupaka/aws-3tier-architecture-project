# 🟢 Phase 8: MySQL Installation (Database Tier using Bash Automation)

## 🎯 Objective

The objective of this phase is to install and configure MySQL database on the DB server in the private subnet and automate the setup using a Bash script to ensure consistency and repeatability.

This completes the Database Tier in the 3-tier architecture:

Nginx → Tomcat → MySQL

---

## 🧱 Architecture

Browser  
↓  
Nginx (Public Subnet)  
↓  
Tomcat (App Subnet)  
↓  
MySQL (DB Subnet)

---

## ⚙️ Approach

Instead of manual installation, MySQL setup is automated using a Bash script.

The script performs:
- MySQL installation
- Service start and enable
- Database creation
- Application user creation
- Privileges assignment

---

## 📜 Bash Script: install-mysql.sh

```bash
#!/bin/bash

echo "Updating system packages..."
sudo yum update -y

echo "Installing MySQL server..."
sudo yum install mysql-server -y

echo "Starting and enabling MySQL service..."
sudo systemctl start mysqld
sudo systemctl enable mysqld

echo "Checking MySQL status..."
sudo systemctl status mysqld

echo "Creating database and user..."

mysql -u root -p <<EOF
CREATE DATABASE appdb;
CREATE USER 'appuser'@'%' IDENTIFIED BY 'App@12345';
GRANT ALL PRIVILEGES ON appdb.* TO 'appuser'@'%';
FLUSH PRIVILEGES;
EOF

echo "MySQL installation and configuration completed successfully!"
