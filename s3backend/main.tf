provider "aws" {
  
}


resource "aws_instance" "inst" {

    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name

    tags = {
      Name = "don"
    }

  
}