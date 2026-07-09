variable "server-names" {
  type = map(any)
  default = {
    mongodb = "t3.micro"
  }
}

# variable "allow-ports" {
#   type = list(string)
#   default = [22, 8080, 443, 80]
# }

variable "allow-ports" {
  type = list(object({
    port       = number
    cidr_block = list(string)
  }))
  default = [
    {
      port       = 22
      cidr_block = ["0.0.0.0/0"]
    },
    {
      port       = 8080
      cidr_block = ["0.0.0.0/0"]
    },
    {
      port       = 443
      cidr_block = ["0.0.0.0/0"]
    },
    {
      port       = 80
      cidr_block = ["0.0.0.0/0"]
    }
  ]
}

variable "zone_id" {
  type    = string
  default = "Z09672091YAIYC4ECS2IK"
}

variable "domain" {
  type    = string
  default = "tzpc.site"
}