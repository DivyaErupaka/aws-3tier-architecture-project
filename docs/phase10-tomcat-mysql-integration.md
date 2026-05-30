# 🔗 Phase 10: Tomcat ↔ MySQL Integration (JDBC)

## 🎯 Objective
Connect Java web application running on Tomcat with MySQL database using JDBC to enable dynamic data storage and retrieval.

---

## 🧱 Architecture Flow

Browser  
↓  
Nginx (Reverse Proxy)  
↓  
Tomcat (Java Application)  
↓  
MySQL (Database)

---

## 🗄️ Step 1: Verify Database is Ready

Login to DB server:

```bash
sudo mysql

## Step 2: Verify Application User
SELECT user, host FROM mysql.user;

Expected:

appuser@%
## 🔐 Step 3: Ensure DB Access from Tomcat

From Tomcat server:

mysql -h <DB_PRIVATE_IP> -u appuser -p

If login works → DB connectivity OK

📸 Screenshot 1:

Successful DB connection from Tomcat server
📦 Step 4: Add MySQL JDBC Driver

On Tomcat server:

cd /opt/tomcat/lib

Download JDBC connector:

wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j-8.0.33.tar.gz

Extract:

tar -xvzf mysql-connector-j-8.0.33.tar.gz

Move jar:

cp mysql-connector-j-8.0.33/mysql-connector-j-8.0.33.jar /opt/tomcat/lib/

Restart Tomcat:

sudo systemctl restart tomcat
🧾 Step 5: Configure Database Connection in Application

Inside Java app:

String url = "jdbc:mysql://<DB_PRIVATE_IP>:3306/appdb";
String user = "appuser";
String password = "App@12345";

Connection conn = DriverManager.getConnection(url, user, password);
🌐 Step 6: Deploy Updated WAR File
scp StudentApp.war ec2-user@<TOMCAT_IP>:/opt/tomcat/webapps/

Restart Tomcat:

sudo systemctl restart tomcat
🧪 Step 7: Verify Application

Open browser:

http://<NGINX_PUBLIC_IP>/StudentApp

Expected:

Application loads
Data stored/retrieved from database

📸 Screenshot 2:

Application working with database interaction
