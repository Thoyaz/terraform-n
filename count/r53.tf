resource "aws_route53_record" "roboshop_r53_records" {
  count = length(var.server_names)
  zone_id = var.zone_id
  name    = "${var.server_names[count.index]}.${var.domain}" # mongodb.tzpc.site
  type    = "A"
  ttl     = 1
  records = var.server_names[count.index] == "frontend" ? [aws_instance.roboshop_servers[count.index].public_ip] : [aws_instance.roboshop_servers[count.index].private_ip]
  #records = [aws_instance.roboshop_servers[count.index].private_ip]
}