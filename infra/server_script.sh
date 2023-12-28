#!/bin/bash

yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
cat <<EOF | sudo tee /var/www/html/index.html
<h1>Hello World, infra-aws-ec2!</h1>
EOF