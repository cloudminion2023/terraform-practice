provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example_bucket" {
  count  = var.check_duplicate ? 1 : 0
  bucket = "example-bucket-cloudminion-github"
}

resource "aws_security_group" "allow_rdp" {
  name        = "allow_rdp"
  description = "Allow RDP traffic"

  ingress {
    description = "Allow rdp"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
  ami           = "ami-07d9456e59793a7d5" # Replace with your desired Windows AMI
  instance_type = "t2.micro"
  key_name      = "my-key-pair" # Replace with your key pair name

  security_groups = [aws_security_group.allow_rdp.id]

  tags = {
    Name = "My Windows Instance"
  }
}
