#!/bin/bash

echo "Updating system..."
sudo dnf update -y

echo "Installing MariaDB (MySQL compatible)..."
sudo dnf install mariadb105-server -y

echo "Starting MariaDB service..."
sudo systemctl start mariadb
sudo systemctl enable mariadb

echo "Checking status..."
sudo systemctl status mariadb

echo "Installation completed successfully"
