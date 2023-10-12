provider "aws" {
  region = "eu-west-3"
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}


resource "aws_instance" "example" {
  ami           = "ami-0f014d1f920a73971"
  instance_type = "t2.micro"

  tags = {
    Name = "MonExempleVM"
  }
}

output "instance_ip" {
  value = aws_instance.example.public_ip
}

output "ssh_user" {
  value = "ec2-user"
}

