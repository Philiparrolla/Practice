provider "aws" {
  
}



data "aws_subnet" "subnet" {
    id = "subnet-05208f700384d1bac"
  
}


resource "aws_instance" "philip" {
    ami = "ami-0e53db6fd757e38c7"
    instance_type = "t2.micro"
    key_name = "philipkey"
    subnet_id = data.aws_subnet.subnet.id
  
}