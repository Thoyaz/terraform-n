resource "aws_instance" "tf-init-server" {
  ami                    = var.ami_id
  instance_type          = var.environment == "dev" ? "t3.micro" : "t3.small"
  vpc_security_group_ids = [aws_security_group.tf-sg.id]

  tags = var.tf_server_tags
}

resource "aws_security_group" "tf-sg" {
  name        = var.sg_name
  description = "As of now allowing all the traffic for TF servers"

  egress {
    from_port        = var.sg_e_ingress_from_port
    to_port          = var.sg_e_ingress_to_port
    protocol         = "-1"
    cidr_blocks      = var.sg_e_ingress_cidr_blocks
    ipv6_cidr_blocks = var.sg_e_ingress_ipv6_cidr_blocks
  }

  ingress {
    from_port        = var.sg_e_ingress_from_port
    to_port          = var.sg_e_ingress_to_port
    protocol         = "-1"
    cidr_blocks      = var.sg_e_ingress_cidr_blocks
    ipv6_cidr_blocks = var.sg_e_ingress_ipv6_cidr_blocks
  }

  tags = var.sg_tags
}
