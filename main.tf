provider "aws" {
  region = "us-east-2"
}
resource "aws_instance" "myfirst" {
  ami = "ami-0f2b4fc905b0bd1f1"
  instance_type ="t2.micro"
  key_name = "/home/google/secret/sam.pem"
  security_groups = ["launch-wizard-1"]
}
