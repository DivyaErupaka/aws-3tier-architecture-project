#!/bin/bash

echo "================================="
echo "Starting Nginx Installation"
echo "================================="

# Update packages
sudo dnf update -y

# Install nginx
sudo dnf install nginx -y

# Start nginx
sudo systemctl start nginx

# Enable nginx on boot
sudo systemctl enable nginx

echo "================================="
echo "Nginx Version"
echo "================================="
nginx -v

echo "================================="
echo "Nginx Service Status"
echo "================================="
sudo systemctl status nginx

echo "================================="
echo "Installation Completed"
echo "================================="
