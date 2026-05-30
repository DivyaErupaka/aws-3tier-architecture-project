#!/bin/bash

echo "=============================="
echo " SYSTEM HEALTH CHECK REPORT "
echo "=============================="

echo ""
echo "📊 CPU Usage:"
top -bn1 | grep "Cpu(s)"

echo ""
echo "💾 Memory Usage:"
free -m

echo ""
echo "💽 Disk Usage:"
df -h

echo ""
echo "🔧 Tomcat Service Status:"
systemctl status tomcat | grep Active

echo ""
echo "🗄️ MySQL/MariaDB Status:"
systemctl status mariadb | grep Active

echo ""
echo "=============================="
echo " REPORT GENERATED SUCCESSFULLY "
echo "=============================="
