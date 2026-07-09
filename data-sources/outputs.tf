output "pip" {
  description = "Mongo server PIP"
  value       = data.aws_instance.mandodb-server-pip.public_ip
}