provider "aws" {
  
}


resource "aws_instance" "philip" {
    ami = "ami-0e61f44baab8cec5a"
    instance_type = "t2.micro"
    key_name = "philipkey"
    tags = {
      Name = "philip"
    }
  
}