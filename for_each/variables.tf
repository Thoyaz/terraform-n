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