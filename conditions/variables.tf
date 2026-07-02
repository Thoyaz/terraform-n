variable "environment" {
  default = "prod"
}

variable "ami_id" {
  type        = string
  default     = "ami-0220d79f3f480ecf5"
  description = "AMI ID for TF Servers"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "instance type of the TF  servers"
}

variable "tf_server_tags" {
  type = map(any)
  default = {
    Name      = "TF Init Server"
    Env       = "Dev"
    Project   = "roboshop"
    Terraform = "true"
  }
  description = "tags of TF server"
}

variable "sg_name" {
  type        = string
  default     = "Allow All Traffic"
  description = "Allow all traffic for the TF servers"
}

variable "sg_e_ingress_from_port" {
  type    = number
  default = 0
}

variable "sg_e_ingress_to_port" {
  type    = number
  default = 0
}

variable "sg_e_ingress_cidr_blocks" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

variable "sg_e_ingress_ipv6_cidr_blocks" {
  type    = list(any)
  default = ["::/0"]
}

variable "sg_tags" {
  type = map(any)
  default = {
    Name      = "Allow All Trafform for TF"
    Terraform = "true"
  }
}