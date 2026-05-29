# Phase 7: Nginx Reverse Proxy

## Objective

Configure Nginx as a reverse proxy to route user traffic from port 80 to Tomcat running on port 8080.

Users should access:
http://NGINX_PUBLIC_IP

Instead of:
http://TOMCAT_PRIVATE_IP:8080

---

## Architecture

User → Nginx (Port 80) → Tomcat (Port 8080)

---

## Prerequisites

- Nginx EC2 instance running
- Tomcat EC2 instance running
- Java application deployed on Tomcat
- Same VPC connectivity between instances
- Security groups configured correctly

---

## Security Group Rules

### Nginx EC2
- HTTP: 80 (0.0.0.0/0)
- HTTPS: 443 (optional)
- SSH: 22 (My IP)

### Tomcat EC2
- TCP: 8080 → Only Nginx Security Group

---

## Nginx Installation

```bash
sudo yum update -y
sudo amazon-linux-extras enable nginx1
sudo yum install nginx -y
