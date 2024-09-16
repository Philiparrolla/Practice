provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0182f373e66f89c85"  # Replace with your AMI ID
  instance_type = "t2.micro"
  key_name = "ammu"
  # User Data to install Apache Web Server
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "Hello from Terraform" > /var/www/html/index.html
              EOF

  tags = {
    Name = "Terraform-EC2-Instance"
  }
}
