# Phase 1 - Network Setup

## VPC Creation

Created a custom VPC.

Configuration:

| Setting | Value |
|----------|--------|
| Name | DevOps-3Tier-VPC |
| CIDR | 10.0.0.0/16 |

Purpose:

This VPC serves as the network boundary for the entire application architecture.

---

## Public Subnet

Created a Public Subnet inside the DevOps-3Tier-VPC.

### Configuration

| Setting | Value |
|----------|--------|
| Name | Public-Subnet |
| CIDR | 10.0.1.0/24 |
| Auto Assign Public IP | Enabled |

### Purpose

This subnet will host internet-facing resources.

Example:

- Nginx Web Server
- Bastion Host

Resources launched in this subnet can receive public IP addresses and communicate with the internet through an Internet Gateway.

---

## Application Subnet

Created a private subnet inside the DevOps-3Tier-VPC.

### Configuration

| Setting | Value |
|----------|--------|
| Name | App-Subnet |
| CIDR | 10.0.2.0/24 |
| Availability Zone | us-east-2a |
| Auto Assign Public IP | Disabled |

### Purpose

This subnet is used to host the application layer of the architecture.

Resources deployed in this subnet are not directly accessible from the internet.

### Planned Resources

- Apache Tomcat Server

### Security Considerations

- No Public IP addresses are assigned.
- Access will be allowed only from the Nginx server through Security Groups.
- Application traffic will be restricted to required ports only.

### Benefits

- Improves security by isolating the application server from direct internet access.
- Reduces attack surface.
- Follows the principle of least privilege.

---

## Database Subnet

Created a private subnet inside the DevOps-3Tier-VPC.

### Configuration

| Setting | Value |
|----------|--------|
| Name | DB-Subnet |
| CIDR | 10.0.3.0/24 |
| Availability Zone | us-east-2a |
| Auto Assign Public IP | Disabled |

### Purpose

This subnet is used to host the database layer of the architecture.

The database server stores application data and should never be directly exposed to the internet.

### Planned Resources

- MySQL Database Server

### Security Considerations

- No Public IP addresses are assigned.
- Database access will only be allowed from the Application Server.
- Direct access from the internet will be blocked.
- Database traffic will be restricted to port 3306.

### Benefits

- Protects sensitive application data.
- Provides network isolation for the database tier.
- Implements a secure three-tier architecture design.

## Internet Gateway

Created and attached Internet Gateway.

Name:
DevOps-IGW

Purpose:

Provides internet access to resources in public subnet.



---

## Public Route Table

Created a route table for resources deployed in the public subnet.

### Configuration

| Setting | Value |
|----------|--------|
| Route Table Name | Public-RT |
| Associated Subnet | Public-Subnet |
| Destination | 0.0.0.0/0 |
| Target | DevOps-IGW |

### Purpose

The Public Route Table enables internet connectivity for resources deployed in the Public Subnet.

### Route Configuration

| Destination | Target |
|------------|---------|
| 10.0.0.0/16 | Local |
| 0.0.0.0/0 | Internet Gateway |

### Planned Resources

- Nginx Web Server
- Bastion Host

### Benefits

- Allows inbound and outbound internet traffic.
- Enables users to access web applications hosted on EC2 instances.
- Provides connectivity for administrative access through SSH.

---

## Application Route Table

Created a dedicated route table for the Application Subnet.

### Configuration

| Setting | Value |
|----------|--------|
| Route Table Name | App-RT |
| Associated Subnet | App-Subnet |

### Route Configuration

| Destination | Target |
|------------|---------|
| 10.0.0.0/16 | Local |

### Purpose

The Application Route Table ensures that resources within the Application Subnet can communicate internally within the VPC while remaining inaccessible from the public internet.

### Planned Resources

- Apache Tomcat Server

### Security Considerations

- No direct route to the Internet Gateway.
- Prevents public internet access.
- Application server can only be accessed through approved network paths and security group rules.

### Benefits

- Improves security by isolating the application layer.
- Supports a layered network architecture.
- Reduces exposure to external threats.

---

## Database Route Table

Created a dedicated route table for the Database Subnet.

### Configuration

| Setting | Value |
|----------|--------|
| Route Table Name | DB-RT |
| Associated Subnet | DB-Subnet |

### Route Configuration

| Destination | Target |
|------------|---------|
| 10.0.0.0/16 | Local |

### Purpose

The Database Route Table allows the database server to communicate only within the VPC and prevents direct internet access.

### Planned Resources

- MySQL Database Server

### Security Considerations

- No route to the Internet Gateway.
- Database instances remain isolated from public networks.
- Database traffic is restricted through Security Groups and subnet isolation.

### Benefits

- Protects sensitive application data.
- Implements network-level security.
- Supports secure three-tier architecture design.

### Screenshot

08-db-route-table.png
