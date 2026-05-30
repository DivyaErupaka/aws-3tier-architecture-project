#!/bin/bash

set -e

echo "========================================"
echo "Updating Packages"
echo "========================================"

sudo dnf update -y

echo "========================================"
echo "Installing Java 22"
echo "========================================"

sudo dnf install java-22-amazon-corretto -y

echo "========================================"
echo "Verifying Java"
echo "========================================"

java -version

echo "========================================"
echo "Creating Tomcat User"
echo "========================================"

sudo useradd -r -m -U -d /opt/tomcat -s /bin/false tomcat || true

echo "========================================"
echo "Downloading Tomcat 10.1.55"
echo "========================================"

cd /tmp

wget https://archive.apache.org/dist/tomcat/tomcat-10/v10.1.55/bin/apache-tomcat-10.1.55.tar.gz

echo "========================================"
echo "Creating Tomcat Directory"
echo "========================================"

sudo mkdir -p /opt/tomcat

echo "========================================"
echo "Extracting Tomcat"
echo "========================================"

sudo tar -xzf apache-tomcat-10.1.55.tar.gz \
-C /opt/tomcat \
--strip-components=1

echo "========================================"
echo "Setting Permissions"
echo "========================================"

sudo chown -R tomcat:tomcat /opt/tomcat

sudo chmod -R 755 /opt/tomcat

echo "========================================"
echo "Making Scripts Executable"
echo "========================================"

sudo chmod +x /opt/tomcat/bin/*.sh

echo "========================================"
echo "Tomcat Installation Completed"
echo "========================================"
