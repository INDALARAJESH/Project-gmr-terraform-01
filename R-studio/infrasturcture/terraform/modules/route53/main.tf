data "aws_route53_zone" "primary" {
  name = var.domain_name
}

resource "aws_route53_record" "cname_record" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = "${var.subdomain}.${var.domain_name}"
  type    = "CNAME"
  ttl     = "300"
  records = [var.load_balancer_dns_name]
}
