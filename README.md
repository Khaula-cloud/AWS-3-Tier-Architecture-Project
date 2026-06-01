# ☁️ AWS 3-Tier Architecture Project

<p align="center">

![AWS](https://img.shields.io/badge/AWS-Cloud-orange?style=for-the-badge&logo=amazonaws)
![Architecture](https://img.shields.io/badge/Architecture-3--Tier-blue?style=for-the-badge)
![Availability](https://img.shields.io/badge/High_Availability-Multi--AZ-success?style=for-the-badge)
![Security](https://img.shields.io/badge/Security-Least_Privilege-red?style=for-the-badge)
![Database](https://img.shields.io/badge/RDS-MySQL-blue?style=for-the-badge&logo=mysql)
![License](https://img.shields.io/badge/License-MIT-black?style=for-the-badge)

</p>

---

# 📖 Project Overview

This project demonstrates a **production-style AWS 3-Tier Architecture** designed using industry-standard cloud architecture principles.

The infrastructure separates application components into independent layers:

- 🌐 Presentation Layer (Frontend)
- ⚙️ Application Layer (Backend)
- 🗄️ Data Layer (RDS Database)

Each tier is isolated using AWS networking and security controls to improve:

- Security
- Availability
- Scalability
- Fault Tolerance
- Maintainability

---

# 🎯 Project Goals

✅ Build a highly available architecture

✅ Implement least-privilege networking

✅ Deploy scalable compute resources

✅ Isolate databases from public access

✅ Demonstrate AWS infrastructure best practices

✅ Prepare for future Infrastructure as Code deployment

---

# 🏗️ Architecture Diagram

https://raw.githubusercontent.com/Khaula-cloud/AWS-3-Tier-Architecture-Project/dd6151d8d7020fe363b3010464782020e16713f5/ArchitectureDiagram/aws_3tier_architecture_diagram.svg?token=ASWNKABEGI7KVG4SW5LZZJDKDXNUM

# 📊 AWS Services Used

| Service | Purpose |
|----------|----------|
| VPC | Private network segmentation |
| EC2 | Application hosting |
| Auto Scaling Groups | Horizontal scaling |
| Application Load Balancer | Traffic distribution |
| RDS MySQL | Managed relational database |
| Security Groups | Layered access control |
| Route Tables | Traffic routing |
| Internet Gateway | Public internet access |

---

# 🌐 Network Design

## VPC Configuration

| Component | CIDR |
|------------|------------|
| VPC | 10.0.0.0/16 |
| Public Subnet A | 10.0.1.0/24 |
| Public Subnet B | 10.0.2.0/24 |
| Private Subnet A | 10.0.3.0/24 |
| Private Subnet B | 10.0.4.0/24 |

---

## Availability Zones

```bash
AZ-a
├── Public Subnet
│   ├── ALB
│   └── Frontend EC2
│
└── Private Subnet
    ├── Backend EC2
    └── RDS

AZ-b
├── Public Subnet
│   ├── ALB
│   └── Frontend EC2
│
└── Private Subnet
    ├── Backend EC2
    └── RDS
```

---

# 🔐 Security Architecture

This project follows the **Least Privilege Principle**.

Each layer only accepts traffic from the layer directly above it.

```text
Internet
   │
   ▼
ALB Security Group
   │
   ▼
Frontend Security Group
   │
   ▼
Backend Security Group
   │
   ▼
RDS Security Group
```

---

## Security Benefits

✅ No direct internet access to backend

✅ No public database exposure

✅ Security group referencing

✅ Layered network isolation

✅ Reduced attack surface

---

# ⚙️ Auto Scaling Configuration

## Frontend Tier

| Setting | Value |
|----------|----------|
| Instance Type | t3.micro |
| Minimum | 2 |
| Desired | 2 |
| Maximum | 6 |

---

## Backend Tier

| Setting | Value |
|----------|----------|
| Instance Type | t3.micro |
| Minimum | 2 |
| Desired | 2 |
| Maximum | 6 |

---

# 📁 Project Structure

```bash
AWS-3-Tier-Architecture-Project/
│
├── scripts/
│   ├── 01-vpc-setup.sh
│   ├── 02-security-groups.sh
│   ├── 03-rds-setup.sh
│   ├── 04-alb-setup.sh
│   └── 05-asg-setup.sh
│
├── diagrams/
│   └── architecture.png
│
└── README.md
```

---

# 🚀 Deployment Guide

## Step 1 — Create Networking

```bash
bash scripts/01-vpc-setup.sh
```

Creates:

- VPC
- Subnets
- Internet Gateway
- Route Tables

---

## Step 2 — Create Security Groups

```bash
bash scripts/02-security-groups.sh
```

Creates:

- ALB Security Group
- Frontend Security Group
- Backend Security Group
- Database Security Group

---

## Step 3 — Deploy Database

```bash
bash scripts/03-rds-setup.sh
```

Creates:

- Amazon RDS MySQL 8.0
- Private Subnet Deployment
- Security Group Association

---

## Step 4 — Create Load Balancer

```bash
bash scripts/04-alb-setup.sh
```

Creates:

- Target Groups
- Health Checks
- Listener Rules
- ALB

---

## Step 5 — Deploy Auto Scaling Groups

```bash
bash scripts/05-asg-setup.sh
```

Creates:

- Launch Templates
- Auto Scaling Groups
- Scaling Policies

---

# 🧪 Validation Checklist

After deployment verify:

```bash
✔ ALB is healthy
✔ Frontend instances registered
✔ Backend instances registered
✔ Database accessible from backend
✔ Database inaccessible from internet
✔ Auto Scaling operational
✔ Health checks passing
```

---

# 💡 Key Design Decisions

## Security Group Referencing

Instead of CIDR-based rules:

```bash
10.0.3.0/24
```

This architecture uses:

```bash
sg-frontend
sg-backend
sg-rds
```

Benefits:

- Easier maintenance
- Better security
- Automatic scaling compatibility

---

## Private Backend Layer

Backend instances:

- No public IP
- No internet exposure
- Accessible only from frontend tier

---

## Private Database Layer

RDS is:

- In private subnet
- Not publicly accessible
- Protected by dedicated security group

---

# 📈 Skills Demonstrated

### Cloud Networking

- VPC Design
- CIDR Planning
- Route Tables
- Internet Gateway

### Compute

- EC2
- Auto Scaling
- Launch Templates

### Security

- Security Groups
- Least Privilege Access
- Network Segmentation

### Database

- Amazon RDS
- Private Database Deployment

### High Availability

- Multi-AZ Design
- Load Balancing
- Fault Tolerance

---

# 📷 Screenshots

Add screenshots here:

### AWS Architecture

```text
screenshots/architecture.png
```

### VPC Dashboard

```text
screenshots/vpc.png
```

### Auto Scaling Groups

```text
screenshots/asg.png
```

### Load Balancer

```text
screenshots/alb.png
```

### RDS Database

```text
screenshots/rds.png
```

---

# 🚀 Future Improvements

- [ ] Terraform Migration
- [ ] AWS WAF
- [ ] CloudWatch Monitoring
- [ ] HTTPS with ACM
- [ ] Secrets Manager
- [ ] Bastion Host
- [ ] NAT Gateway
- [ ] ECS Migration
- [ ] EKS Migration
- [ ] CI/CD Pipeline

---

# 🎓 What I Learned

This project provided hands-on experience with:

- Production AWS architecture
- High availability design
- Network security principles
- Infrastructure automation
- Auto Scaling implementation
- AWS CLI deployment workflows

---

# 📜 License

MIT License

Feel free to use, modify, and learn from this project.

---

# 👨‍💻 Author

**CloudDreamers**

> Break Problems. Build Solutions.

⭐ If you found this project useful, consider starring the repository.
