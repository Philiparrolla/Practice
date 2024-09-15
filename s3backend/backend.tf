terraform {
  backend "s3" {
    bucket = "philipdon"
    key = "terraform.tfstate"
    region = "ap-south-1"
    
  }
}