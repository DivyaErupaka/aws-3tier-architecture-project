#!/bin/bash

echo "======================================="
echo "Installing Java"
echo "======================================="

sudo dnf update -y

sudo dnf install java-17-amazon-corretto -y

java -version

echo "======================================="
echo "Creating Tomcat User"
echo "======================================="

sudo useradd -m -U -d /opt/tomcat -s /bin/false tomcat

echo "======================================="
echo "Downloading Tomcat"
echo "======================================="

cd /tmp

wget https://downloads.apache.org/tomcat/tomcat-10/v10.1.42/bin/apache-tomcat-10.1.42.tar.gz

sudo mkdir -p /opt/tomcat

sudo tar -xzf apache-tomcat-10.1.42.tar.gz -C /opt/tomcat --strip-components=1

echo "======================================="
echo "Setting Permissions"
echo "======================================="

sudo chown -R tomcat:tomcat /opt/tomcat

sudo chmod -R 755 /opt/tomcat

echo "Tomcat installation completed."
