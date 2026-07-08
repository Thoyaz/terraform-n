variable "server-names" {
    type = map
    value = {
        mongodb = "t3.micro"
        mysql = "t2.micro"
    }
}