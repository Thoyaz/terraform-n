resource "aws_route53_record" "roboshop_r53_records" {
  for_each = aws_instance.roboshop_servers
  zone_id  = var.zone_id
  name     = "${each.key}.${var.domain}" # mongodb.tzpc.site
  type     = "A"
  ttl      = 1
  records  = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]
  #records = [aws_instance.roboshop_servers[count.index].private_ip]
  allow_overwrite = true
}