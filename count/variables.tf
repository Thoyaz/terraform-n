variable "server_names" {
  type    = list(string)
  default = ["mongodb", "catalogue", "frontend", "redis", "user", "cart", "mysql", "shipping", "rabbitmq","payment"]
}

variable "zone_id" {
    type = string
    default = "Z09672091YAIYC4ECS2IK"
}

variable "domain" {
    type = string
    default = "tzpc.site"
}
