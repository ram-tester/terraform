resource "aws_route53_record" "expense" {
  for_each        = aws_instance.this
  name            = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}"
  type            = "A"
  ttl             = 1
  zone_id         = var.zone_id
  records         = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]
  allow_overwrite = true
}