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

