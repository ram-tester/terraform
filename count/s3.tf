resource "aws_route53_record" "expense" {
  count = length(var.instances_type)
  zone_id = var.zone_id
  name    = "${var.instances_type[count.index]}.${var.domain}"
  type    = "A"
  ttl     =  1
  records = [aws_instance.expense[count.index].private_ip]
  allow_overwrite = true
}

resource "aws_route53_record" "frontend" {
  zone_id = var.zone_id
  name    = var.domain
  type    = "A"
  ttl     =  1
  records = [aws_instance.expense[2].public_ip]
  allow_overwrite = true
}