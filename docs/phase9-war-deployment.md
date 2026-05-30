# 🚀 Phase 9: WAR Application Deployment on Tomcat

## 🎯 Objective
Deploy a Java WAR application on Tomcat server and make it accessible via Nginx reverse proxy as part of a 3-tier architecture.

---

## 🧱 Architecture

Browser  
↓  
Nginx (Public Subnet)  
↓  
Tomcat (Application Subnet)  
↓  
MySQL (Database Subnet)

---

## 📦 Step 1: Connect to Tomcat Server

```bash
ssh -i Techie.pem ec2-user@<TOMCAT_PRIVATE_IP>



## 📦 Step 2: Navigate to Webapps Directory

```bash
cd /opt/tomcat/webapps
## 📦 Step 3: Deploy WAR File

```bash
sudo wget https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war

## step4:restart tomcat server and nginx server
## step5:and browse using http://<NGINX_PUBLIC_IP>/sample

