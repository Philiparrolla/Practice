variable "ami" {
    description = "value of ami"
    default = "ami-0e53db6fd757e38c7"
    type = string
  
}

variable "instance_type" {
    description = "value"
    default = "t2.micro"
    type = string
  
}

variable "key_name" {
    description = "key name"
    default =  "philipkey"
    type = string 
}