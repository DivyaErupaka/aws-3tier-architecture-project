Apache Tomcat 10.1 Installation Guide (AWS EC2)
📌 Architecture
EC2-1: NGINX (Reverse Proxy)
EC2-2: Tomcat Application Server
Java: OpenJDK 22
Tomcat: 10.1.55
🧰 Prerequisites
AWS EC2 instance (Amazon Linux 2023)
SSH access
Security Group:
22 (SSH)
8080 (Tomcat internal)
80 (NGINX)
☕ Step 1: Install Java (OpenJDK 22)
sudo dnf update -y
sudo dnf install java-22-amazon-corretto -y
java -version
👤 Step 2: Create Tomcat User
sudo useradd -m -U -d /opt/tomcat -s /bin/false tomcat
📦 Step 3: Download Tomcat 10.1.55
cd /tmp

wget https://archive.apache.org/dist/tomcat/tomcat-10/v10.1.55/bin/apache-tomcat-10.1.55.tar.gz
📁 Step 4: Install Tomcat
sudo mkdir -p /opt/tomcat

sudo tar -xvzf apache-tomcat-10.1.55.tar.gz -C /opt/tomcat --strip-components=1
🔐 Step 5: Set Permissions
sudo chown -R tomcat:tomcat /opt/tomcat
sudo chmod +x /opt/tomcat/bin/*.sh
⚙️ Step 6: Create Systemd Service
sudo vi /etc/systemd/system/tomcat.service
📌 Paste this:
[Unit]
Description=Apache Tomcat 10.1
After=network.target

[Service]
Type=forking

User=tomcat
Group=tomcat

Environment="JAVA_HOME=/usr/lib/jvm/java-22-amazon-corretto"
Environment="CATALINA_HOME=/opt/tomcat"
Environment="CATALINA_BASE=/opt/tomcat"
Environment="CATALINA_PID=/opt/tomcat/temp/tomcat.pid"

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

Restart=on-failure

[Install]
WantedBy=multi-user.target
🔄 Step 7: Reload Systemd
sudo systemctl daemon-reload
sudo systemctl enable tomcat
sudo systemctl start tomcat
📊 Step 8: Check Status
sudo systemctl status tomcat
🌐 Step 9: Test Tomcat
curl http://localhost:8080

OR browser:

http://<EC2-PUBLIC-IP>:8080
🔁 Step 10: Configure NGINX Reverse Proxy
sudo vi /etc/nginx/conf.d/tomcat.conf
server {
    listen 80;

    location / {
        proxy_pass http://10.0.2.125:8080;

        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
🚀 Restart NGINX
sudo systemctl restart nginx
🌍 Final Test
http://<NGINX-PUBLIC-IP>

You should see:
👉 Tomcat Homepage (via reverse proxy)