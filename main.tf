provider "aws" {
region = "ap-southeast-1"
access_key = "AKIA6ODU56BRJBFZ6AN3"
secret_key = "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"
}

resource "aws_instance" "one" {
ami = "ami-0702b1aec03c6a3a4"
instance_type = "t2.medium"
key_name = "Singapore"
vpc_security_group_ids = [aws_security_group.three.id]
availability_zone = "ap-southeast-1a"
user_data = <<EOF
              #!/bin/bash
               sudo yum update -y
               sudo yum install httpd -y
               sudo systemctl start httpd 
               sudo chkconfig httpd on
               sudo echo "Hello All This is My Netflix-1 Web-Application Created by Terraform infrastructure by Java Home Cloud Server-1" > /var/www/html/index.html
EOF
tags = {
Name = "Netflix-1"
}
}

resource "aws_instance" "two" {
ami = "ami-0702b1aec03c6a3a4"
instance_type = "t2.medium"
key_name = "Singapore"
vpc_security_group_ids = [aws_security_group.three.id]
availability_zone = "ap-southeast-1b"
user_data = <<EOF
           #!/bin/bash
           sudo yum update -y
           sudo yum install httpd -y
           sudo systemctl start httpd
           sudo chkconfig httpd on
           sudo echo "Hello All This is My Netflix-2 Web-Application Created by Terraform Infrastructute By Java Home Cloud Server-2" > /var/www/html/index.html
EOF
tags = {
Name = "Netflix-2"
}
}

