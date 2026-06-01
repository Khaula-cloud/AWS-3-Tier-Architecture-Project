#!/bin/bash
# Step 1: Create VPC and Subnets

VPC_ID=$(aws ec2 create-vpc \
  --cidr-block 10.0.0.0/16 \
  --tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=myapp-vpc}]' \
  --query 'Vpc.VpcId' --output text)

echo "VPC created: $VPC_ID"

# Public Subnets
PUB_SUBNET_1A=$(aws ec2 create-subnet --vpc-id $VPC_ID \
  --cidr-block 10.0.1.0/24 --availability-zone us-east-2a \
  --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=public-1a}]' \
  --query 'Subnet.SubnetId' --output text)

PUB_SUBNET_1B=$(aws ec2 create-subnet --vpc-id $VPC_ID \
  --cidr-block 10.0.2.0/24 --availability-zone us-east-2b \
  --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=public-1b}]' \
  --query 'Subnet.SubnetId' --output text)

# Private Subnets
PRIV_SUBNET_1A=$(aws ec2 create-subnet --vpc-id $VPC_ID \
  --cidr-block 10.0.3.0/24 --availability-zone us-east-2a \
  --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=private-1a}]' \
  --query 'Subnet.SubnetId' --output text)

PRIV_SUBNET_1B=$(aws ec2 create-subnet --vpc-id $VPC_ID \
  --cidr-block 10.0.4.0/24 --availability-zone us-east-2b \
  --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=private-1b}]' \
  --query 'Subnet.SubnetId' --output text)

# Enable auto-assign public IP on public subnets
aws ec2 modify-subnet-attribute --subnet-id $PUB_SUBNET_1A --map-public-ip-on-launch
aws ec2 modify-subnet-attribute --subnet-id $PUB_SUBNET_1B --map-public-ip-on-launch

# Internet Gateway
IGW_ID=$(aws ec2 create-internet-gateway \
  --query 'InternetGateway.InternetGatewayId' --output text)
aws ec2 attach-internet-gateway --vpc-id $VPC_ID --internet-gateway-id $IGW_ID

# Route Table
RT_ID=$(aws ec2 create-route-table --vpc-id $VPC_ID \
  --query 'RouteTable.RouteTableId' --output text)
aws ec2 create-route --route-table-id $RT_ID \
  --destination-cidr-block 0.0.0.0/0 --gateway-id $IGW_ID
aws ec2 associate-route-table --route-table-id $RT_ID --subnet-id $PUB_SUBNET_1A
aws ec2 associate-route-table --route-table-id $RT_ID --subnet-id $PUB_SUBNET_1B

echo "Done! Save these IDs:"
echo "VPC_ID=$VPC_ID"
echo "PUB_SUBNET_1A=$PUB_SUBNET_1A"
echo "PUB_SUBNET_1B=$PUB_SUBNET_1B"
echo "PRIV_SUBNET_1A=$PRIV_SUBNET_1A"
echo "PRIV_SUBNET_1B=$PRIV_SUBNET_1B"
