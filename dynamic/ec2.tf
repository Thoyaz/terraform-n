resource "aws_instance" "roboshop_servers" {
  for_each               = var.server-names
  ami                    = "ami-0220d79f3f480ecf5"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.roboshop_sg.id]

  tags = {
    Name    = each.key
    Env     = "Dev"
    Project = "roboshop"
  }
}

resource "aws_security_group" "roboshop_sg" {
  name        = "allow all Roboshop"
  description = "allow all traffic terraform"


  dynamic "egress" {
    for_each = var.allow-ports
    content {
      from_port   = egress.value.port
      to_port     = egress.value.port
      protocol    = "tcp"
      cidr_blocks = egress.value.cidr_block
    }
  }

  dynamic "ingress" {
    for_each = var.allow-ports
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ingress.value.cidr_block
    }
  }

  tags = {
    Name = "allow all traffic TF"
  }
}