# Phase 3 - Bastion Host Setup

## Objective

Configure secure administrative access to private EC2 instances using a Bastion Host.

## Architecture

Laptop
|
Nginx Server (Public Subnet)
|
Tomcat Server (Private App Subnet)
|
MySQL Server (Private DB Subnet)

## Implementation

The Nginx server was deployed in the Public Subnet and configured as a Bastion Host.

Private servers do not have Public IP addresses and are accessible only through controlled SSH connections.

### Security Group Rules

Tomcat-SG

* SSH (22) allowed from Nginx-SG

MySQL-SG

* SSH (22) allowed from Tomcat-SG

## Benefits

* Improved Security
* Reduced Attack Surface
* Controlled Administrative Access
* Production-Style Infrastructure

