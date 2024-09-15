output "public" {
    value = "aws_instance.localname.public_ip"
    sensitive = true

  
}

output "privet" {
    value = "aws_instance.localname.public_ip"
    sensitive = false
  
}