# Nginx Installation Guide

## Objective

Install and configure Nginx Web Server on Amazon Linux 2023.

Server: nginx-server

Role: Web Layer

## Automation Using Bash Script

To automate Nginx installation, a Bash script was created.

Script Location:

scripts/install-nginx.sh

Functions Performed:

- Update system packages
- Install Nginx
- Start Nginx service
- Enable Nginx at boot
- Verify installation
- Verify service status

Execution:

chmod +x install-nginx.sh

./install-nginx.sh

Benefits:

- Reduces manual effort
- Ensures consistent deployments
- Demonstrates Infrastructure Automation
- Aligns with DevOps best practices
