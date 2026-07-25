locals {
    environment = terraform.workspace
    tags = {
        Name    = "Terraform Init Server"
        Env     = "Dev"
        Project = "roboshop"
        environment = local.environment
  }
}