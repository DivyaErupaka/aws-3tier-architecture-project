# Phase 2 - Security Groups and EC2 Deployment

## Objective

Deploy EC2 instances for each layer of the 3-tier architecture and secure communication using Security Groups.

Components:

- Nginx Server (Web Layer)
- Tomcat Server (Application Layer)
- MySQL Server (Database Layer)

## Nginx Security Group

Created Security Group for the Web Layer.

### Inbound Rules

| Protocol | Port | Source |
|-----------|------|---------|
| SSH | 22 | My IP |
| HTTP | 80 | 0.0.0.0/0 |
| HTTPS | 443 | 0.0.0.0/0 |

### Purpose

Allows administrators to connect via SSH and users to access web applications over HTTP and HTTPS.

## Tomcat Security Group

Created Security Group for the Application Layer.

### Inbound Rules

| Protocol | Port | Source |
|-----------|------|---------|
| TCP | 8080 | Nginx-SG |

### Purpose

Allows only the Nginx server to communicate with the Tomcat application server.

## MySQL Security Group

Created Security Group for the Database Layer.

### Inbound Rules

| Protocol | Port | Source |
|-----------|------|---------|
| TCP | 3306 | Tomcat-SG |

### Purpose

Allows only the application server to access the database.

---

## Nginx EC2 Instance

Created an EC2 instance to host the Nginx Web Server.

### Configuration

| Parameter | Value |
|------------|---------|
| Instance Name | nginx-server |
| Operating System | Amazon Linux 2023 |
| Instance Type | t2.micro |
| VPC | DevOps-3Tier-VPC |
| Subnet | Public-Subnet |
| Security Group | Nginx-SG |
| Public IP | Enabled |

### Purpose

The Nginx server acts as the Web Layer of the application.

Responsibilities:

- Receives requests from users
- Serves web content
- Acts as a Reverse Proxy
- Forwards requests to the Tomcat Application Server

### Network Placement

The Nginx server is deployed in the Public Subnet because it must be accessible from the internet.

### Security Considerations

- SSH access restricted to administrator IP
- HTTP (80) enabled for web traffic
- HTTPS (443) enabled for secure communication

---

## Tomcat EC2 Instance

Created an EC2 instance to host the Apache Tomcat Application Server.

### Configuration

| Parameter | Value |
|------------|---------|
| Instance Name | tomcat-server |
| Operating System | Amazon Linux 2023 |
| Instance Type | t2.micro |
| VPC | DevOps-3Tier-VPC |
| Subnet | App-Subnet |
| Security Group | Tomcat-SG |
| Public IP | Disabled |

### Purpose

The Tomcat server acts as the Application Layer of the architecture.

Responsibilities:

- Hosts Java web applications
- Processes business logic
- Handles requests forwarded by Nginx
- Communicates with the MySQL Database

### Network Placement

The Tomcat server is deployed in the Private Application Subnet to prevent direct internet access.

### Security Considerations

- No Public IP assigned
- Accessible only from Nginx Server
- Port 8080 restricted through Security Groups

---

## MySQL EC2 Instance

Created an EC2 instance to host the MySQL Database Server.

### Configuration

| Parameter | Value |
|------------|---------|
| Instance Name | mysql-server |
| Operating System | Amazon Linux 2023 |
| Instance Type | t2.micro |
| VPC | DevOps-3Tier-VPC |
| Subnet | DB-Subnet |
| Security Group | MySQL-SG |
| Public IP | Disabled |

### Purpose

The MySQL server acts as the Database Layer of the architecture.

Responsibilities:

- Stores application data
- Processes database queries
- Supports application transactions
- Maintains persistent storage

### Network Placement

The MySQL server is deployed in the Private Database Subnet and is not directly accessible from the internet.

### Security Considerations

- No Public IP assigned
- Accessible only from Tomcat Server
- Port 3306 restricted through Security Groups
- Database layer isolated from external traffic

---

## Architecture After Phase 2

The infrastructure now consists of:

Internet
|
Nginx Server (Public Subnet)
|
Tomcat Server (Private App Subnet)
|
MySQL Server (Private DB Subnet)

### Communication Flow

1. Users access the Nginx Web Server.
2. Nginx forwards requests to Tomcat.
3. Tomcat processes application logic.
4. Tomcat communicates with MySQL.
5. MySQL returns data to Tomcat.
6. Tomcat sends the response to Nginx.
7. Nginx returns the response to the user.

### Benefits

- Improved Security
- Layered Architecture
- Network Isolation
- Controlled Access Through Security Groups
- Scalable Design
