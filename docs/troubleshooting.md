# Troubleshooting Guide

## Common Issues Faced

### 1. Wrong Availability Zone
**Error:** `Value (us-east-1a) for parameter availabilityZone is invalid`
**Fix:** Check your region with `aws configure get region` and use matching AZs

### 2. Empty Variables
**Error:** `expected one argument`
**Fix:** Variables reset on new terminal. Always run `source ~/aws-project-vars.sh` first

### 3. Wrong AMI ID
**Error:** `The image id does not exist`
**Fix:** AMI IDs are region-specific. Get correct one with:
`aws ec2 describe-images --owners amazon --filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" --query 'sort_by(Images,&CreationDate)[-1].ImageId'`

### 4. Health Check Failing (503)
**Fix:** Ensure user-data script installs and starts httpd, and /health endpoint exists

### 5. ASG Not Launching Instances
**Fix:** Check ASG points to correct launch template ID with:
`aws autoscaling describe-scaling-activities --auto-scaling-group-name frontend-asg`
