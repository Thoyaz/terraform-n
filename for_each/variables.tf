variable "server-names" {
    type = map
    default = {
        mongodb = "t3.micro"
        mysql = "t2.micro"
    }
}