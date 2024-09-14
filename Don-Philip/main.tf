provider "aws" {
  
}


resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      name = "philip"
    }
  
}

resource "aws_subnet" "subnet" {
    cidr_block = "10.0.0.0/24"
    vpc_id = aws_vpc.vpc.id
    availability_zone = "ap-south-1a"
    tags = {
      name= "subnet-pub"
    }
  
}

resource "aws_internet_gateway" "internet" {
    vpc_id = aws_vpc.vpc.id
  
}

resource "aws_route_table" "rout" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet.id
    }
  
}

resource "aws_route_table_association" "rout" {
    subnet_id = aws_subnet.subnet.id
    route_table_id = aws_route_table.rout.id
  
}
  

resource "aws_security_group" "philip" {
    vpc_id = aws_vpc.vpc.id
    tags = {
      name = "philip_sg"
    }
  




ingress {
    description= "TLS from vpc"

  from_port=80
  to_port=80
  protocol="TCP"
  cidr_blocks = ["0.0.0.0/0"]  
}

ingress{
    description="TLS from vpc"
    from_port=22
    to_port=22
    protocol="TCP"
    cidr_blocks = ["0.0.0.0/0"]

}


egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}

}


resource "aws_subnet" "subnet-pvt" {
    availability_zone = "ap-south-1b"
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.vpc.id
  
}

resource "aws_route_table" "rout-pvt" {
    vpc_id = aws_vpc.vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-my.id
  }
}


resource "aws_nat_gateway" "nat-my" {
    connectivity_type = "public"
    subnet_id = aws_subnet.subnet-pvt.id
    allocation_id = aws_eip.eip.id

  
}

resource "aws_route_table_association" "rout-pvt" {
    route_table_id = aws_route_table.rout-pvt.id
    subnet_id = aws_subnet.subnet-pvt.id
  
}

resource "aws_eip" "eip" {
    tags = {
      Name = "eip"
    }
  
}

resource "aws_instance" "Publice" {
    ami = "ami-0e53db6fd757e38c7"
    instance_type = "t2.micro"
    key_name = "philipkey"
    security_groups = [aws_security_group.philip.id]
    associate_public_ip_address = true
    subnet_id = aws_subnet.subnet.id
    tags = {
      Name ="Public"
    }
    
    }   


resource "aws_instance" "privet" {
    ami = "ami-0e53db6fd757e38c7"
    instance_type = "t2.micro"
    key_name = "philipkey"
    security_groups = [aws_security_group.philip.id]
    associate_public_ip_address = true
    subnet_id = aws_subnet.subnet-pvt.id
    tags = {
        Name ="privet"

    }
    
  
}

