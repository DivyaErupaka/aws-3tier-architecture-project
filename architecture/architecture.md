# 🧱 AWS 3-Tier DevOps Architecture

## 📌 Project Overview

This project implements a secure, scalable **3-tier architecture on AWS** using EC2 instances, VPC networking, and DevOps automation tools.

It separates the system into:
- Web Tier (Nginx)
- Application Tier (Tomcat)
- Database Tier (MySQL)

---

# 🌐 High-Level Architecture
Internet
|
v
Internet Gateway
|
v
+---------------------------+
| Public Subnet |
| (Web Tier - Nginx) |
| EC2: Nginx Server |
+---------------------------+
|
Reverse Proxy
|
v
+---------------------------+
| Private Subnet |
| (App Tier - Tomcat) |
| EC2: Java + Tomcat |
| WAR Application |
+---------------------------+
|
JDBC Connection
|
v
+---------------------------+
| Private Subnet |
| (DB Tier - MySQL) |
| EC2: MariaDB/MySQL |
| Database: appdb |
+---------------------------+


---

# 🧱 Architecture Layers

## 🌐 1. Web Tier (Nginx)

### Responsibilities:
- Handles user requests
- Acts as reverse proxy
- Forwards traffic to Tomcat

### Port:
- 80 (HTTP)

---

## ☕ 2. Application Tier (Tomcat)

### Responsibilities:
- Runs Java application
- Handles business logic
- Processes requests from Nginx

### Port:
- 8080 (internal only)

---

## 🗄️ 3. Database Tier (MySQL)

### Responsibilities:
- Stores application data
- Handles CRUD operations
- Secured access only from App Tier

### Port:
- 3306 (restricted)

---

# 🔐 Security Architecture

## Security Groups:

| Tier | Access |
|------|--------|
| Nginx | HTTP (80) public |
| Tomcat | 8080 (Nginx only) |
| MySQL | 3306 (App server only) |

✔ No direct DB exposure to internet
✔ Private subnet used for App + DB

---

# 🔄 Request Flow
User Request
↓
Nginx (Web Tier)
↓
Tomcat (App Tier)
↓
MySQL (DB Tier)
↓
Response Back to User


---

# ☁️ AWS Services Used

- Amazon VPC (Networking)
- EC2 Instances (Compute)
- Security Groups (Firewall)
- Internet Gateway (Public Access)
- NAT Gateway (Private subnet internet access)
- Route Tables (Traffic routing)

---

# ⚙️ DevOps Components

## Automation:
- Bash Scripts
- Cron Jobs

## Monitoring:
- CPU usage
- Memory usage
- Disk usage
- Service health checks

## Logging:
- Nginx logs
- Tomcat logs
- MySQL logs

## Backup:
- mysqldump automation
- scheduled backups using cron

---

# 🚀 Key Highlights of Architecture

✔ Fully private backend (App + DB)
✔ Secure layered design
✔ Reverse proxy implementation
✔ Real-world production pattern
✔ Scalable and modular structure

---

# 🧠 Skills Demonstrated

- AWS Networking (VPC, Subnets)
- Linux Administration
- Web Server Configuration
- Application Server Deployment
- Database Management
- Security Design
- DevOps Automation
- System Monitoring & Logging

---

# 🏁 Final Outcome

This architecture represents a **real enterprise-level 3-tier system** deployed on AWS with:

✔ Secure network design
✔ Scalable structure
✔ Production-ready setup
✔ DevOps automation layer
