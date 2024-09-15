terraform {
  backend "s3" {
    bucket = "philipdon"
    key = "terraform-state"
    region = "ap-south-1"
    dynamodb_table = "terraform-state-lock-dynamo"
    encrypt = true

    
  }
}