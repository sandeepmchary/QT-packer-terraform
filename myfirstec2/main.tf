provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "example" {
  ami = "ami-0f2b4fc905b0bd1f1"
  instance_type = "t2.micro"
  user_data = <<-EOF
                #!/bin/bash
                echo "Hello, World" > index.html
                nohup busybox httpd -f -p 8080 &
                EOF
  tags ={
      Name = "my-first"
  }
}
