


# 🚀 AWS 3-Tier DevOps Project (End-to-End Production Simulation)

## 📌 Project Overview

This project demonstrates a complete **production-style 3-tier architecture on AWS**, built step-by-step using DevOps tools and best practices.

It includes:
- Network design (VPC)
- Security configuration
- Web, App, and DB tiers
- Reverse proxy setup
- Application deployment
- Database integration (JDBC)
- Backup automation
- Monitoring system
- Log analysis
- Automation repository structure


---

# 📊 PHASE 1: VPC ARCHITECTURE

- Custom VPC created
- Public subnet (Nginx)
- Private subnet (Tomcat)
- Private subnet (MySQL)
- Route tables configured
- Internet Gateway attached

---

# 🔐 PHASE 2: SECURITY GROUPS

- Nginx SG (HTTP 80)
- Tomcat SG (8080 internal only)
- MySQL SG (3306 restricted to App server)

---

# 🧭 PHASE 3: BASTION / ACCESS

- Secure SSH access configured
- Private instances accessed via bastion approach

---

# 🌐 PHASE 4: NGINX INSTALLATION

- Installed Nginx on public EC2
- Verified web server running

```bash
sudo dnf install nginx -y
sudo systemctl start nginx
---


# ☁️ Phase 5 to Phase 8: Core Infrastructure & Application Stack Setup

This section covers the setup of networking enhancements, application server, and database layer in the AWS 3-tier architecture.

---

# 🌐 PHASE 5: NAT GATEWAY (Private Subnet Internet Access)

## 🎯 Objective
Enable internet access for private EC2 instances (Tomcat & MySQL servers).

## ⚙️ Implementation
- Created NAT Gateway in public subnet
- Attached Elastic IP
- Updated route table for private subnet

## 🧠 Result
Private instances can now:
- Install packages
- Download dependencies
- Access external internet securely



## 🧱 Final Architecture

                        🌐 INTERNET
                            |
                            v
                 ┌─────────────────────┐
                 │   INTERNET GATEWAY   │
                 └─────────────────────┘
                            |
                            v
                 ┌─────────────────────┐
                 │   PUBLIC SUBNET     │
                 │  (Web Tier - Nginx) │
                 │  EC2: Nginx Server  │
                 └─────────────────────┘
                            |
                 Reverse Proxy (HTTP 80)
                            |
                            v
        ┌────────────────────────────────────┐
        │           PRIVATE SUBNET          │
        │         (App Tier - Tomcat)      │
        │   EC2: Java + Tomcat Server      │
        │   WAR Application Deployed       │
        └────────────────────────────────────┘
                            |
                     JDBC Connection (3306)
                            |
                            v
        ┌────────────────────────────────────┐
        │           PRIVATE SUBNET          │
        │        (DB Tier - MySQL)         │
        │   EC2: MariaDB / MySQL Server    │
        │   Database: appdb                │
        └────────────────────────────────────┘
                            |
                            v
                💾 BACKUP + MONITORING LAYER
        ┌────────────────────────────────────┐
        │ Cron Jobs + Bash Scripts          │
        │ - mysqldump backups              │
        │ - health checks                  │
        │ - log analysis                  │
        └────────────────────────────────────┘
                            |
                            v
               ☁️ AWS MONITORING LAYER
        ┌────────────────────────────────────┐
        │ VPC Flow Logs → CloudWatch/S3    │
        │ Security & Network Monitoring     │
        └────────────────────────────────────┘
