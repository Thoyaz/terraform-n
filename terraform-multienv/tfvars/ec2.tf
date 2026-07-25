resource "aws_instance" "tf-init-server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.tf-init-sg.id]

  tags = {
    Name    = "Terraform Init Server ${var.environment}"
    Env     = var.environment
    Project = "roboshop-${var.environment}"
  }
}

resource "aws_security_group" "tf-init-sg" {
  name        = "allow all traffic ${var.environment}"
  description = "allow all traffic terraform"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow all traffic TF ${var.environment}"
  }
}