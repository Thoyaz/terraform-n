resource "aws_instance" "tf-init-server" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = lookup(var.instance_type, local.environment)
  vpc_security_group_ids = [aws_security_group.tf-init-sg.id]

  tags = local.tags
}

resource "aws_security_group" "tf-init-sg" {
  name        = "allow all traffic ${local.environment}"
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
    Name = "allow all traffic TF ${local.environment}"
  }
}