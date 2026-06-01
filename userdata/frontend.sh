#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo 'OK' > /var/www/html/health
echo '<h1>AWS 3-Tier App - Frontend Running!</h1><p>Instance: '$(hostname)'</p>' > /var/www/html/index.html
