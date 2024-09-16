provider "aws" {
  region = "ap-south-1"
}

#Another provider alias 
provider "aws" {
  region = "us-east-1"
  alias = "america"
}

resource "aws_s3_bucket" "test" {
  bucket = "ammuuuuu"

}
resource "aws_s3_bucket" "test2" {
  bucket = "mummyyyyyy"
  provider = aws.america  #provider.value of alias
  
}