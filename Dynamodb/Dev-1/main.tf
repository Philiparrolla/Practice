provider "aws" {
  
}

resource "aws_instance" "Philip" {
    ami = "ami-0e53db6fd757e38c7"
    instance_type = "t2.micro"
    key_name = "philipkey"

    tags = {
      Name = "Philip"
    }
  
}

