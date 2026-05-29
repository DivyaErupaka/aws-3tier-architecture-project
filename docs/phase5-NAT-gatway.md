# Phase 5 - NAT Gateway Configuration

## Objective

Provide internet access to private subnet resources while keeping them inaccessible from the internet.
## NAT Gateway

Created a NAT Gateway in the Public Subnet and associated an Elastic IP address.

Purpose:

- Outbound internet access for private subnet resources
- No inbound internet access
- Secure package installation and updates

## Route Table Updates

Added default route:

0.0.0.0/0 → NAT Gateway

to:

- Application Subnet Route Table
- Database Subnet Route Table

Result:

Private instances can initiate outbound internet connections while remaining inaccessible from external networks.

## Validation

Verified outbound internet connectivity from the private application server.

Validation Commands:

ping google.com

curl https://google.com

sudo dnf update -y

Result:

Private EC2 instances successfully accessed external repositories through the NAT Gateway.

