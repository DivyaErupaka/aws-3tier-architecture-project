# Phase 6: Apache Tomcat 10.1.55 Installation and Configuration

## Objective

Install Java 22 and Apache Tomcat 10.1.55 on the Application Server hosted in the private subnet.

## Prerequisites

* NAT Gateway configured
* Internet access from private subnet
* EC2 Application Server running
* SSH access from Bastion/Nginx server

---

## Verify Internet Connectivity

Before installation, verify that the application server can access the internet.

```bash
ping -c 4 google.com

sudo dnf update -y
```

Result:

The private EC2 instance successfully accessed external repositories through the NAT Gateway.

---

## Install Java 22

```bash
sudo dnf install java-22-amazon-corretto -y
```

Verify Java installation:

```bash
java -version
```

Expected Output:

```text
openjdk version "22"
```

---

## Create Tomcat Service User

```bash
sudo useradd -r -m -U -d /opt/tomcat -s /bin/false tomcat
```

Purpose:

* Dedicated service account
* Improved security
* Follows least privilege principle

---

## Download Apache Tomcat 10.1.55

```bash
cd /tmp

wget https://archive.apache.org/dist/tomcat/tomcat-10/v10.1.55/bin/apache-tomcat-10.1.55.tar.gz
```

---

## Extract Tomcat

```bash
sudo mkdir -p /opt/tomcat

sudo tar -xzf apache-tomcat-10.1.55.tar.gz \
-C /opt/tomcat \
--strip-components=1
```

---

## Assign Ownership

```bash
sudo chown -R tomcat:tomcat /opt/tomcat
```

---

## Create Tomcat Service

Created:

```text
/etc/systemd/system/tomcat.service
```

Configured:

* JAVA_HOME
* CATALINA_HOME
* CATALINA_BASE
* Automatic startup on boot

---

## Start Tomcat

```bash
sudo systemctl daemon-reload

sudo systemctl enable tomcat

sudo systemctl start tomcat
```

---

## Validation

### Verify Service Status

```bash
sudo systemctl status tomcat
```

Expected:

```text
active (running)
```

### Verify Port

```bash
sudo ss -tulnp | grep 8080
```

Expected:

```text
*:8080
```

### Verify Application

```bash
curl localhost:8080
```

Result:

Apache Tomcat 10.1.55 default homepage displayed successfully.

---

## Outcome

* Java 22 Installed
* Apache Tomcat 10.1.55 Installed
* Tomcat Service Configured
* Port 8080 Listening
* Application Server Operational

---

## Architecture After Phase 6

Internet

↓

Nginx Server (Public Subnet)

↓

Tomcat Server (Private Subnet)

↓

MySQL Server (Private DB Subnet)

