resource "aws_instance" "roboshop_servers" {
  #   for_each               = var.server-names
  for_each               = var.server-names-set
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
    Name = "allow all traffic TF"
  }
}