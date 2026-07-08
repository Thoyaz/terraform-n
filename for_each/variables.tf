variable "server-names" {
  type = map(any)
  default = {
    mongodb = "t3.micro"
    mysql   = "t2.micro"
  }
}

variable "server-names-set" {
  type    = set(string)
  default = ["mongodb", "msql"]
}

variable "zone_id" {
  type    = string
  default = "Z09672091YAIYC4ECS2IK"
}

variable "domain" {
  type    = string
  default = "tzpc.site"
}