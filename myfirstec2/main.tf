provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "example" {
  ami = "ami-0f2b4fc905b0bd1f1"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]
  user_data = <<-EOF
                #!/bin/bash
                echo "Hello, World" > index.html
                nohup busybox httpd -f -p 8080 &
                EOF
  tags ={
      Name = "my-first"
  }
}
resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
  ingress{
      from_port=8080
      to_port=8080
      protocol="tcp"
      cidr_blocks=["0.0.0.0/0"]
  }
}
